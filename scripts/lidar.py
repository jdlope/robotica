'''
lidar.py

Sample client for the Pioneer P3DX mobile robot that implements a
kind of heuristic, rule-based controller for collision avoidance.

Copyright (C) 2026 Javier de Lope

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
'''

from core import Coppelia
from core import P3DX


def avoid(readings):
    if (readings[3] < 0.1) or (readings[4] < 0.2):
        w_r, w_l = -0.8, +0.1
    elif readings[1] < 0.1:
        w_r, w_l = +0.6, +1.3
    elif readings[5] < 0.4:
        w_r, w_l = +0.9, +0.1
    else:
        w_r, w_l = +1.5, +1.5
    return w_r, w_l


def main(args=None):
    coppelia = Coppelia()
    robot = P3DX(coppelia.sim, 'PioneerP3DX', use_lidar=True)
    coppelia.start_simulation()
    while coppelia.is_running():
        readings = robot.get_sonar()
        w_r, w_l = avoid(readings)
        robot.set_wheel_velocities(w_r, w_l)
        print('data from lidar :', len(robot.get_lidar()))
    coppelia.stop_simulation()


if __name__ == '__main__':
    main()
