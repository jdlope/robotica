'''
braitenberg.py

Sample client for collision avoidance based on the default
Pioneer P3DX script in CoppeliaSim.

Copyright (C) 2023 Javier de Lope

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

import robotica


def main(args=None):
    coppelia = robotica.Coppelia()
    robot = robotica.P3DX(coppelia.sim, 'PioneerP3DX')

    min_speed = 2.0
    no_detection_dist = 0.5
    max_detection_dist = 0.2
    detect = [0] * robot.num_sonar
    lbraitenberg = [-0.2,-0.4,-0.6,-0.8,-1,-1.2,-1.4,-1.6, 0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]
    rbraitenberg = [-1.6,-1.4,-1.2,-1,-0.8,-0.6,-0.4,-0.2, 0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0]

    coppelia.start_simulation()
    while coppelia.is_running():
        readings = robot.get_sonar()
        for i in range(robot.num_sonar):
            dist = readings[i]
            if dist < no_detection_dist:
                if dist < max_detection_dist:
                    dist = max_detection_dist
                detect[i] = 1 - ((dist-max_detection_dist) / (no_detection_dist-max_detection_dist))
            else:
                detect[i] = 0

        lspeed, rspeed = min_speed, min_speed
        for i in range(robot.num_sonar):
            lspeed += lbraitenberg[i] * detect[i]
            rspeed += rbraitenberg[i] * detect[i]
        robot.set_speed(lspeed, rspeed)

    coppelia.stop_simulation()


if __name__ == '__main__':
    main()
