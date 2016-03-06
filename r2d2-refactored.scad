TRANSLATION_NEUTRAL_ELEMENT = 0;
SCALATION_NEUTRAL_ELEMENT = 1;
ROTATION_NEUTRAL_ELEMENT = 0;
QUARTER_ROTATION = 90;

function half(value) = value / 2;

function changeSign(value) = value * -1;

module head(radius, rotation) {
    translation = [2.47, TRANSLATION_NEUTRAL_ELEMENT, 31];
    scalation = [SCALATION_NEUTRAL_ELEMENT, SCALATION_NEUTRAL_ELEMENT, 1.1];
    
    translate(translation) 
        rotate(rotation) 
            scale(scalation) 
                sphere(radius);
}

module trunk(radius, rotation) {
    height = 25;
    translation = [-5, TRANSLATION_NEUTRAL_ELEMENT, 8];
    
    translate(translation) 
        rotate(rotation) 
            cylinder(height, radius, radius);
}

module waist(radius, rotation) {
    height = 3.2;
    bottomRadius = 7.5;
    translation = [-5.9, TRANSLATION_NEUTRAL_ELEMENT, 5.3];
    
    translate(translation) 
        rotate(rotation) 
            cylinder(height, bottomRadius, radius);
}

module body() {
    radius = 10;
    rotation = [ROTATION_NEUTRAL_ELEMENT, 18, ROTATION_NEUTRAL_ELEMENT];
    scalation = [1.15, 1.15, 1.15];
    translation = [TRANSLATION_NEUTRAL_ELEMENT, TRANSLATION_NEUTRAL_ELEMENT, 1.5];
    
    scale(scalation) 
        translate(translation) 
            union() {
                head(radius, rotation);
                trunk(radius, rotation);
                waist(radius, rotation);
            } 
}

module principalCameraBody() {
    size = 4;
    translation = [-5.5, changeSign(half(size)), 38];
    rotation = [-0.5, half(QUARTER_ROTATION), ROTATION_NEUTRAL_ELEMENT];
    
    translate(translation) 
        rotate(rotation) 
            cube(size);
}

module principalCameraLens() {
    radius = 1.9;
    translation = [-3.4, TRANSLATION_NEUTRAL_ELEMENT, 39];
    rotation = [ROTATION_NEUTRAL_ELEMENT, half(QUARTER_ROTATION), ROTATION_NEUTRAL_ELEMENT];
    
    translate(translation) 
        rotate(rotation) 
            sphere(radius);
}

module principalCamera() {
    scalation = [1.1, 1.1, 1.1];
    translation = [-0.5, TRANSLATION_NEUTRAL_ELEMENT, 3];
    
    scale(scalation) 
        translate(translation) 
            union() {
                principalCameraBody();
                principalCameraLens();
            }
}

module secondaryCameraBody() {
    radius = 1.8;
    scalation = [SCALATION_NEUTRAL_ELEMENT, SCALATION_NEUTRAL_ELEMENT, 0.8];
    
    scale(scalation) 
        sphere(radius);
}

module secondaryCameraLens() {
    height = 1;
    radius = 0.8;
    translation = [-1, TRANSLATION_NEUTRAL_ELEMENT, TRANSLATION_NEUTRAL_ELEMENT];
    rotation = [ROTATION_NEUTRAL_ELEMENT, changeSign(QUARTER_ROTATION), ROTATION_NEUTRAL_ELEMENT];
    
    translate(translation) 
        rotate(rotation) 
            cylinder(height, radius, radius);
}

module secondaryCamera() {
    translation = [-6, -5, 43];
    rotation = [ROTATION_NEUTRAL_ELEMENT, 20, 25];
    
    translate(translation)
        rotate(rotation) 
            union() {
                secondaryCameraBody();
                secondaryCameraLens();
            }
}

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

module rightLeg() {
    union() {
    //SIDE LEG #1
        
        //INSIDE LEG
        translate([0, 12, 27]) 
            rotate([0, -5, 0]) 
                intersection() {
                    translate([-4, -1, -3])
                        cube([8, 2, 25]);
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
        translate([-2, 11, 15])
                rotate([0, -5, 0])
                    cube([6, 2, 10]);
                
                
                
        //OUTSIDE LEG
        difference () {
            translate([0, 13.8, 27])
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
        scale([1.4, 1.2, 1]) 
            rotate([0, -5, 0]) 
                translate([-0.4, 9, 9]) 
                    intersection() {
                        cube(5);
                        translate([2.5, 2.5, 2.5]) 
                            scale([1, 1, 1.5]) 
                                sphere(3);
                    }
    
    
    
    
        //FOOT
        scale([1.41, 1.41, 1.41]) 
            translate([-4, 4, 0]) 
                union() {
                    translate([3.5, 5, 7]) 
                        rotate([0, 80, 0]) 
                            ankle();
                    scale([1.2, 1.2, 1.2]) 
                        foot();
                }
    }
}

module leftLeg() {
    translate([0, 0, 0]) 
        rotate([0, 0, 180]) 
            union() {
                //SIDE LEG #2
        
                //INSIDE LEG
                translate([0, 12, 27]) 
                    rotate([0, -5, 0]) 
                        intersection() {
                            translate([-4, -1, -3]) 
                                cube([8, 2, 25]);
                            union() {
                                translate([0, 0, -2]) 
                                    cylinder(3, 3, 4.6);
                                scale([1.4, 1.4, 1.4]) 
                                    intersection() {
                                        cylinder(8, 3, 3);
                                        translate([0 ,0 ,1]) 
                                            scale([1, 1, 1.6])
                                                sphere(4);
                                    }
                            }
                        }
                translate([-2, 11, 15])
                        rotate([0, -5, 0]) 
                            cube([6, 2, 10]);
        
                        
                //OUTSIDE LEG
                difference () {
                    translate([0, 13.8, 27]) 
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
                scale([1.4, 1.2, 1]) 
                    rotate([0, -5, 0]) 
                        translate([-0.4, 9, 9]) 
                            intersection() {
                                cube(5);
                                translate([2.5, 2.5, 2.5])
                                    scale([1, 1, 1.5]) 
                                        sphere(3);
                            }
                
                
                //FOOT
                scale([1.41, 1.41, 1.41]) 
                    translate([-4, 4, 0]) 
                        union() {
                            translate([3.5, 5, 7]) 
                                rotate([0, 80, 0])
                                    ankle();
                            scale([1.2, 1.2, 1.2])
                                foot();
                        }
            }
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