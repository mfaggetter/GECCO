function Constant = DefineConstants(Constant);

    %% Physical Constants
    Constant.Architectures = Architecture();

    Constant.Mixing_Coefficient = 5; %m/yr

    Constant.Riverine_Volume = 4e13; %(362*10.^12); %m^2/yr;
    Constant.Riverine_Phosphate = 0.13575e-2; %mol/m^2

    Surface_Pressure = 1; %bars
    Deep_Pressure = 150; %bars
    Constant.Pressure = [Surface_Pressure;Deep_Pressure];

    Surface_Salinity = 35; %unitless
    Deep_Salinity = 35; %unitless
    Constant.Salinity = [Surface_Salinity;Deep_Salinity];

    load('./../Resources/Hypsometry.mat');
    [Gradient,YIntercept] = PiecewiseLinearFit(Hypsometric_Bin_Midpoints,Cumulative_Hypsometry);
    Constant.Hypsometric_Interpolation_Matrix = [Gradient,YIntercept];

    Constant.Hypsometry = Hypsometry;
    Constant.Cumulative_Hypsometry = Cumulative_Hypsometry;
    Constant.Hypsometric_Bin_Midpoints = Hypsometric_Bin_Midpoints;

    %% Biological Constants
    Constant.Maximum_Growth_Rate = 0.25*365; %/yr
    Constant.Mortality = 0.2*365; %/yr
    Constant.Biological_Half_Constant = 0.03*(10^-3); %0.183225e-3;  %mol/m^3 ##UNCERTAINTY
    Constant.Algal_Slowing_Factor = 0.001;
    
    SurfaceRemin = 0.95; %fraction
    Burial = 0.002; %fraction
    DeepRemin = 1-(SurfaceRemin+Burial); %fraction

    Constant.Phosphate_Remineralisation = [SurfaceRemin;DeepRemin];
    Constant.Redfield_Ratio = 106; %P:C = 1:Constant.RedfieldRatio
    
    %% Carbonate Chemistry Constants
    Constant.PIC_Remineralisation = [0;0]; %fraction
    Constant.PIC_Burial = [0.2;0];

    Constant.POC_Remineralisation = [0.9125;0.0874]; %fraction %FOR REALITY: [0.9260,xx] 
    Constant.POC_Burial = [0;1].*(1-sum(Constant.POC_Remineralisation));
    Constant.POC_Burial_Maximum_Depth = 8000;

    Constant.Production_Ratio = 0.03; %fraction

    %% Subduction Constants
    Constant.Subduction_Mean = 8000;
    Constant.Subduction_Spread = 500;
    Constant.Subduction_Rate = [ones(1050,1)*(00/(100*10^6))/10;ones(951,1)*10000/(100*10^6)]; %m/Ma
    Constant.Subduction_Risk = 0.001;
    Constant.Uplift_Rate = zeros(2001,1);
    Constant.Uplift_Rate(2:1050) = 1e-7;
    Constant.Core_Depths = NaN;
    
    %% Geological Constants
    Constant.Outgassing_Spread = 1e6;
    Constant.Outgassing_Mean_Lag = 1e7;
    Constant.Outgassing_Temporal_Resolution = 1000;
    
    Constant.Silicate_Replenishment = 0; %1e12; % ### Not real

    Constant.Silicate_Weathering_Coefficients = [1.876625323804900e-15;0.068551565356742];
    Constant.Carbonate_Weathering_Coefficients = [1.876625323804900e-15;0.068551565356742];

    Constant.Silicate_Replacement = 1; %fraction
%     Constant.Carbonate_Replacement = 0.99; %fraction

%     Constant.Silicate_Limiting_Threshold = 0.01e18; % ### random
%     Constant.Carbonate_Limiting_Threshold = 0.01e18; % ### random

    Constant.Silicate_Weatherability = 1;
    Constant.Carbonate_Weatherability = 1;
    
    Constant.Carbonate_Exposure = 1/20;
    
    %% Energy Constants
    Constant.Radiative_Sensitivity = 3.7; %W/m^2 / doubling
    Constant.Climate_Sensitivity = 1.5; %degC/doubling CO2
    Constant.Solar_Constant = 1370; %W/m^2
    Constant.Albedo = 0.3; %fraction
    Constant.Emissivity = 0.6133;
    Constant.Stefan_Boltzmann = 5.67e-8;
    
    Constant.Ocean_Temperature_Offset = [1;12];
    Constant.Atmosphere_Equilibration_Timescale = 50;
    Constant.Ocean_Equilibration_Timescale = [100;1000];
    
    %% Ice Constants
    Constant.Ice_Angle = 0.07; %degrees
    Constant.Ice_Density = 0.9167e6; %g/m^3
    Constant.Ice_Growth_Rate = 50; %mol/yr/m^3 above snow line
    Constant.Ice_Melt_Rate = 1.3567e-6; %mol/yr/mol of ice present
    Constant.Water_Density = 1.0292e6; %g/m^3
    Constant.Water_Molar_Mass = 18; %g/mol
    Constant.Snow_Line_Sensitivity = 100; %m/degreeC
    Constant.Sea_Level_Forcing = 0; %m/yr
%     Constant.Earth_Radius = (6371.*1000); %m
%     
%     Constant.Ocean_Coverage = 0.7;
%     Constant.Ocean_Albedo = 0.1;
%     Constant.Land_Albedo = 0.4;
%     Constant.Ice_Albedo = 1;
end