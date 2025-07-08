%% this matlab code generate params.mat for each configuration folder
%% WARNING: don't overwrite!

Nmc = 1000;
%% sampling for a CSC:  |sand\   clay|
%%                      |clay \      | 
% TwoLayerConfig('C','S','C',Nmc);

%% sampling for a CSS:  |sand\   sand|
%%                      |clay \      | 
TwoLayerConfig('C','S','S',Nmc);

%% sampling for a SCC:  |clay\   clay|
%%                      |sand \      | 
TwoLayerConfig('S','C','C',Nmc);

%% sampling for a SCS:  |clay\   sand|
%%                      |sand \      | 
TwoLayerConfig('S','C','S',Nmc);



function TwoLayerConfig(fw_bot,fw_top,hw,Nmc)
    Vcl_fw_bot = material_sampling(fw_bot,Nmc);
    Vcl_fw_top = material_sampling(fw_top,Nmc);
    Vcl_hw = material_sampling(hw,Nmc);
    FaultDip = 50+(80-50).* rand(Nmc,1);
    Zf = 200+(1000-200).* rand(Nmc,1);
    Zmax = 1000+(3000-1000).* rand(Nmc,1);
    filename = sprintf('../%s%s%s/data/params.mat', fw_bot, fw_top, hw);
    save(filename,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','FaultDip','Zf','Zmax');
    clear Vcl_fw_bot Vcl_fw_top Vcl_hw FaultDip Zf Zmax

    Vcl_fw_bot = material_sampling(fw_bot,Nmc);
    Vcl_fw_top = material_sampling(fw_top,Nmc);
    Vcl_hw = material_sampling(hw,Nmc);
    FaultDip = 50+(80-50).* rand(Nmc,1);
    Zf = 200+(1000-200).* rand(Nmc,1);
    Zmax = 1000+(3000-1000).* rand(Nmc,1);
    filename_hat = sprintf('../%s%s%s/data_hat/params.mat', fw_bot, fw_top, hw);
    save(filename_hat,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','FaultDip','Zf','Zmax');
    clear Vcl_fw_bot Vcl_fw_top Vcl_hw FaultDip Zf Zmax

    load(filename_hat,'Vcl_fw_top','Vcl_hw','FaultDip','Zf','Zmax');
    load(filename,'Vcl_fw_bot');
    filename1 = sprintf('../%s%s%s/data1/params.mat', fw_bot, fw_top, hw);
    save(filename1,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','FaultDip','Zf','Zmax');
    clear Vcl_fw_bot Vcl_fw_top Vcl_hw FaultDip Zf Zmax

    load(filename_hat,'Vcl_fw_bot','Vcl_hw','FaultDip','Zf','Zmax');
    load(filename,'Vcl_fw_top');
    filename2 = sprintf('../%s%s%s/data2/params.mat', fw_bot, fw_top, hw);
    save(filename2,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','FaultDip','Zf','Zmax');
    clear Vcl_fw_bot Vcl_fw_top Vcl_hw FaultDip Zf Zmax

    load(filename_hat,'Vcl_fw_bot','Vcl_fw_top','FaultDip','Zf','Zmax');
    load(filename,'Vcl_hw');
    filename3 = sprintf('../%s%s%s/data3/params.mat', fw_bot, fw_top, hw);
    save(filename3,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','FaultDip','Zf','Zmax');
    clear Vcl_fw_bot Vcl_fw_top Vcl_hw FaultDip Zf Zmax

    load(filename_hat,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','Zf','Zmax');
    load(filename,'FaultDip');
    filename4 = sprintf('../%s%s%s/data4/params.mat', fw_bot, fw_top, hw);
    save(filename4,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','FaultDip','Zf','Zmax');
    clear Vcl_fw_bot Vcl_fw_top Vcl_hw FaultDip Zf Zmax

    load(filename_hat,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','FaultDip','Zmax');
    load(filename,'Zf');
    filename5 = sprintf('../%s%s%s/data5/params.mat', fw_bot, fw_top, hw);
    save(filename5,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','FaultDip','Zf','Zmax');
    clear Vcl_fw_bot Vcl_fw_top Vcl_hw FaultDip Zf Zmax

    load(filename_hat,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','FaultDip','Zf');
    load(filename,'Zmax');
    filename6 = sprintf('../%s%s%s/data6/params.mat', fw_bot, fw_top, hw);
    save(filename6,'Vcl_fw_bot','Vcl_fw_top','Vcl_hw','FaultDip','Zf','Zmax');
    clear Vcl_fw_bot Vcl_fw_top Vcl_hw FaultDip Zf Zmax
end


function Vcl = material_sampling(name,Nmc)
    if name == 'C'
        Vcl = 0.5+(0.9-0.5).* rand(Nmc,1);
        fprintf('Clay\n');
    elseif name == 'S'
        Vcl = 0.1+(0.3-0.1).* rand(Nmc,1);
        fprintf('Sand\n');
    else
        fprintf('error!\n');
    end
end
