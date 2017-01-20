$fn = 50;

mm2in = 0.0394;
tolerance =1*mm2in;
servoWidth=20.2*mm2in + tolerance;
servoBottomLength=43*mm2in;
servoBottomHeight=24.4*mm2in + tolerance;
servoTopHeight=16.8*mm2in + tolerance;
servoTopLength=54*mm2in+tolerance;
servoHornLocation = servoBottomLength/4;
bracketThickness = 0.25;
bracketHeight = 1;
cylinderRadius = 0.15;

module shoulderServo(){
  rotate([0,0,180])
  translate([-servoBottomLength,0,0])
  union(){
  cube([servoBottomLength,servoBottomHeight,servoWidth]);
  translate([servoBottomLength/2,servoBottomHeight+servoTopHeight/2,servoWidth/2])
  cube([servoTopLength,servoTopHeight,servoWidth],center=true);
  }
}
module shoulderServoBracket(){
  union(){
    difference(){
      translate([-1,0,0])
      cube([servoBottomLength+2*bracketThickness+1,servoBottomHeight+bracketThickness,servoWidth+2*bracketThickness]);  
      translate([-1+bracketThickness,bracketThickness/2,0])
      cube([0.75,servoBottomHeight,2]);
      translate([-0.5,bracketThickness,1.5*bracketThickness])
      cube([2*servoBottomLength,servoBottomHeight-bracketThickness,servoWidth-bracketThickness]);
      translate([1.5*bracketThickness,bracketThickness,0])
      cube([servoBottomLength - bracketThickness,servoBottomHeight-bracketThickness,2*servoWidth]);
    }
    translate([servoBottomLength*3/4 + bracketThickness,servoBottomHeight + 2*bracketThickness,servoWidth/2 + bracketThickness])
    rotate([90,0,0])
    cylinder(r=cylinderRadius,h=bracketThickness);
  }
}
module shoulderArmBracket(){
  cylinderRadius = 0.15;
  bracketLength = servoBottomHeight+servoTopHeight + 2*bracketThickness+0.10;
  //bracketLength =  2;
  bracketWidth = 2; 

  difference(){
    cube([bracketWidth,bracketLength,bracketHeight]);
    translate([0,bracketThickness/2,0])
    cube([bracketWidth-bracketThickness,bracketLength-bracketThickness,bracketHeight]);
    translate([bracketThickness,bracketLength,bracketHeight/2])
    rotate([90,0,0])
    cylinder(r=cylinderRadius+0.005,h=bracketThickness,center=true);
  }
}
module shoulderBrackets(){
difference(){
  shoulderServoBracket();
  translate([bracketThickness,servoBottomHeight,bracketThickness])
  shoulderServo();
}
translate([servoBottomLength*3/4,-(servoBottomHeight+servoTopHeight)/2,servoWidth/2 +bracketThickness-bracketHeight/2 ])
shoulderArmBracket();
}
shoulderBrackets();
