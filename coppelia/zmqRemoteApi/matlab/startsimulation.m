function defaultidlefps = startsimulation(sim)

%startsimulation Starts the simulation
%   The simulator has to be running and the scene has to be loaded with
%   the robot with the appropriate sensors.  In order to optimize the
%   simulation the idle fps are modified.  The default value is returned
%   if it is needed to get back to the initial configuration.
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

defaultidlefps = sim.getInt32Param(sim.intparam_idle_fps);
sim.setInt32Param(sim.intparam_idle_fps, 0);
sim.startSimulation();

end