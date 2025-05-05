import struct
import math

def float_to_ieee754_hex(value):
    """Converts a float to its IEEE 754 hex representation (32-bit)."""
    return struct.pack('!f', value).hex().upper()

def to_q15(value):
    """Converts a float to Q15 format (scaled by 32768)."""
    return int(value * 32768) & 0xFFFF  # Ensuring it's within 16-bit range

with open("./utils/input_data.txt", "w") as file:
    for i in range(-180, 181):
        # Angle in degrees
        angle_deg = i
        
        # Convert to IEEE754 format
        angle_ieee754 = float_to_ieee754_hex(float(i))
        
        # Compute sin and cos in float
        angle_rad = math.radians(i)
        sin_val = math.sin(angle_rad)
        cos_val = math.cos(angle_rad)
        
        # Convert sin and cos to Q15 format
        sin_q15 = to_q15(sin_val)
        cos_q15 = to_q15(cos_val)
        
        # Write data to file
        file.write(f"{angle_deg}\t{angle_ieee754}\t{sin_q15}\t{cos_q15}\t{sin_val}\t{cos_val}\n")
