'''
camera.py

Sample client for the Pioneer P3DX mobile robot that receives and
displays images from the camera.

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

import cv2
import robotica


def main(args=None):
    coppelia = robotica.Coppelia()
    robot = robotica.P3DX(coppelia.sim, 'PioneerP3DX', True)
    coppelia.start_simulation()
    while coppelia.is_running():
        img = robot.get_image()
        cv2.imshow('opencv', img)
        cv2.waitKey(1)
        robot.set_speed(0, 0)
    coppelia.stop_simulation()
    cv2.destroyAllWindows()


if __name__ == '__main__':
    main()
