clear
close all force

addpath("/Users/hannahlu/Dropbox/MIT/Research/CCS-UQ/mrst-developer");
run startup.m

mrstModule add mrst-gui coarsegrid upscaling incomp mpfa
mrstVerbose off

%% sampling for a |sand\   clay|
%%                |clay \      |
%% Baseline
Vcl_fw_bot = 0.7;
Vcl_fw_top = 0.2;
Vcl_hw = 0.7;
FaultDip = 65;
Zf = 600;
Zmax = 2000;
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('CSC_baseline.mat', 'kxx','kzz','params');
%% p1 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot+0.2,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot+0.2,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('CSC_p1+.mat', 'kxx','kzz','params');
%% p1 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot-0.2,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot-0.2,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('CSC_p1-.mat', 'kxx','kzz','params');
%% p2 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top+0.1,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top+0.1,Vcl_hw,FaultDip,Zf,Zmax];
save('CSC_p2+.mat', 'kxx','kzz','params');
%% p2 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top-0.1,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top-0.1,Vcl_hw,FaultDip,Zf,Zmax];
save('CSC_p2-.mat', 'kxx','kzz','params');
%% p3 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw+0.2,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw+0.2,FaultDip,Zf,Zmax];
save('CSC_p3+.mat', 'kxx','kzz','params');
%% p3 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw-0.2,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw-0.2,FaultDip,Zf,Zmax];
save('CSC_p3-.mat', 'kxx','kzz','params');
%% p4 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip+15,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip+15,Zf,Zmax];
save('CSC_p4+.mat', 'kxx','kzz','params');
%% p4 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip-15,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip-15,Zf,Zmax];
save('CSC_p4-.mat', 'kxx','kzz','params');
%% p5 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf+400,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf+400,Zmax];
save('CSC_p5+.mat', 'kxx','kzz','params');
%% p5 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf-400,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf-400,Zmax];
save('CSC_p5-.mat', 'kxx','kzz','params');
%% p6 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax+1000);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax+1000];
save('CSC_p6+.mat', 'kxx','kzz','params');
%% p6 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax-1000);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax-1000];
save('CSC_p6-.mat', 'kxx','kzz','params');

%% sampling for a |sand\   sand|
%%                |clay \      |
%% Baseline
Vcl_fw_bot = 0.7;
Vcl_fw_top = 0.2;
Vcl_hw = 0.2;
FaultDip = 65;
Zf = 600;
Zmax = 2000;
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('CSS_baseline.mat', 'kxx','kzz','params');
%% p1 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot+0.2,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot+0.2,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('CSS_p1+.mat', 'kxx','kzz','params');
%% p1 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot-0.2,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot-0.2,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('CSS_p1-.mat', 'kxx','kzz','params');
%% p2 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top+0.1,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top+0.1,Vcl_hw,FaultDip,Zf,Zmax];
save('CSS_p2+.mat', 'kxx','kzz','params');
%% p2 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top-0.1,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top-0.1,Vcl_hw,FaultDip,Zf,Zmax];
save('CSS_p2-.mat', 'kxx','kzz','params');
%% p3 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw+0.1,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw+0.1,FaultDip,Zf,Zmax];
save('CSS_p3+.mat', 'kxx','kzz','params');
%% p3 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw-0.1,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw-0.1,FaultDip,Zf,Zmax];
save('CSS_p3-.mat', 'kxx','kzz','params');
%% p4 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip+15,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip+15,Zf,Zmax];
save('CSS_p4+.mat', 'kxx','kzz','params');
%% p4 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip-15,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip-15,Zf,Zmax];
save('CSS_p4-.mat', 'kxx','kzz','params');
%% p5 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf+400,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf+400,Zmax];
save('CSS_p5+.mat', 'kxx','kzz','params');
%% p5 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf-400,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf-400,Zmax];
save('CSS_p5-.mat', 'kxx','kzz','params');
%% p6 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax+1000);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax+1000];
save('CSS_p6+.mat', 'kxx','kzz','params');
%% p6 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax-1000);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax-1000];
save('CSS_p6-.mat', 'kxx','kzz','params');

%% sampling for a |clay\   sand|
%%                |sand \      |
%% Baseline
Vcl_fw_bot = 0.2;
Vcl_fw_top = 0.7;
Vcl_hw = 0.2;
FaultDip = 65;
Zf = 600;
Zmax = 2000;
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('SCS_baseline.mat', 'kxx','kzz','params');
%% p1 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot+0.1,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot+0.1,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('SCS_p1+.mat', 'kxx','kzz','params');
%% p1 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot-0.1,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot-0.1,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('SCS_p1-.mat', 'kxx','kzz','params');
%% p2 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top+0.2,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top+0.2,Vcl_hw,FaultDip,Zf,Zmax];
save('SCS_p2+.mat', 'kxx','kzz','params');
%% p2 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top-0.2,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top-0.2,Vcl_hw,FaultDip,Zf,Zmax];
save('SCS_p2-.mat', 'kxx','kzz','params');
%% p3 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw+0.1,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw+0.1,FaultDip,Zf,Zmax];
save('SCS_p3+.mat', 'kxx','kzz','params');
%% p3 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw-0.1,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw-0.1,FaultDip,Zf,Zmax];
save('SCS_p3-.mat', 'kxx','kzz','params');
%% p4 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip+15,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip+15,Zf,Zmax];
save('SCS_p4+.mat', 'kxx','kzz','params');
%% p4 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip-15,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip-15,Zf,Zmax];
save('SCS_p4-.mat', 'kxx','kzz','params');
%% p5 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf+400,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf+400,Zmax];
save('SCS_p5+.mat', 'kxx','kzz','params');
%% p5 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf-400,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf-400,Zmax];
save('SCS_p5-.mat', 'kxx','kzz','params');
%% p6 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax+1000);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax+1000];
save('SCS_p6+.mat', 'kxx','kzz','params');
%% p6 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax-1000);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax-1000];
save('SCS_p6-.mat', 'kxx','kzz','params');

%% sampling for a |clay\   clay|
%%                |sand \      |
%% Baseline
Vcl_fw_bot = 0.2;
Vcl_fw_top = 0.7;
Vcl_hw = 0.7;
FaultDip = 65;
Zf = 600;
Zmax = 2000;
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('SCC_baseline.mat', 'kxx','kzz','params');
%% p1 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot+0.1,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot+0.1,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('SCC_p1+.mat', 'kxx','kzz','params');
%% p1 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot-0.1,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot-0.1,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax];
save('SCC_p1-.mat', 'kxx','kzz','params');
%% p2 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top+0.2,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top+0.2,Vcl_hw,FaultDip,Zf,Zmax];
save('SCC_p2+.mat', 'kxx','kzz','params');
%% p2 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top-0.2,Vcl_hw,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top-0.2,Vcl_hw,FaultDip,Zf,Zmax];
save('SCC_p2-.mat', 'kxx','kzz','params');
%% p3 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw+0.2,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw+0.2,FaultDip,Zf,Zmax];
save('SCC_p3+.mat', 'kxx','kzz','params');
%% p3 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw-0.2,FaultDip,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw-0.2,FaultDip,Zf,Zmax];
save('SCC_p3-.mat', 'kxx','kzz','params');
%% p4 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip+15,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip+15,Zf,Zmax];
save('SCC_p4+.mat', 'kxx','kzz','params');
%% p4 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip-15,Zf,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip-15,Zf,Zmax];
save('SCC_p4-.mat', 'kxx','kzz','params');
%% p5 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf+400,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf+400,Zmax];
save('SCC_p5+.mat', 'kxx','kzz','params');
%% p5 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf-400,Zmax);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf-400,Zmax];
save('SCC_p5-.mat', 'kxx','kzz','params');
%% p6 +
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax+1000);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax+1000];
save('SCC_p6+.mat', 'kxx','kzz','params');
%% p6 -
[kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax-1000);
params = [Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax-1000];
save('SCC_p6-.mat', 'kxx','kzz','params');



function [kxx,kzz] = twoD2layer(Vcl_fw_bot,Vcl_fw_top,Vcl_hw,FaultDip,Zf,Zmax)
    thickness = {[50 50], [100]};                % [m]
    vcl       = {[Vcl_fw_bot Vcl_fw_top], ...
                 [Vcl_hw]};                        % fraction [-]
    dip       = [0, 0];                                                        % [deg.]
    faultDip  = FaultDip;                                                             % [deg.]
    zf        = [Zf, Zf];                                                     % [FW, HW], [m]
    zmax      = {repelem(Zmax, numel(vcl{1})), repelem(Zmax, numel(vcl{2}))};   % {FW, HW}
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
    %parfor n=1:Nsim    % parfor allowed if you have the parallel computing toolbox
    for n=1:Nsim
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
    
    % %% 3. Output Analysis
    % % 3.1 Visualize stratigraphy and fault (with thickness corresponding to 1st realization)
    % mySect.plotStrati(faults{1}.MatProps.thick, faultDip, unit_plot);  
    % 
    % % 3.2 Visualize intermediate variables
    % % We define a given parent material (id from 1 to n of materials in stratigraphy), 
    % % and generate histograms and correlation matrix plots.
    % layerId = 1;                                            
    % plotMatPropsHist(faults, smears, mySect, layerId, dim) 
    % % MatProps correlations
    % [R, P] = plotMatPropsCorr(faults, mySect, layerId, dim);
    % 
    % % 3.3 Visualize fault materials
    % % Visualization for one realization. Choice can be 'randm' (random), 'maxX' 
    % % (realization with maximum upscaled permeability in across the fault), 'minX', 
    % % 'maxZ' or 'minZ'.
    % % General fault materials and perm view
    % plotId = selectSimId('randm', faults, Nsim);                % simulation index
    % faults{plotId}.plotMaterials(mySect, G0) 
    % 
    % % 3.4. Visualize upscaled permeability
    % % Plot upscaled permeability distributions (all simulations)
    % plotUpscaledPerm(faults, dim)

    % %% save data
    % filename = sprintf('CSC_%d.mat',i+1000);
    % perm = zeros(10000,2,Nsim);
    % Perm = zeros(3,Nsim);
    % for n = 1:Nsim
    %     %perm{n}.G = updateGrid(G0, faults{n}.MatProps.thick);
    %     perm(:,:,n) = faults{n}.Grid.perm(:,[1,3]);
    %     Perm(:,n) = faults{n}.Perm';
    % end
    % save(filename, 'vcl', 'dip','faultDip','zf', 'zmax','perm','Perm');
    
    kxx = zeros(Nsim,1);
    kzz = zeros(Nsim,1);
    for n = 1:Nsim
        kxx(n) = faults{n}.Perm(1);
        kzz(n) = faults{n}.Perm(3);
    end
end

