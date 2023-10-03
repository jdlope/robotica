function ret = getsonar(sim, robot)

%getsonar Returns an array with sonar readings
%   The max distance is limited to 1 in the simulator by default.  It does
%   not change this threshold by modifying this code, it is also neccesary
%   to change the appropriate value in the sensors.
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

ret = ones(16, 1);
for i=1:16
    [r,d,~,~,~] = sim.readProximitySensor(robot(i+2));
    if (r == 1)
        ret(i) = d;
    end
end

end