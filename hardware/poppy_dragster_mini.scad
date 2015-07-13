include <robotis-scad/ollo/ollo_def.scad>
include <robotis-scad/dynamixel/xl320_def.scad>
include <robotis-scad/specific_frames/specific_frame_def.scad>

use <robotis-scad/specific_frames/raspberry_pi_Bplus_base_frame.scad>
use <robotis-scad/specific_frames/wheel_tools.scad>

use <raspberry-scad/raspberry_pi_Bplus_tools.scad>

use <MCAD/rotate.scad>

module poppy_dragster_mini(){

    translate([0, - RaspberryPiBplusWidth/2 - RaspberryPiBplusFrameDistanceBoardToMotor - MotorLength + MotorAxisOffset, -MotorHeight/2-ollo_segment_thickness(1)]) {

      raspberry_pi_Bplus_base_frame_with_wheels_and_battery_holes(RaspberryPiBplusFrameHeight);

      translate([0,RaspberryPiBplusFrameLenght-RaspberryPiBplusWidth/2-RaspberryPiBplusFrameCameraDistFromEnd,-RaspberryPiBplusFrameHeight+MotorHeight/2])
        passive_wheel();

      translate([-RaspberryPiBplusFrameWidth/2+MotorHeight/2,1.5*OlloSpacing,-RaspberryPiBplusFrameHeight])
        rotate([0,-90,0])
          add_wheel("lego");

      translate([RaspberryPiBplusFrameWidth/2-MotorHeight/2,1.5*OlloSpacing,-RaspberryPiBplusFrameHeight])
        rotate([0,90,0])
          add_wheel("lego");

        translate([0,0,-RaspberryPiBplusFrameHeight+2.5*OlloSpacing+RaspberryPiBplusBoardHeight])
          add_raspberry_pi_Bplus();
    }
}

// Testing
echo("##########");
echo("In poppy_dragster_mini.scad");
echo("This file should not be included, use ''use <filemane>'' instead.");
echo("##########");

p = 1;
if (p==1) {
  poppy_dragster_mini();
}
