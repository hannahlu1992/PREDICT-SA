clear
close all force

addpath("mrst");
run startup.m

mrstModule add mrst-gui coarsegrid upscaling incomp mpfa
mrstVerbose off

addpath(genpath("predict-main"));

%% sampling for a CSS:  |sand\   sand|
%%                      |clay \      | 
generate_for_folder('../CSS/data/')
generate_for_folder('../CSS/data_hat/');
generate_for_folder('../CSS/data1/');
generate_for_folder('../CSS/data2/');
generate_for_folder('../CSS/data3/');
generate_for_folder('../CSS/data4/');
generate_for_folder('../CSS/data5/');
generate_for_folder('../CSS/data6/');



%% sampling for a CSC:  |sand\   clay|
%%                      |clay \      | 
generate_for_folder('../CSC/data/');
generate_for_folder('../CSC/data_hat/');
generate_for_folder('../CSC/data1/');
generate_for_folder('../CSC/data2/');
generate_for_folder('../CSC/data3/');
generate_for_folder('../CSC/data4/');
generate_for_folder('../CSC/data5/');
generate_for_folder('../CSC/data6/');

%% sampling for a SCC:  |clay\   clay|
%%                      |sand \      | 
generate_for_folder('../SCC/data/')
generate_for_folder('../SCC/data_hat/');
generate_for_folder('../SCC/data1/');
generate_for_folder('../SCC/data2/');
generate_for_folder('../SCC/data3/');
generate_for_folder('../SCC/data4/');
generate_for_folder('../SCC/data5/');
generate_for_folder('../SCC/data6/');

%% sampling for a SCS:  |clay\   sand|
%%                      |sand \      | 
generate_for_folder('../SCS/data/');
generate_for_folder('../SCS/data_hat/');
generate_for_folder('../SCS/data1/');
generate_for_folder('../SCS/data2/');
generate_for_folder('../SCS/data3/');
generate_for_folder('../SCS/data4/');
generate_for_folder('../SCS/data5/');
generate_for_folder('../SCS/data6/');


function generate_for_folder(FolderName)
    filepath = fullfile(FolderName, 'params.mat');
    load(filepath);
    Nmc = length(Zf);
    for i = 1:Nmc
        thickness = {[50 50], [100]};                % [m]
        vcl       = {[Vcl_fw_bot(i) Vcl_fw_top(i)], ...
                     [Vcl_hw(i)]};                        % fraction [-]
        dip       = [0, 0];                                                        % [deg.]
        faultDip  = FaultDip(i);                                                             % [deg.]
        zf        = [Zf(i), Zf(i)];                                                     % [FW, HW], [m]
        zmax      = {repelem(Zmax(i), numel(vcl{1})), repelem(Zmax(i), numel(vcl{2}))};   % {FW, HW}
        dim       = 2;                    % dimensions (2 = 2D, 3 = 3D)
        unit_plot = 'm';                  % 'm' or 'cm' depending on fault dimensions
    
        maxPerm = 1000;                 % [mD]
        rho     = 0.6;                  % Corr. coeff. for multivariate distributions
    
        U.useAcceleration = 1;          % 1 requires MEX setup, 0 otherwise (slower for MPFA).
        U.method          = 'mpfa';     % 'tpfa' recommended if useAcceleration = 0
        U.outflux         = 0;          % compare outflux of fine and upscaled model
        U.ARcheck         = 0;          % check if Perm obtained with grid with aspect ratio of 
                                        % only 5 gives same output.
        U.coarseDims      = [1 1 1];    % Mandatory one cell if 2D
        Nsim              = 1000;       % Number of simulations/realizations
    
        footwall = Stratigraphy(thickness{1}, vcl{1}, 'Dip', dip(1), ...
                                'DepthFaulting', zf(1), 'DepthBurial', zmax{1});
        hangingwall = Stratigraphy(thickness{2}, vcl{2}, 'Dip', dip(2), 'IsHW', 1, ...
                                   'NumLayersFW', footwall.NumLayers, ...
                                   'DepthFaulting', zf(2), 'DepthBurial', zmax{2});
    
        mySect = FaultedSection(footwall, hangingwall, faultDip, 'maxPerm', maxPerm);
        mySect = mySect.getMatPropDistr();
    
        D = sum(mySect.Tap(mySect.FW.Id));
        T0 = 1;
        G0 = makeFaultGrid(T0, D);
    
        faults = cell(Nsim, 1);
        smears = cell(Nsim, 1);
        tstart = tic;
        parfor n=1:Nsim    % parfor allowed if you have the parallel computing toolbox
        %for n=1:Nsim
            myFault = Fault2D(mySect, faultDip);
    
            % Get material property (intermediate variable) samples, and fix 
            % along-strike thickness of current realization if 3D.
            myFault = myFault.getMaterialProperties(mySect, 'corrCoef', rho);
    
            % Update grid dimensions with sampled fault thickness
            G = updateGrid(G0, myFault.MatProps.thick);
    
            % Generate smear object with T, Tap, L, Lmax
            smear = Smear(mySect, myFault, G, 1);
    
            % Place fault materials and assign cell-based properties
            myFault = myFault.placeMaterials(mySect, smear, G);
    
            % Compute upscaled permeability distribution
            myFault = myFault.upscaleProps(G, U);
    
            % Save result
            faults{n} = myFault;
            smears{n} = smear;
            if mod(n, 100) == 0
                disp(['Simulation ' num2str(n) ' / ' num2str(Nsim) ' completed.'])
            end
        end
        telapsed = toc(tstart);
    
        %% save data
        [~, grandParentFolder] = fileparts(fileparts(fileparts(FolderName)));  % gets e.g.,'CSC'
        filename = sprintf('%s_%d',grandParentFolder,i);
        filepath = fullfile(FolderName, filename);

        perm = zeros(10000,2,Nsim);
        Perm = zeros(3,Nsim);
        for n = 1:Nsim
            %perm{n}.G = updateGrid(G0, faults{n}.MatProps.thick);
            perm(:,:,n) = faults{n}.Grid.perm(:,[1,3]);
            Perm(:,n) = faults{n}.Perm';
        end
        save(filepath, 'vcl', 'dip','faultDip','zf', 'zmax','perm','Perm');
    end
end
