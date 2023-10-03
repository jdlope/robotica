function handles = connectp3dx(sim, robotid, usecamera, uselidar)

%connectp3dx Connect to a Pioneer P3DX
%   The function requires the handle to the simulator (sim), the string
%   used to identify the robot in the simulator (robotid), and boolean
%   arguments to describe additional sensors, which have to be already
%   installed and configured in the scene.  The fucntion returns an array
%   with the device handles.
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

handles = zeros(20, 1);
handles(1) = sim.getObject(sprintf('/%s/leftMotor', robotid));
handles(2) = sim.getObject(sprintf('/%s/rightMotor', robotid));
for i = 0:15
    handles(i+3) = sim.getObject(sprintf('/%s/ultrasonicSensor[%d]', robotid, i));
end
if usecamera, handles(19) = sim.getObject(sprintf('/%s/camera', robotid)); end
if uselidar, handles(20) = sim.getObject(sprintf('/%s/lidar', robotid)); end

end