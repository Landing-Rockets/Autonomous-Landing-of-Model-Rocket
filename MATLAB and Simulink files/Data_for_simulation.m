%% Rocket Parameters

%% Properties

mass=0.8426;      % Wet mass of Rocket in kg. 
inertiaxx=0.0015; % MOI xx in kgm^2
inertiayy=0.048;  % MOI yy in kgm^2
inertiazz=0.048;  % MOI zz in kgm^2.  
moment_arm=0.29;  % Moment arm in m.          
g=9.81;           % Gravity in ms^-2.
tvc_misang=0;     % TVC misalignment angle in deg. 
delay=0.017;    % Delay in servo action in sec. 
diameter=0.076;   % Diameter of the Rocket in m. 

% Import the data from Excel for a lookup table
data = xlsread('Estes_C6&F15_Motor_Thrust_Curve','Sheet2');
% Row indices for lookup table
breakpoints1 = data(1:end,1);
% Column indices for lookup table 
breakpoints2 = data(1:end,2);
% Output values for lookup table.
table_data = data(1:end,1:end);
% Load F15 Thrust table 
load('F15.mat')

%% PID Zeiger Nichols (3DoF PID)

Ku=1;
Tu=1.606;
% Classic pid using Zeiger nicholas
Kp=0.6*Ku;
Ti=Tu/2;
Td=Tu/8;
% PID Gains
Kp;
Ki=Kp/Ti;
Kd=Kp*Td;