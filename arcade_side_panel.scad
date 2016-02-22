
$fn=360;
side_w = 14.8;
w2 = 1; //10 mm

display_w = 34.5;
display_h = 28;
machine_w = 40;

module side()  {
rad = 29;
eps = 0.01;
difference(){
    cube([ 45.4,63.5,side_w]);
    translate([-4,rad+11,-eps]) cylinder(side_w+2*eps,rad,rad,[0,0,0]);
    rotate([0,0,-17])translate([-29,30,-eps])cube([35,80,side_w+2*eps]);
    rotate([0,0,-17])translate([-27,67,-eps])cube([80,20,side_w+2*eps]);
    }
}
//projection(cut = false)
{
  scale([10,10,10]) {
    side();
    translate([46, 90,0]) rotate([0,0,180])  side();
  }
}