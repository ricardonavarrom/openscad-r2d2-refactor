include <constants.scad>
include <functions.scad>

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