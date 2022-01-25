%% 3 DoF: State Space Modelling and LQR Design
%  Attitude, Position and Drift Control with throttlability

%% State Space Modelling

A=[0    0    0    1    0    0;
   0    0    0    0    1    0;
   0    0    0    0    0    1;
   0    0    g    0    0    0;
   0    0    0    0    0    0;
   0    0    0    0    0    0];

B=[0                                          0;
   0                                          0;
   0                                          0;
   0                                          g;
   -(1/mass)                                  0;
   0           -((mass*g*moment_arm)/inertiayy)];

C=[1 0 0 0 0 0; 
   0 1 0 0 0 0;
   0 0 0 0 0 1];

D=zeros(3,2);

states={'Drift' 'Position' 'Angle' 'Drift Velocity' 'Velocity' 'Pitch rate'};
inputs={'Force-gravity' 'TVC Angle'};
outputs={'Drift' 'Position' 'Pitch rate'};

sys=ss(A,B,C,D,'statename', states, 'inputname', inputs, 'outputname', outputs);


%% LQR Design

ct=ctrb(A,B);
rct=rank(ct);

Q=[1    0    0     0   0   0; 
   0    1    0     0   0   0;
   0    0    1     0   0   0;
   0    0    0     1   0   0;
   0    0    0     0  120  0;
   0    0    0     0   0   1];

R=[1 0;
   0 1];

K=lqr(A,B,Q,R);
