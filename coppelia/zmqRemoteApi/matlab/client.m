% client.m
%
% Sample client to control a Pioneer P3DX mobile robot.  It implements a
% kind of heuristic, rule-based controller for collision avoidance.  The
% thresholds should be fine-tuned for improving the robot navigation.   
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

fprintf('Program started\n')

sim = connectcoppelia();
defaultidlefps = startsimulation(sim);
fprintf('Connected to Coppelia\n')

robot = connectp3dx(sim, 'PioneerP3DX', false, false);
fprintf('Connected to Pioneer P3DX\n')

% set_speed(sim, robot, 1.0, -1.0);

while isrunning(sim)
    % t = sim.getSimulationTime();
    % if t >= 20; break; end

    % s = sprintf('Simulation time: %.2f [s]', t);
    % fprintf('%s\n', s);
    % sim.addLog(sim.verbosity_scriptinfos, s)

    readings = getsonar(sim, robot);
    [lspeed, rspeed] = avoid(readings);
    setspeed(sim, robot, lspeed, rspeed);
end

stopsimulation(sim, defaultidlefps);

fprintf('Program ended\n');
