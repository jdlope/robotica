function stopsimulation(sim, idlefps)

%stopsimulation Stops the simulation
%   It stops the simulation and keeps an active wait until done.  It
%   requires a value for the idle fps (usually the default if saved).
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

sim.stopSimulation();
while sim.getSimulationState() ~= sim.simulation_stopped
    pause(0.1);
end
sim.setInt32Param(sim.intparam_idle_fps, idlefps);

end