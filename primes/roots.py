from primePy import primes
import matplotlib.pyplot as plt

limit = 100

last = None
gap = 0
n = 0
gaps = []
roots = []

for p in primes.upto(limit):
    n += 1
    if last:
        gap = p - last
    last = p
    if gap:
        root = p ** (1 / gap)
    else:
        root = 0
    gaps.append(gap)
    roots.append(root)
    print(f"{n}. 1/{p}: {1/p}, gap: {gap}, root: {root}")
