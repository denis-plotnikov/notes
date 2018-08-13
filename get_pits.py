def bits(v):
    for i in range (32):
        r = v & (1<<i)
        print("{0}:{1}".format(i, 1 if r else 0))
