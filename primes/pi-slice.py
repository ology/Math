import re                       # Regular expressions
from mpmath import mp           # pi
import gmpy2 as gmp             # prime numbers
import matplotlib.pyplot as plt # Charting

points = []

# How many primes are in slices?

for x in range(2, 101):
    # Set the number of pi digits desired
    mp.dps = x
    # Capture the decimal part only
    digits = re.sub(r'^3\.(.+)$', r'\1', str(mp.pi))

    # Count of seen primes
    count = 0

    # Inspect successive chunks of the digits
    for i in range(0, len(digits) + 1):
        for j in range(i, len(digits) + 1):
            if i != j:
                n = int(digits[i:j])
                if gmp.is_prime(n):
                    count += 1
                    #print(i, j, n)

    #print(digits, len(digits), count)
    points.append(count)

plt.plot(range(0, len(points)), points)
plt.xlabel('pi Slice Size')
plt.ylabel('Number of primes seen')
plt.show()


# How many overlapping primes are there?
import collections

seen = {}
points = collections.defaultdict(lambda : {'count': 0, 'primes': []})

for x in range(2, 101):
    # Set the number of pi digits desired
    mp.dps = x
    # Capture the decimal part only
    digits = re.sub(r'^3\.(.+)$', r'\1', str(mp.pi))

    # Inspect successive chunks of the digits
    for i in range(0, len(digits) + 1):
        for j in range(i, len(digits) + 1):
            if i != j:
                # Get the nth digit as an integer
                n = int(digits[i:j])

                if gmp.is_prime(n):
                    # If this prime has not been seen...
                    if not n in seen:
                        seen[n] = 1

                        # Increment the number of times seen
                        if not i in points:
                            points[i]['count'] = 1
                        else:
                            points[i]['count'] += 1
                        
                        # Add the prime seen for later inspection
                        points[i]['primes'].append(n)

# The y-axis is the count of the number of primes seen at each position
yaxis = [points[c]['count'] for c in points]

plt.plot(range(0, len(points)), yaxis)
plt.xlabel('Position')
plt.ylabel('Number of overlaps')
plt.show()
