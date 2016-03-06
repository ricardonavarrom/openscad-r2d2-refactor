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
    sphereRadius = 4;
    sphereScalation = [SCALATION_NEUTRAL_ELEMENT, SCALATION_NEUTRAL_ELEMENT, 1.6];
    sphereTranslation = [TRANSLATION_NEUTRAL_ELEMENT, TRANSLATION_NEUTRAL_ELEMENT, 1];
    
    internalCylinderHeight = double(sphereRadius);
    externalCylinderHeight = 3;
    
    intersectionScalation = [1.4, 1.4, 1.4];
    
    rotation = [ROTATION_NEUTRAL_ELEMENT, -5, ROTATION_NEUTRAL_ELEMENT];
    cubeTranslation = [changeSign(sphereRadius), -1, changeSign(double(sphereRadius))];
    cubeDimensions = [double(sphereRadius), half(sphereRadius), 20];
    cylinderTranslation = [TRANSLATION_NEUTRAL_ELEMENT, TRANSLATION_NEUTRAL_ELEMENT, -2];
    externalCylinderTopRadius = 4.6;
    
    rotate(rotation)
        intersection() {
            translate(cubeTranslation)
                cube(cubeDimensions);
            
            union() {
                translate(cylinderTranslation) 
                    cylinder(externalCylinderHeight, externalCylinderHeight, externalCylinderTopRadius);
                
                scale(intersectionScalation)
                    intersection() {
                        cylinder(internalCylinderHeight, externalCylinderHeight, externalCylinderHeight);
                        
                        translate(sphereTranslation) 
                            scale(sphereScalation)
                                sphere(sphereRadius);
                    }
            }
        }
}

module perforatedHip() {
    difference () {
        translate([0, 13.8, 27])
            hip();
        translate([-0.6, 18, 33])
                rotate([90, -5, 0]) 
                    cylinder(4, 2, 2);
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
    perforatedHip();
    
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