$fn = 50;
//use<shoulderServoBracket.scad>
//
//translate([1,0.4,-0.15])
//rotate([0,0,90])
//shoulderServoBracket();

module shoulderArmBracket(){
  cylinderRadius = 0.2;
  bracketThickness = 0.25;
  servoHornHeight = 0.1;
  servoHeight = 1.465+servoHornHeight;
  bracketLength = servoHeight + 2*bracketThickness + 0.25; 
  bracketHeight = 1;
  bracketWidth = 2;

difference(){
  cube([bracketWidth,bracketLength,bracketHeight]);
  translate([0,bracketThickness/2,0])
  cube([bracketWidth-bracketThickness,bracketLength-bracketThickness,bracketHeight]);
  translate([bracketWidth/4,bracketLength,bracketHeight/2])
  rotate([90,0,0])
  cylinder(r=cylinderRadius,h=bracketThickness,center=true);
}

}
shoulderArmBracket();
