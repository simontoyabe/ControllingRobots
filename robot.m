classdef robot                      %Definition of class robot
    %Definition of robot properties
    properties
        initial_position            %Initial robot position
        actual_x                    %Actual X-axis position
        actual_y                    %Actual Y-axis position
        actual_orientation          %Actual orientarion (N,S,W,E)
        final_position              %Final robot position
    end
    %Definition of robot methods
    methods 
        function obj = robot(initial)                           %Function to create the robot object with some properties predefined
            obj.initial_position = initial;
            obj.actual_orientation = initial(end);
            initial(end) = [];
            initial = str2num(initial);
            obj.actual_x = initial(1);
            obj.actual_y = initial(2);   
        end
        function obj = movement(obj, path, max_position)        %Function to apply the movement commands to the robot
            for i=1:length(path)
                if path(i) == " "
                    continue
                end
                if path(i) == 'R'
                   if obj.actual_orientation == 'N'
                       obj.actual_orientation = 'E';
                   elseif obj.actual_orientation == 'S'
                       obj.actual_orientation = 'W';
                   elseif obj.actual_orientation == 'E'
                       obj.actual_orientation = 'S';
                   else   
                       obj.actual_orientation ='N';
                   end    
                elseif path(i) == 'L'
                   if obj.actual_orientation == 'N'
                       obj.actual_orientation = 'W';
                   elseif obj.actual_orientation == 'S'
                       obj.actual_orientation = 'E';
                   elseif obj.actual_orientation == 'E'
                       obj.actual_orientation = 'N';
                   else   
                       obj.actual_orientation ='S';
                   end                      
                else
                   if obj.actual_orientation == 'N'
                       obj.actual_y = obj.actual_y + 1;
                       if obj.actual_y > max_position(2)                        %Table dimensiones constraints on top Y-axis
                           disp("You have exceed the table dimensions")
                           break
                       end    
                   elseif obj.actual_orientation == 'S'
                       obj.actual_y = obj.actual_y - 1;
                       if obj.actual_y < 0                                      %Table dimensiones constraints on bottom Y-axis
                           disp("You have exceed the table dimensions")
                           break
                       end
                   elseif obj.actual_orientation == 'E'
                       obj.actual_x = obj.actual_x + 1;
                       if obj.actual_x > max_position(1)                        %Table dimensiones constraints on right X-axis
                           disp("You have exceed the table dimensions")
                           break
                       end 
                   else   
                       obj.actual_x = obj.actual_x - 1;
                       if obj.actual_x < 0                                      %Table dimensiones constraints on left X-axis
                           disp("You have exceed the table dimensions")
                           break
                       end
                   end                    
                end
            end
            final = [num2str(obj.actual_x),' ',num2str(obj.actual_y),' ', obj.actual_orientation];      %Final robot position
            obj.final_position = final;                                                                 %Modify the final_position property
        end
    end
end