
include <./gear.scad>
SG90_A = 32;
SG90_B = 23 + 2;
SG90_C = 28.5;
SG90_D = 12+1;
SG90_E = 32;
SG90_F = 17.5;








module SG90(){
	translate([64+k,0,38])
	rotate([0,0,180])
	rotate([180,0,0])

	{

	// color("blue")
	// translate([0,-SG90_D/2,-3])
	// {

	// cube([SG90_C,SG90_D,SG90_B]);



	// translate([SG90_F,0,-4.5])
	// cube([4,SG90_D,SG90_E]);
	// }

	// translate([0,0,5])
	// rotate([0,90,0])
	// cylinder(h=SG90_A,r=3);

	// translate([12+8,0,-5])
	// rotate([0,90,0])
	// cylinder(h=16,r=1);
    

	// translate([12+8,0,24])
	// rotate([0,90,0])
	// cylinder(h=16,r=1);
    

    color("white")
    translate([SG90_A-4, 0, 5])
    rotate([-90,0,90])
    hull()
    import("horns/SG90_two_horns_with_holes.stl");
	}
}


// SG90();

    // import("horns/SG90_four_horns_with_holes.stl");



module knob(){
	color("green"){
		translate([0,0,18])
		cube([55,18,18],center=true);
		cylinder(h=10,r=44);
	}
}



// knob();


module dovetail(tl=0){
	translate([0,0,36])
	hull(){

		translate([0,0,5])
		cube([5-tl,28,1],center=true);
		cube([10-tl,35,1],center=true);
	}
}


module render_face(){


		difference(){

			translate([0,0,4.5])
			face();

			knob();
			rotate([0,0,90])
			dovetail();


		}


}


module render_handle(){

		
		rotate([0,0,90])
		union(){



			hull(){


			translate([0,0,45])
			cube([6,35,10],center = true);


			translate([0,0,40])
			cylinder(r=10,h=1);

			}



			dovetail(0.5);


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



	translate([0,0,10])
	cylinder(r=15,h=25);


	// translate([-15,0,10])
	// cube([10,25,10],center = true);

	translate([0,0,7])
	// scale(2)
	bevel_gear(modul=2.5, tooth_number=30, partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=30);




	// translate([-0,0,8])
	// cylinder(h=10,r=20);
}


k = 8;


module body(){


	color("orange")
	hull(){

	translate([41 + k,-40,4])
	cube([1,80,25]);



	translate([-40,-60,4])
	cube([1,120,25]);

	}
}


module cross_bar(){

		translate([-15,-50,22])
		cube([30,100,5]);
		translate([-15,-20,22])
		cube([30,40,20]);


}



module render_body(){
	translate([0,0,5])
	{

			difference(){
				body();
				translate([0,0,2])
				scale([0.95,0.95,1])
				body();
				SG90();
				// scale(1.05)
				knob();
				translate([40,0,0])
				cube([15,20,20],center=true);
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

module render_motor_gear(){

difference(){

translate([k,0,6])
difference(){

// translate
translate([32,0,027])
rotate([0,-90,0])
rotate([0,0,-1])
// scale(2)s
mirror([1,0,0])
// mirror([0,0,1])
bevel_gear(modul=2.5, tooth_number=15, partial_cone_angle=45, tooth_width=5, bore=4, pressure_angle=20, helix_angle=30);


horn_holes();



}



translate([-1,0,0])
SG90();

}
}


// translate([-5,0,0])
// SG90();
// horn_holes();



 // hollo_body();
// knob();



// render_handle();
// render_body();
// render_motor_gear();
render_face();

