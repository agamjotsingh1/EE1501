import numpy as np

# Define the arrays
arrays = [
    ([1, 2, 3, 4, 0, 1, 0, 1], [1, 0, 1, 0, 1, 0, 1, 0]),
    ([1, 1, 1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1, 1, 1]),
    ([1, 0, 1, 0, 1, 0, 1, 0], [1, 0, 1, 0, 1, 0, 1, 0]),
    ([1, 2, 3, 4, 5, 6, 7, 8], [1, 1, 1, 1, 1, 1, 1, 1]),
    ([5, 5, 5, 5, 5, 5, 5, 5], [1, 2, 3, 4, 5, 6, 7, 8]),
    ([15, 15, 15, 15, 15, 15, 15, 15], [15, 15, 15, 15, 15, 15, 15, 15]),
    ([1, 0, 0, 0, 0, 0, 0, 0], [2, 3, 4, 5, 6, 7, 8, 9]),
    ([7, 3, 9, 2, 5, 1, 8, 4], [6, 2, 7, 1, 9, 3, 5, 8])
]

# Print in the exact format requested
for x, h in arrays:
    print(f"x = [{', '.join(' ' + str(i) for i in x)}]")
    print(f"h = [{', '.join(' ' + str(i) for i in h)}]")
    print(f"x*h = [{', '.join(' ' + str(i%16) for i in np.convolve(x, h))}]")
    print()

