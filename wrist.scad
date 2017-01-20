$fn =200;
module wrist(){
mm2in = 0.0394;
tolerance = 1*mm2in;
servoLength    = 40*mm2in+tolerance;
servoWidth     = 15*mm2in+tolerance;
servoHeight    = 20.5*mm2in+tolerance;
wristLength    = 7.0;
wristWidth     = 1;
wristHeight    = 1;
handWidth      = 3;
handLength     = 4;
gripperLength  = 3.5;
handPosition   = wristLength;

difference(){
  union(){
    union(){
      difference(){
        //main block
        cube([wristWidth,wristLength,wristHeight]);
        //servo hole
        translate([wristWidth/2,(wristLength-handLength/4)/2,wristHeight/2]){
          cube([servoWidth,servoLength,wristHeight],center=true);
        }
          translate([0,(wristLength-handLength/4+servoLength/2)/2,wristHeight*2/3])
          rotate([0,90,0])
          cylinder(r=0.15,h=1.25);

          translate([0,(wristLength-handLength/4-servoLength/2)/2,wristHeight*2/3])
          rotate([0,90,0])
          cylinder(r=0.15,h=1.25);
      }
      //hand cut out
      translate([handWidth/2 + wristWidth/2,wristLength,wristHeight/2])
      rotate([0,270,0])
      resize([1,handLength,handWidth])
      cylinder(r=1,h=1);
    }
  }
    translate([handWidth/2 + wristWidth/2,wristLength+.2,wristHeight/2+.2])
      rotate([0,270,0])
      resize([1,handLength,handWidth+0.3])
      cylinder(r=handLength,h=handWidth);
    translate([wristWidth/4,wristLength-handLength/2-.3,wristHeight/2])
    //rotate([0,270,0])
    cube([wristWidth/2,wristWidth,wristWidth+.55]);
}
}
wrist();
