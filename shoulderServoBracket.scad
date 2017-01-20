$fn = 50;

module shoulderServoBracket(){
  servoWidth = 0.795;
  servoLength = 1.587;
  servoHeight = 1.465;
  bracketThickness = 0.25;
  cylinderRadius = 0.2;
  cylinderHeight = 0.35;
  servoHornLocation = 0.25;
  bracketCutOut = servoLength + bracketThickness;
  union(){
    difference(){
    //main bracket block
    cube([2*servoHeight,servoLength+3*bracketThickness, servoWidth + 2*bracketThickness]);
    //servo cutout
    translate([-0.25 * servoHeight,bracketThickness,bracketThickness])
      cube([servoHeight,servoLength,servoWidth]);
    //cutout for arm bracket mount
    translate([servoHeight,0,0])
      cube([0.5,bracketCutOut,servoWidth + 2*bracketThickness]);
    //cut off end of bracket
    translate([servoHeight+2*bracketThickness+0.5,0,0])
      cube([2,servoLength+3*bracketThickness,servoWidth + 2*bracketThickness]);
    // cut out hole for wire
    translate([0.10*servoHeight,0,0.25*servoWidth + bracketThickness])
      cube([servoHeight*0.65,bracketThickness,servoWidth/2]);
    }
    //add cylinder for arm bracket
    translate([servoHeight+0.5-cylinderHeight,servoHornLocation + bracketThickness,0.5*(2*bracketThickness + servoWidth)])
      rotate([0,90,0])
        cylinder(r=cylinderRadius,h=cylinderHeight);
    //support for cylinder
    //comment one of two depending on orientation of print
    //translate([servoHeight+0.45 - cylinderHeight,servoHornLocation + bracketThickness,0])
    //  cube([cylinderHeight,0.1,0.5*(2*bracketThickness + servoWidth)]);
    //translate([servoHeight+0.45 -cylinderHeight,servoHornLocation + bracketThickness,0.5*(2*bracketThickness + servoWidth)])
    //  cube([cylinderHeight,servoLength-servoHornLocation,0.1]);
  }
}
shoulderServoBracket();
