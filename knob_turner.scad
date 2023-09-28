
include <./gear.scad>
SG90_A = 32;
SG90_B = 23;
SG90_C = 28.5;
SG90_D = 12;
SG90_E = 32;
SG90_F = 19.5;








module SG90(){
	translate([64,0,27])
	rotate([0,0,180])
	rotate([180,0,0])

	{

	translate([0,-SG90_D/2,-3])
	{

	cube([SG90_C,SG90_D,SG90_B]);



	translate([SG90_F,0,-4.5])
	cube([4,SG90_D,SG90_E]);
	}

	rotate([0,90,0])
	cylinder(h=SG90_A,r=3);

	translate([12,0,-5])
	rotate([0,90,0])
	cylinder(h=12,r=1);
    

	translate([12,0,22])
	rotate([0,90,0])
	cylinder(h=12,r=1);
    
    translate([SG90_A-4, 0, 0])
    rotate([-90,0,90])
    import("horns/SG90_four_horns_with_holes.stl");
	}
}

// SG90();

    // import("horns/SG90_four_horns_with_holes.stl");



module knob(){
	color("green"){
		translate([0,0,10])
		cube([30,10,20],center=true);
		cylinder(h=10,r=32);
	}
}




module render_face(){


		difference(){

			translate([0,0,4.5])
			face();

			knob();

		}


}

module face() {
	

	hull(){

	translate([0,10,10])
	cube([20,10,10],center = true);

	translate([0,-10,10])
	cube([20,10,10],center = true);





	translate([15,0,10])
	cube([5,25,10],center = true);


	translate([-15,0,10])
	cube([5,25,10],center = true);


	translate([0,0,10])
	cylinder(r=15,h=6);

	}

    rotate([0, 0, 90])
	hull(){


	translate([0,0,40])
	cube([6,35,10],center = true);


	translate([0,0,35])
	cylinder(r=10,h=1);

	};


	translate([0,0,10])
	cylinder(r=10,h=25);


	// translate([-15,0,10])
	// cube([10,25,10],center = true);

	translate([0,0,7])
	// scale(2)
	bevel_gear(modul=2, tooth_number=30, partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=30);




	// translate([-0,0,8])
	// cylinder(h=10,r=20);
}




module body(){


	color("orange")
	hull(){

	translate([48,-30,3])
	cube([1,60,35]);



	translate([-40,-50,3])
	cube([1,100,30]);

	}
}


module cross_bar(){

		translate([-15,-50,22])
		cube([30,100,5]);
		translate([-15,-20,22])
		cube([30,40,20]);


}
module hollo_body(){

	difference(){
		body();
		scale([0.9,0.9,1.1])
		body();
		SG90();
		// scale(1.05)
		knob();
	}







	color("red")
	intersection(){


	body();
		
	difference(){
		cross_bar();
		scale(1.08)
		face();

	}




}

}


module horn_holes(){
    translate([SG90_A-10, 0, 27])
	rotate([90,0,0])
	rotate([0,90,0])
	{
		for(i = [0:4]){
			translate([4.9*cos(i*90),4.6*sin(i*90),0])
			cylinder(r=0.6,h=20);
		}
		for(i = [0:4]){
			translate([6.9*cos(i*90),6.6*sin(i*90),0])
			cylinder(r=0.6,h=20);
		}
		// for()
		for(i = [0:2]){
			translate([6.9*cos(i*90*2+90),8.6*sin(i*90*2+90),0])
			cylinder(r=0.6,h=20);
		}
		// for(i = [0:2]){
		// 	translate([6.9*cos(i*90*2+90),10.6*sin(i*90*2+90),0])
		// 	cylinder(r=0.6,h=20);
		// }

		// for(i = [0:2]){
		// 	translate([6.9*cos(i*90*2+90),12.6*sin(i*90*2+90),0])
		// 	cylinder(r=0.6,h=20);
		// }

	}
    // translate([SG90_A-4, 0, 0])
    // rotate([-90,0,90])


}


// horn_holes();

// intersection(){

	// cube([30,40,30],center=true);
    // import("horns/SG90_four_horns_with_holes.stl");
    // scale(1.1)
    // import("horns/SG90_four_horns_without_holes.stl");
// }
	// cube([30,40,30]);

module motor_gear(){


difference(){

// translate
translate([32,0,027])
rotate([0,-90,0])
rotate([0,0,0])
// scale(2)s
mirror([1,0,0])
// mirror([0,0,1])
bevel_gear(modul=2, tooth_number=15, partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=30);


horn_holes();
}

}

// horn_holes();

// motor_gear();
// SG90();

 hollo_body();
// knob();

 render_face();

