with (Camera){
    if (pov==CameraPOV.cam_first){
        pov=CameraPOV.cam_third;
    } else if (pov==CameraPOV.cam_third){
        pov=CameraPOV.cam_first;
    }
}
