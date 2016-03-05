//%translate([-25,-25,0]) cube(50);
//BODY
scale ([1.15,1.15,1.15]) translate ([0,0,1.5]) union()
{
	translate ([-5,0,8]) rotate([0,18,0]) cylinder(25,10,10);
	translate ([2.47,0,31]) rotate([0,18,0]) scale([1,1,1.1]) sphere(10);
	translate ([-5.9,0,5.3]) rotate ([0,18,0]) cylinder(3.2,7.5,10);
}
//CAMERA
scale ([1.1,1.1,1.1]) translate ([-0.5,0,3]) union()
{
	translate ([-5.5,-2,38]) rotate ([-0.5,45,0]) cube(4);
	translate ([-3.4,0,39]) rotate ([0,45,0]) sphere(1.9);
}
//CAMERA 2
translate ([-6,-5,43]) rotate([0,20,25]) union()
{
	scale ([1,1,0.8]) sphere(1.8);
	translate ([-1,0,0]) rotate ([0,-90,0]) cylinder (1,0.8,0.8);
}
//FRONT FOOT
scale ([1.41,1.41,1.41]) translate ([-11.2,-4.6,0]) union()
{
	difference()
	{
		cube([8,8,4]);
		union()
		{
			translate ([-1,-8,0]) rotate ([-20,0,0]) cube ([10,9,9]);
			translate ([-1,8,0]) rotate ([20,0,0]) cube ([10,9,9]);
			translate ([-10,0,0]) rotate([0,20,0]) cube([10,9,9]);
			translate ([8,0,0]) rotate([0,-20,0]) cube([10,9,9]);
			translate ([0,4.1,3.3]) cube ([9,1.5,1]);
		}	
	}
	translate ([5,4.07,1]) rotate ([0,-70,0]) cube([6,1.5,2.5]);
}
union()
{
//SIDE LEG #1
	//INSIDE LEG
translate ([0,12,27]) rotate ([0,-5,0]) intersection()
{
	translate ([-4,-1,-3]) cube([8,2,25]);
	union()
	{
		translate ([0,0,-2]) cylinder(3,3,4.6);
		scale ([1.4,1.4,1.4]) intersection()
		{
			cylinder(8,3,3);
			translate ([0,0,1]) scale ([1,1,1.6]) sphere(4);
		}
	}
}
translate ([-2,11,15]) rotate ([0,-5,0]) cube([6,2,10]);
	//OUTSIDE LEG
difference ()
{
	translate ([0,13.8,27]) rotate ([0,-5,0]) intersection()
	{
		translate ([-4,-1,-8]) cube([8,2,20]);
		union()
		{
			translate ([0,0,-2]) cylinder(3,3,4.6);
			scale ([1.4,1.4,1.4]) intersection()
			{
				cylinder(8,3,3);
				translate ([0,0,1]) scale ([1,1,1.6]) sphere(4);
			}
		}
	}
	translate([-0.6,18,33]) rotate ([90,-5,0]) cylinder(4,2,2);
}
translate ([-1.8,12,29]) rotate ([0,-5,0]) cube([3,4,3]);
translate ([-1.8,12,13]) rotate ([0,-5,0]) cube([6,2,14]);
translate ([-0.5,12,13]) rotate ([0,-5,0]) cube([3.5,3,18]);
scale ([1.4,1.2,1]) rotate ([0,-5,0]) translate ([-0.4,9,9]) intersection()
{
	cube(5);
	translate ([2.5,2.5,2.5]) scale ([1,1,1.5]) sphere(3);
}
	//FOOT
scale ([1.41,1.41,1.41]) translate ([-4,4,0]) union()
{
	scale ([1.2,1.2,1.2]) difference()
	{
		cube([8,8,4]);
		union()
		{
			translate ([-1,-8,0]) rotate ([-20,0,0]) cube ([10,9,9]);
			translate ([-1,8,0]) rotate ([20,0,0]) cube ([10,9,9]);
			translate ([-10,0,0]) rotate([0,20,0]) cube([10,9,9]);
			translate ([8,0,0]) rotate([0,-20,0]) cube([10,9,9]);
			translate ([0,4.1,3.3]) cube ([9,1.5,1]);
		}	
	}
	translate ([3.5,5,7]) rotate ([0,80,0]) cube([6,1.5,2.5]);
}
}
translate ([0,0,0]) rotate ([0,0,180]) union()
{
//SIDE LEG #2
	//INSIDE LEG
translate ([0,12,27]) rotate ([0,-5,0]) intersection()
{
	translate ([-4,-1,-3]) cube([8,2,25]);
	union()
	{
		translate ([0,0,-2]) cylinder(3,3,4.6);
		scale ([1.4,1.4,1.4]) intersection()
		{
			cylinder(8,3,3);
			translate ([0,0,1]) scale ([1,1,1.6]) sphere(4);
		}
	}
}
translate ([-2,11,15]) rotate ([0,-5,0]) cube([6,2,10]);
	//OUTSIDE LEG
difference ()
{
	translate ([0,13.8,27]) rotate ([0,-5,0]) intersection()
	{
		translate ([-4,-1,-8]) cube([8,2,20]);
		union()
		{
			translate ([0,0,-2]) cylinder(3,3,4.6);
			scale ([1.4,1.4,1.4]) intersection()
			{
				cylinder(8,3,3);
				translate ([0,0,1]) scale ([1,1,1.6]) sphere(4);
			}
		}
	}
	translate([-0.6,18,33]) rotate ([90,-5,0]) cylinder(4,2,2);
}
translate ([-1.8,12,29]) rotate ([0,-5,0]) cube([3,4,3]);
translate ([-1.8,12,13]) rotate ([0,-5,0]) cube([6,2,14]);
translate ([-0.5,12,13]) rotate ([0,-5,0]) cube([3.5,3,18]);
scale ([1.4,1.2,1]) rotate ([0,-5,0]) translate ([-0.4,9,9]) intersection()
{
	cube(5);
	translate ([2.5,2.5,2.5]) scale ([1,1,1.5]) sphere(3);
}
	//FOOT
scale ([1.41,1.41,1.41]) translate ([-4,4,0]) union()
{
	scale ([1.2,1.2,1.2]) difference()
	{
		cube([8,8,4]);
		union()
		{
			translate ([-1,-8,0]) rotate ([-20,0,0]) cube ([10,9,9]);
			translate ([-1,8,0]) rotate ([20,0,0]) cube ([10,9,9]);
			translate ([-10,0,0]) rotate([0,20,0]) cube([10,9,9]);
			translate ([8,0,0]) rotate([0,-20,0]) cube([10,9,9]);
			translate ([0,4.1,3.3]) cube ([9,1.5,1]);
		}	
	}
	translate ([3.5,5,7]) rotate ([0,80,0]) cube([6,1.5,2.5]);
}
}