import struct

def float_to_ieee754_hex(value):
    """Converts a float to its IEEE 754 hex representation (32-bit)."""
    return struct.pack('!f', value).hex().upper()

with open("./build/input_degrees.txt", "w") as file:
    for i in range(-180, 181):
        hex_val = float_to_ieee754_hex(float(i))
        file.write(hex_val + "\n")
