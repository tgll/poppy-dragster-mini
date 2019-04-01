from numpy import sum
from functools import partial

from pypot.creatures import AbstractPoppyCreature

from .primitives.face_tracking import FaceTracking
from .primitives.tracking_feedback import TrackingFeedback
                               
class PoppyErgoJr(AbstractPoppyCreature):
    @classmethod
    def setup(cls, robot):
        robot._primitive_manager._filter = partial(sum, axis=0)
        
        
        if not robot.simulated:
            if hasattr(robot, 'marker_detector'):
                robot.attach_primitive(TrackingFeedback(robot, 25.),
                                   'tracking_feedback')
            if hasattr(robot, 'face_tracking'):
                robot.attach_primitive(FaceTracking(robot, 10,
                                                robot.face_detector),
                                   'face_tracking')

        for m in robot.motors:
            m.pid = (4, 2, 0)
            m.torque_limit = 70.
            m.led = 'off'        
        for m in robot.motors[0:4]: m.control_mode=2
        for m in robot.motors[4:6]: m.control_mode=1
