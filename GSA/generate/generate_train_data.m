clear
close all force

addpath("mrst");
run startup.m

mrstModule add mrst-gui coarsegrid upscaling incomp mpfa
mrstVerbose off

addpath(genpath("predict-main"));

%% sampling for a CSS:  |sand\   sand|
%%                      |clay \      |
Nmc = 25;
Vcl_fw_bot = 0.5+(0.9-0.5).* rand(Nmc,1);
Vcl_fw_top = 0.1+(0.3-0.1).* rand(Nmc,1);
Vcl_hw = 0.1+(0.3-0.1).* rand(Nmc,1);
FaultDip = 50+(80-50).* rand(Nmc,1);
Zf = 200+(1000-200).* rand(Nmc,1);
Zmax = 1000+(3000-1000).* rand(Nmc,1);
params_CSS = struct('Vcl_fw_bot', Vcl_fw_bot,...
    'Vcl_fw_top',Vcl_fw_top,...
    'Vcl_hw',Vcl_hw,...
    'FaultDip',FaultDip,...
    'Zf',Zf,...
    'Zmax',Zmax);
[perm_CSS,Perm_CSS] = generate_(params_CSS);

%% sampling for a CSC:  |sand\   clay|
%%                      |clay \      | 
Vcl_fw_bot = 0.5+(0.9-0.5).* rand(Nmc,1);
Vcl_fw_top = 0.1+(0.3-0.1).* rand(Nmc,1);
Vcl_hw = 0.5+(0.9-0.5).* rand(Nmc,1);
FaultDip = 50+(80-50).* rand(Nmc,1);
Zf = 200+(1000-200).* rand(Nmc,1);
Zmax = 1000+(3000-1000).* rand(Nmc,1);
params_CSC = struct('Vcl_fw_bot', Vcl_fw_bot,...
    'Vcl_fw_top',Vcl_fw_top,...
    'Vcl_hw',Vcl_hw,...
    'FaultDip',FaultDip,...
    'Zf',Zf,...
    'Zmax',Zmax);
[perm_CSC,Perm_CSC] = generate_(params_CSC);

%% sampling for a SCC:  |clay\   clay|
%%                      |sand \      | 
Vcl_fw_bot = 0.1+(0.3-0.1).* rand(Nmc,1);
Vcl_fw_top = 0.5+(0.9-0.5).* rand(Nmc,1);
Vcl_hw = 0.5+(0.9-0.5).* rand(Nmc,1);
FaultDip = 50+(80-50).* rand(Nmc,1);
Zf = 200+(1000-200).* rand(Nmc,1);
Zmax = 1000+(3000-1000).* rand(Nmc,1);
params_SCC = struct('Vcl_fw_bot', Vcl_fw_bot,...
    'Vcl_fw_top',Vcl_fw_top,...
    'Vcl_hw',Vcl_hw,...
    'FaultDip',FaultDip,...
    'Zf',Zf,...
    'Zmax',Zmax);
[perm_SCC,Perm_SCC] = generate_(params_SCC);

%% sampling for a SCS:  |clay\   sand|
%%                      |sand \      | 
Vcl_fw_bot = 0.1+(0.3-0.1).* rand(Nmc,1);
Vcl_fw_top = 0.5+(0.9-0.5).* rand(Nmc,1);
Vcl_hw = 0.1+(0.3-0.1).* rand(Nmc,1);
FaultDip = 50+(80-50).* rand(Nmc,1);
Zf = 200+(1000-200).* rand(Nmc,1);
Zmax = 1000+(3000-1000).* rand(Nmc,1);
params_SCS = struct('Vcl_fw_bot', Vcl_fw_bot,...
    'Vcl_fw_top',Vcl_fw_top,...
    'Vcl_hw',Vcl_hw,...
    'FaultDip',FaultDip,...
    'Zf',Zf,...
    'Zmax',Zmax);
[perm_SCS,Perm_SCS] = generate_(params_SCS);

save('../surrogate-training/training_data.mat','params_CSS','params_CSC','params_SCC','params_SCS',...
    'perm_CSS','perm_CSC','perm_SCC','perm_SCS',...
    'Perm_CSS','Perm_CSC','Perm_SCC','Perm_SCS');

function [perm,Perm] = generate_(params)
    [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax] = deal(params.Vcl_fw_bot,...
        params.Vcl_fw_top,params.Vcl_hw,params.FaultDip,params.Zf,params.Zmax);
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
        Nsim              = 100;       % Number of simulations/realizations
    
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

        perm = zeros(10000,2,Nsim);
        Perm = zeros(3,Nsim);
        for n = 1:Nsim
            %perm{n}.G = updateGrid(G0, faults{n}.MatProps.thick);
            perm(:,:,n) = faults{n}.Grid.perm(:,[1,3]);
            Perm(:,n) = faults{n}.Perm';
        end
    end
end