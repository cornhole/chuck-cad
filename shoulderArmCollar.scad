$fn=50;
module shoulderArmCollar(){
difference(){
cube([1.25,1.5,1.25]);
translate([0.125,0,0.125])
cube([1,1.5,1]);
}
}
shoulderArmCollar();
