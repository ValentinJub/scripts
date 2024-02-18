import sys

# Check there are input parameters

if len(sys.argv) != 3:
    sys.exit("script usage: <Integer A> <Integer B> where A > B > 0")

# Check that the inputs respect the theorem rule:
# A is nonnegative and B is over 0, in short A > B > 0

A = int(sys.argv[1])
B = int(sys.argv[2])

if A < 0:
    sys.exit("A must be non negative integer")
if B <= 0:
    sys.exit("B must be a positive integer")

# End input checks
    
r = A
q = 0

while r >= B:
    r = r - B
    q = q + 1

print(f"{A} = {B}*{q} + {r}")
sys.exit()