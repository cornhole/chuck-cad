$fn = 100;
module gripper(){
gripper_length=2.0;
gripper_width = 0.4;
gripper_height = 0.25;
sphere_length = 2.75;
sphere_width = 2;
sphere_depth = 0.5;
union(){
  translate([0,gripper_length,0]){
  resize(newsize=[sphere_width,sphere_length,gripper_height/2])
    cylinder(r=1, h=0.2);
    resize(newsize=[sphere_width,sphere_length,sphere_depth])
    difference(){
      sphere(1);
      translate([0,0,1])
      cube([2,2,2], center=true);
    }
  }
  translate([0,gripper_length/2,0])
    cube([gripper_width,gripper_length,gripper_height],center=true);
  //translate([-gripper_width/2,gripper_length/2,0])
  //cube([gripper_width,0.25,0.25]);

}
}

gripper();
