$fn = 10;
module collar(){
union(){
translate([0.125,1.5,0.125])
	cube([1,0.25,1]);
difference(){
cube([1.25,3,1.25]);
translate([0.125,0.0,0.125])
	cube([1,3,1]);
}
}
}
collar();
