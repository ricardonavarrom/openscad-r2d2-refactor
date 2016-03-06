include <constants.scad>

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