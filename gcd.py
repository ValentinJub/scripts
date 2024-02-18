import sys

# Check there are input parameters

if len(sys.argv) != 3:
    sys.exit("This script returns the greatest common divisor of two integers, script usage: <script> <Integer A> <Integer B> - where A > B >= 0")

# Check that the inputs respect the theorem rule:
# A is nonnegative and B is over 0, in short A > B > 0

A = int(sys.argv[1])
B = int(sys.argv[2])

if A <= B:
    sys.exit("A must be > to B")
if B < 0:
    sys.exit("B must be a >= to 0")

# End input checks
    
a = A
b = B
r = B

while b != 0:
    r = a % b
    a = b
    b = r

print(f"gcd({A},{B}) = {a}")
sys.exit()