clc;clear;close all  
%% Program for controlling robots that move on a table surface
%In order to test differente scenarios change the name of the
%input and output data files

filename = 'InputData.txt';                           %Input data in a text file
fileID_in = fopen(filename);                          %Open input data file 

line_ex = fgetl(fileID_in);                           %Read first line
max_position = str2num(line_ex);                      %Extract the maximum coordinates of the table
line_ex = fgetl(fileID_in);                           %Read second line with the starting location and orientation of robot #1
robot1 = robot(line_ex);                              %Create Robot #1 object from class robot
line_ex = fgetl(fileID_in);                           %Read third line with the starting location and orientation of robot #2
robot2 = robot(line_ex);                              %Create Robot #1 object from class robot        
line_ex = fgetl(fileID_in);                           %Read fourth line with the commands for Robot # 1
robot1 = robot1.movement(line_ex, max_position);      %Apply commands to Robot #1 and obtain its final position and orientation
line_ex = fgetl(fileID_in);                           %Read fifth line with the commands for Robot # 2
robot2 = robot2.movement(line_ex, max_position);      %Apply commands to Robot #2 and obtain its final position and orientation

fclose(fileID_in);                                    %Close input data file

%% Write output file

% Write final position of both robots on a text file
fileID_out = fopen('OutputData.txt','w');             %Open output file to write on it
fprintf(fileID_out,'%s\n',robot1.final_position);     %Write final position of Robot # 1
fprintf(fileID_out,robot2.final_position);            %Write final position of Robot # 2
fclose(fileID_out);                                   %Close output file