# Autonomous-Landing-of-Model-Rockets

This project aims to build a model rocket that can land vertically. By establishing an automatic control system, we contrive to pull out any perturbations and disturbances ensuring active control. Thrust Vector Control (TVC) is the technique used for attitude (pitch and yaw) control, this gimbal mount allows the rocket to be actively stabilized and is the key component to allow the rocket to land vertically.

A closed-loop feedback control system consisting of a Proportional Integral Derivative (PID) controller is employed to maneuver the rocket, additional components such as the Kalman Filter will be used to eliminate noise and disturbances from sensory feedback. A flight computer is utilized to monitor the rocket, this includes data logging, stabilization, prediction, and state indication. The rocket is powered by a solid propellant motor serving as the propulsion system.

The rocket body and its components are designed considering the principles of Design for Assembly (DFA) and Design for Manufacturing (DFM), using Computer-Aided Design (CAD) software and analyzed using Finite Element Method (FEM) solvers. Computational Fluid Dynamics (CFD) is applied to visualize the flow around the rocket airframe and to evaluate the design of passive fins.

## MATLAB and Simulink:
* Rocket Parameters: Data_for_simulation.m

### PID Controller: 
* PID3dof.slx
* Six_DoF_PID.slx

### Linear Quadratic Regulator(LQR):
* Three_DoF_LQR.slx
* Six_DoF_LQR.slx

### State Space Model:
* ss_3DoF_LQR.m
* ss_6DoF_LQR.m
