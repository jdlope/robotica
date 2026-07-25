'''
p3dx.py

Basic operations for the Pioneer 3-DX robot.

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

import cv2
import numpy as np
from core import Coppelia


class P3DX():

    @property
    def NUM_SONAR(self):
        return 16
    
    @property
    def SONAR_MAX(self):
        return 1.0

    def __init__(self, sim, robot_id, use_camera=False, use_lidar=False):
        self.sim = sim
        print('*** getting p3dx handles', robot_id)
        self.left_motor = self.sim.getObject(f'/{robot_id}/leftMotor')
        self.right_motor = self.sim.getObject(f'/{robot_id}/rightMotor')
        self.sonar = []
        for i in range(self.NUM_SONAR):
            self.sonar.append(self.sim.getObject(f'/{robot_id}/ultrasonicSensor[{i}]'))
        if use_camera:
            self.camera = self.sim.getObject(f'/{robot_id}/camera')
        if use_lidar:
            self.lidar = self.sim.getObject(f'/{robot_id}/lidar')

    def get_sonar(self):
        readings = []
        for i in range(self.NUM_SONAR):
            res,dist,_,_,_ = self.sim.readProximitySensor(self.sonar[i])
            readings.append(dist if res == 1 else self.SONAR_MAX)
        return readings

    def get_image(self):
        img, resX, resY = self.sim.getVisionSensorCharImage(self.camera)
        img = np.frombuffer(img, dtype=np.uint8).reshape(resY, resX, 3)
        img = cv2.flip(cv2.cvtColor(img, cv2.COLOR_BGR2RGB), 0)
        return img

    def get_lidar(self):
        # data = self.sim.getFloatArrayProperty(self.sim.handle_scene, "signal.lidarData")
        data = self.sim.getFloatArrayProperty(self.lidar, "signal.lidarData")
        return data

    def set_speed(self, left_speed, right_speed):
        self.sim.setJointTargetVelocity(self.left_motor, left_speed)
        self.sim.setJointTargetVelocity(self.right_motor, right_speed)


if __name__ == '__main__':
    pass
