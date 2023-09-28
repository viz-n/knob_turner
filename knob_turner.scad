
include <./gear.scad>
SG90_A = 32;
SG90_B = 23;
SG90_C = 28.5;
SG90_D = 12;
SG90_E = 32;
SG90_F = 19.5;








module SG90(){

	translate([0,-SG90_D/2,-3])
	{

	cube([SG90_C,SG90_D,SG90_B]);



	translate([SG90_F,0,-4.5])
	cube([4,SG90_D,SG90_E]);
	}

	rotate([0,90,0])
	cylinder(h=SG90_A,r=3);
}




module knob(){
	color("green"){
		translate([0,0,10])
		cube([30,10,20],center=true);
		cylinder(h=10,r=30);
	}
}


translate([62,0,27])
rotate([0,0,180])
rotate([180,0,0])
SG90();


knob();

// face();



module face() {
	
	translate([0,10,10])
	cube([40,10,10],center = true);

	translate([0,-10,10])
	cube([40,10,10],center = true);





	translate([15,0,10])
	cube([10,25,10],center = true);


	translate([-15,0,10])
	cube([10,25,10],center = true);


	// translate([-0,0,8])
	// cylinder(h=10,r=20);
}


translate([0,0,10])
// scale(2)
bevel_gear(modul=2, tooth_number=30, partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=30);



// translate
translate([32,0,027])
rotate([0,-90,0])
rotate([0,0,0])
// scale(2)s
mirror([1,0,0])
// mirror([0,0,1])
bevel_gear(modul=2, tooth_number=15, partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=30);


color("orange")
translate([20,-20,0])
cube([10,40,30]);