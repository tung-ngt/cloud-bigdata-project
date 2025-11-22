#!/usr/bin/env python3
import random, sys

TOTAL_WORDS = int(sys.argv[1]) if len(sys.argv) > 1 else 50000
MIN_W = 20
MAX_W = 40
OUT = "input.txt"

with open("/usr/share/dict/words") as f:
    words = f.read().split()

with open(OUT, "w") as out:
    left = TOTAL_WORDS
    while left > 0:
        n = random.randint(MIN_W, MAX_W)
        if n > left: n = left
        line = " ".join(random.choice(words) for _ in range(n))
        out.write(line + "\n")
        left -= n
        print((TOTAL_WORDS - left) / TOTAL_WORDS)
