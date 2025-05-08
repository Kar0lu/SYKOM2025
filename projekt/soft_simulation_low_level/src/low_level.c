#include <stdio.h>
#include <stdint.h>
#include "./common.h"

void low_level_simulation(fixed_t* theta, fixed_t* sin_c, fixed_t* cos_c, int8_t debug){
    if (debug) printf("=== CORDIC ALGORYTHM ===\n");
    *sin_c = 0;
    *cos_c = SCALING_FACTOR;
    fixed_t cos_c_next = 0, phi = 0;
    int i;

    // // Representation: <angle_deg> * 2^16 / 180
    // static fixed_t atantable[WIDTH] = {  
    //     0x4000,   //atan(2^0) = 45 degrees
    //     0x25C8,   //atan(2^-1) = 26.5651
    //     0x13F6,   //atan(2^-2) = 14.0362
    //     0x0A22,   //7.12502
    //     0x0516,   //3.57633
    //     0x028B,   //1.78981
    //     0x0145,   //0.895174
    //     0x00A2,   //0.447614
    //     0x0051,   //0.223808
    //     0x0029,   //0.111904
    //     0x0014,   //0.05595
    //     0x000A,   //0.0279765
    //     0x0005,   //0.0139882
    //     0x0003,   //0.0069941
    //     0x0002,   //0.0035013
    //     0x0001    //0.0017485
    // };
    static fixed_t atantable[WIDTH] = {
        0x40000000,
        0x25C80A3B,
        0x13F670B7,
        0x0A2223A8,
        0x05161A86,
        0x028BAFC3,
        0x0145EC3D,
        0x00A2F8AA,
        0x00517CA7,
        0x0028BE5D,
        0x00145F30,
        0x000A2F98,
        0x000517CC,
        0x00028BE6,
        0x000145F3,
        0x0000A2FA,
        0x0000517D,
        0x000028BE,
        0x0000145F,
        0x00000A30,
        0x00000518,
        0x0000028C,
        0x00000146,
        0x000000A3,
        0x00000051,
        0x00000029,
        0x00000014,
        0x0000000A,
        0x00000005,
        0x00000003,
        0x00000001,
        0x00000001,
    };
    
    // Edge cases
    if(*theta == 0x40000000) {
        *sin_c = 0x5A820000; 
        *cos_c = 0x5A820000;
        return;
    } else if(*theta == 0){
        *sin_c = 0; 
        *cos_c = 0x80000000;
        return;
    }

    // Standard cases
    for(i = 0; i < WIDTH; i++){
        
        if(phi < *theta){
            cos_c_next = *cos_c - (*sin_c >> i);
            *sin_c += (*cos_c >> i); 
            *cos_c = cos_c_next;
            phi += atantable[i];
        } else if (phi > *theta){
            cos_c_next = *cos_c + (*sin_c >> i);
            *sin_c -= (*cos_c >> i); 
            *cos_c = cos_c_next;
            phi -= atantable[i];
        }
        
    }
    return;
}