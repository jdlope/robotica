function setspeed(sim, robot, lspeed, rspeed)

%setspeed Set the left and right wheels speed
%   The max value for the speed is undetermined in the robot.  Values
%   around 1.5 should be used used for safety navigation.
%
% Copyright (C) 2023 Javier de Lope
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

sim.setJointTargetVelocity(robot(1), lspeed);
sim.setJointTargetVelocity(robot(2), rspeed);

end