%% 6 DoF: State Space Modelling and LQR Design 
%  Attitude and Drift Control with constant thrust

%% State Space Modelling

A=[0    1    0    0   0   0   0   0;
   0    0    0    0   0   0   0   0;
   0    0    0    1   0   0   0   0;
   0    0    0    0   0   0   0   0;
   0    0    0    0   0   1   0   0;
   0    0   -g    0   0   0   0   0;
   0    0    0    0   0   0   0   1;
   g    0    0    0   0   0   0   0]; 
  
B=[0                                   0;
   1/inertiayy                         0;
   0                                   0;
   0                               1/inertiazz;
   0                                   0;
   0                           -1/(mass*moment_arm);
   0                                   0;
  1/(mass*moment_arm)                  0];

C=[1 0 0 0 0 0 0 0; 
   0 1 0 0 0 0 0 0;
   0 0 1 0 0 0 0 0;
   0 0 0 1 0 0 0 0; 
   0 0 0 0 1 0 0 0;
   0 0 0 0 0 0 1 0];

D=zeros(6,2);

states={'Theta' 'Pitch rate' 'Psi' 'Yaw rate' 'Position Y' 'Velocity Y' 'Position Z' 'Velocity Z'};
inputs={'TVC Pitch Angle' 'TVC Yaw Angle'};
outputs={'Theta' 'Pitch rate' 'Psi' 'Yaw rate' 'Position Y' 'Position Z'}; 

sys=ss(A,B,C,D,'statename', states, 'inputname', inputs, 'outputname', outputs);

%% LQR Design

ct=ctrb(A,B);
rct=rank(ct);
 
Q=[40  0     0    0   0   0     0     0;
   0    1    0    0   0   0     0     0;
   0    0    40   0   0   0     0     0;
   0    0    0    1   0   0     0     0;
   0    0    0    0   1   0     0     0;
   0    0    0    0   0   1     0     0;
   0    0    0    0   0   0     1     0;
   0    0    0    0   0   0     0     1];

R=[1];

K=lqr(A,B,Q,R);
