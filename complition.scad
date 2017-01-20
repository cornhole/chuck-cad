use<gripper.scad>
use<wrist.scad>
use<collar_joint.scad>
use<upperArm.scad>
use<shoulderArmCollar.scad>

use<shoulderBrackets.scad>

translate([0.5,5.0,0.85])
rotate([90*$t,0,0])
gripper();

translate([0,0,0])
wrist();
translate([-.125,-1.5,-.125])
collar();
translate([0,-6.25,0])
upperArm(6,1,1);
translate([1.15,-4.85,-.125])
rotate([0,0,180])
shoulderArmCollar();


translate([0.85,-9.6,-.125])
rotate([0,0,90])
shoulderBrackets();
