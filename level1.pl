#!/usr/bin/python
import sys

def solution(s):
#   wl1x = [*s]		# only work on v3
    wl1x = [x for x in s]
    print(wl1x)
    wlen = len(wl1x)
    if (wlen < 2):
        return 1
    wl2x = wl1x + wl1x

    # wraparound autocorrelation using simple convolution
    sv = []
    for x in range(wlen):
        s = 0
        for a, b in zip(wl1x,wl2x[x:x+wlen]):
            s += (1 if (a == b) else 0)
        sv.append(s)

    # find period of perfect correlation
    print(sv)
    sv = sv[1::]
    mxv = max(sv)
    mxi = (sv.index(mxv) if (mxv == wlen) else wlen-1)
#   mxi = (wlen-1 if ((mxv == 0) or (mxv != wlen)) else sv.index(mxv))

    print(wlen,mxv,mxi)

    return int(wlen/(mxi+1))

print(solution(sys.argv[1]))

