#include <stdio.h>
#include <stdint.h>
#include "./common.h"


void low_level_simulation(fixed_t* theta, fixed_t* sin, fixed_t* cos){
    *sin = 0;
    *cos = SCALING_FACTOR;
    fixed_t cos_next = 0, phi = 0;
    int i;

    // Representation: <angle_deg> * 2^16 / 180
    static fixed_t atantable[WIDTH] = {  
        0x4000,   //atan(2^0) = 45 degrees
        0x25C8,   //atan(2^-1) = 26.5651
        0x13F6,   //atan(2^-2) = 14.0362
        0x0A22,   //7.12502
        0x0516,   //3.57633
        0x028B,   //1.78981
        0x0145,   //0.895174
        0x00A2,   //0.447614
        0x0051,   //0.223808
        0x0029,   //0.111904
        0x0014,   //0.05595
        0x000A,   //0.0279765
        0x0005,   //0.0139882
        0x0003,   //0.0069941
        0x0002,   //0.0035013
        0x0001    //0.0017485
    };
    
    // Edge cases
    if(*theta == 0x4000) {
        *sin = 0x5A82; 
        *cos = 0x5A82;
        return;
    } else if(*theta == 0){
        *sin = 0; 
        *cos = 0x8000;
        return;
    }

    // Standard cases
    for(i = 0; i < WIDTH; i++){
        
        if(phi < *theta){
            cos_next = *cos - (*sin >> i);
            *sin += (*cos >> i); 
            *cos = cos_next;
            phi += atantable[i];
        } else if (phi > *theta){
            cos_next = *cos + (*sin >> i);
            *sin -= (*cos >> i); 
            *cos = cos_next;
            phi -= atantable[i];
        }
        
    }
    return;
}