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
    externalCylinderTopRadius = 4.6;
    intersectionScalation = [1.4, 1.4, 1.4];
    cylinderTranslation = [TRANSLATION_NEUTRAL_ELEMENT, TRANSLATION_NEUTRAL_ELEMENT, -2];
    cubeDimensions = [double(sphereRadius), half(sphereRadius), 20];
    cubeTranslation = [changeSign(sphereRadius), -1, changeSign(double(sphereRadius))];
    rotation = [ROTATION_NEUTRAL_ELEMENT, -5, ROTATION_NEUTRAL_ELEMENT];
    
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
    cylinderHeight = 4;
    perforationRotation = [QUARTER_ROTATION, -5, ROTATION_NEUTRAL_ELEMENT];
    perforationTranslation = [-0.6, 18, 33];
    hipTranslation = [TRANSLATION_NEUTRAL_ELEMENT, 13.8, 27];
    
    difference () {
        translate(hipTranslation)
            hip();
        
        translate(perforationTranslation)
                rotate(perforationRotation) 
                    cylinder(cylinderHeight, half(cylinderHeight), half(cylinderHeight));
    }
}

module lateralLegTopInside(rotation) {
    translate([-2, 11, 15])
        rotate(rotation)
            cube([6, 2, 10]);
}

module lateralLegHipGroup() {
    hipTranslation = [TRANSLATION_NEUTRAL_ELEMENT, 12, 27];
    
    perforatedHip();
    
    translate(hipTranslation) 
        hip();
}

module lateralLegTopOutside(rotation) {
    translate([-1.8, 12, 29]) 
        rotate(rotation)
            cube([3, 4, 3]);
    
    translate([-1.8, 12, 13]) 
        rotate(rotation) 
            cube([6, 2, 14]);

    translate([-0.5, 12, 13])
        rotate(rotation)
            cube([3.5, 3, 18]);
}

module lateralLegKnee() {
    sphereRadius = 3;
    sphereScalation = [SCALATION_NEUTRAL_ELEMENT, SCALATION_NEUTRAL_ELEMENT, 1.5];
    sphereTranslation = [2.5, 2.5, 2.5];
    cubeSize = 5;
    cubeTranslation = [-0.4, 9, 9];
    cubeRotation = [ROTATION_NEUTRAL_ELEMENT, -5, ROTATION_NEUTRAL_ELEMENT];
    cubeScalation = [1.4, 1.2, SCALATION_NEUTRAL_ELEMENT];
    
    scale(cubeScalation) 
        rotate(cubeRotation) 
            translate(cubeTranslation) 
                intersection() {
                    cube(cubeSize);
                    
                    translate(sphereTranslation) 
                        scale(sphereScalation) 
                            sphere(sphereRadius);
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
    rotation = [ROTATION_NEUTRAL_ELEMENT, -5, ROTATION_NEUTRAL_ELEMENT];
    
    lateralLegHipGroup();
    lateralLegTopInside(rotation);
    lateralLegTopOutside(rotation); 
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