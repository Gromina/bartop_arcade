$fn=160;
side_w = 1.8;   // width of side panels
w2 = 1;         // width of all other panels 10 mm

display_w = 34.5;
display_h = 28;
machine_w = 40;

module side()  {
    rad = 29;
    eps = 0.01;
    difference(){
        cube([ 45.4, 63.5, side_w]);
        translate([-4, rad + 11, -eps])
            cylinder(side_w + 2 * eps, rad, rad, [0, 0, 0]);
        rotate([0, 0, -17]) translate([-29, 30, -eps])
            cube([35, 80, side_w + 2 * eps]);
        rotate([0, 0, -17]) translate([-27, 67, -eps])
            cube([80, 20, side_w + 2 * eps]);
        }
}
module display_panel(){
    color("ForestGreen")
        difference(){
            cube([w2, 48, machine_w]);
            translate([-w2, 6, 0.5 * (machine_w - display_w)])
                cube([3 * w2, display_h, display_w]);
        }
    }

module top_cap(){
    color("DarkBlue")
        cube([21, w2, machine_w]);
}

module back_panel(){
    cube([w2, 56, machine_w]);
}

module marquee(){
    color("Purple", 0.4)
        cube([0.1, 10, machine_w]);
}

module marquee_bot(){
    color("Indigo")
        cube([10 - w2, w2, machine_w]);
}

module controls(){
    color("Aquamarine")
        cube([20, w2, machine_w]);
}

module bottom(){
    color("DimGray")
        cube([45 - w2 * 2, w2, machine_w]);
}

module front(){
    color("SkyBlue")
        cube([w2, 11, machine_w]);
}

color("Olive") {
    side();
   // translate([0,0,machine_w+side_w]) side();
}

rotate([0, 0, -17]){
    translate([15, 18, side_w])
        display_panel();

    // балки
    translate([21, 35, side_w])
        cube([5, 5, machine_w]);
    translate([15 + w2, 18, side_w])
        cube([2, 2, machine_w]);

    translate([6, 67 - w2, side_w])
        top_cap();

    translate([6, 56.6, side_w])
        marquee();
    translate([6, 56.6, side_w])
        marquee_bot();
}

translate([45.4 - w2, 0, side_w])
    back_panel();

rotate([0, 0, 7]) translate([1.5, 11 - w2, side_w]){
    controls();
    translate([1, -2, 0])
        cube([2, 2, machine_w]);
    translate([18, -2, 0])
        cube([2, 2, machine_w]);
}

translate([w2+0.5,0,side_w])
    bottom();

translate([0.5,0,side_w])
    front();

