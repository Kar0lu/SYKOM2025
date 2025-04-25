import math

# Function to calculate the CORDIC magic number for a given precision
def calculate_cordic_magic_number(precision):
    K = 1.0  # Initial scaling factor

    # Calculate the scaling factor for the given precision
    for i in range(precision):
        K *= 1.0 / math.sqrt(1 + 2 ** (-2 * i)))  # CORDIC scaling factor formula

    return K

# Main program to interact with the user and calculate the magic number
def main():
    precision = int(input("Enter precision (16, 32, or 64 bits): "))

    if precision in [16, 32, 64]:
        magic_number = calculate_cordic_magic_number(precision)
        print(f"The magic number for {precision} bits is: {magic_number:.8f}")
    else:
        print("Invalid precision! Please enter 16, 32, or 64.")

if __name__ == "__main__":
    main()
