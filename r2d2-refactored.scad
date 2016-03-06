include <constants.scad>
include <functions.scad>
include <body.scad>
include <principal-camera.scad>
include <secondary-camera.scad>

module ankle() {
    dimensions = [6, 1.5, 2.5];
    
    cube(dimensions);
}

module footDifferenceCubes(shoeSize) {
    union() {
        translate([-1, changeSign(shoeSize), TRANSLATION_NEUTRAL_ELEMENT])
            rotate([-20, ROTATION_NEUTRAL_ELEMENT, ROTATION_NEUTRAL_ELEMENT])
                cube([10, 9, 9]);
        
        translate([-1, shoeSize, TRANSLATION_NEUTRAL_ELEMENT])
            rotate([20, ROTATION_NEUTRAL_ELEMENT, ROTATION_NEUTRAL_ELEMENT]) 
                cube([10, 9, 9]);
        
        translate([-10, TRANSLATION_NEUTRAL_ELEMENT, TRANSLATION_NEUTRAL_ELEMENT])
            rotate([ROTATION_NEUTRAL_ELEMENT, 20, ROTATION_NEUTRAL_ELEMENT])
                cube([10, 9, 9]);
        
        translate([shoeSize, TRANSLATION_NEUTRAL_ELEMENT, TRANSLATION_NEUTRAL_ELEMENT])
            rotate([ROTATION_NEUTRAL_ELEMENT,- 20, ROTATION_NEUTRAL_ELEMENT]) 
                cube([10, 9, 9]);
        
        translate([TRANSLATION_NEUTRAL_ELEMENT, 4.1, 3.3])
            cube([9, 1.5, 1]);
    }
}

module foot() {
    shoeSize = 8;
    dimensions = [shoeSize, shoeSize, half(shoeSize)];
    
    difference() {
        cube(dimensions);
        footDifferenceCubes(shoeSize);
    }
}

module frontLeg() {
    scalation = [1.41, 1.41, 1.41];
    translation = [-11.2, -4.6, TRANSLATION_NEUTRAL_ELEMENT];
    ankleTranslation = [5, 4.07, 1];
    ankleRotation = [ROTATION_NEUTRAL_ELEMENT, -70, ROTATION_NEUTRAL_ELEMENT];
    
    scale(scalation) 
        translate(translation) 
            union() {
                translate(ankleTranslation) 
                    rotate(ankleRotation) 
                        ankle();
                
                foot();
            }
}

module hip() {
    rotate([0, -5, 0])
                intersection() {
                    translate([-4, -1, -8])
                        cube([8, 2, 20]);
                    union() {
                        translate([0, 0, -2]) 
                            cylinder(3, 3, 4.6);
                        scale([1.4, 1.4, 1.4])
                            intersection() {
                                cylinder(8, 3, 3);
                                translate([0, 0, 1]) 
                                    scale([1, 1, 1.6])
                                        sphere(4);
                            }
                    }
                }
}

module lateralLegTopInside() {
    translate([0, 12, 27]) 
        hip();
            
    translate([-2, 11, 15])
        rotate([0, -5, 0])
            cube([6, 2, 10]);
}

module lateralLegTopOutside() {
    difference () {
        translate([0, 13.8, 27])
            hip();
        translate([-0.6, 18, 33])
                rotate([90, -5, 0]) 
                    cylinder(4, 2, 2);
    }
    
    translate([-1.8, 12, 29]) 
        rotate([0, -5, 0])
            cube([3, 4, 3]);
    
    translate([-1.8, 12, 13]) 
        rotate([0, -5, 0]) 
            cube([6, 2, 14]);

    translate([-0.5, 12, 13])
        rotate([0, -5, 0])
            cube([3.5, 3, 18]);
}

module lateralLegKnee() {
    scale([1.4, 1.2, 1]) 
        rotate([0, -5, 0]) 
            translate([-0.4, 9, 9]) 
                intersection() {
                    cube(5);
                    translate([2.5, 2.5, 2.5]) 
                        scale([1, 1, 1.5]) 
                            sphere(3);
                }
}

module lateralLegFoot() {
    scalation = [1.2, 1.2, 1.2];
    
    scale(scalation) 
        foot();
}

module lateralLegAnkle() {
    translation = [3.5, 5, 7];
    rotation = [ROTATION_NEUTRAL_ELEMENT, 80, ROTATION_NEUTRAL_ELEMENT];
    
    translate(translation) 
        rotate(rotation) 
            ankle();
}

module lateralLegBottom() {
    scalation = [1.41, 1.41, 1.41];
    translation = [-4, 4, TRANSLATION_NEUTRAL_ELEMENT];
    
    scale(scalation) 
        translate(translation) 
            union() {
                lateralLegAnkle();
                lateralLegFoot();
            }
}

module lateralLegTop() {
    lateralLegTopInside();
    lateralLegTopOutside(); 
}

module lateralLeg() {
    union() {
        lateralLegTop(); 
        lateralLegKnee(); 
        lateralLegBottom();
    }
}

module rightLeg() {
    lateralLeg();
}

module leftLeg() {
    rotation = [ROTATION_NEUTRAL_ELEMENT, ROTATION_NEUTRAL_ELEMENT, HALF_ROTATION];
    
    rotate(rotation) 
        lateralLeg();
}

module r2d2() {
    body();
    principalCamera();
    secondaryCamera();
    frontLeg();
    rightLeg();
    leftLeg();
}

r2d2();