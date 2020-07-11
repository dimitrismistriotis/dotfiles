#!/bin/env python3

import datetime
import sys

datetimes = {x.rstrip("\n") for x in sys.stdin}
# print(list(datetimes))

sorted_datetimes = sorted(
    map(lambda x: datetime.datetime.strptime(x, "%a %b %d %Y"), datetimes)
)

# sorted_datetimes.sort()

for i in map(lambda x: x.strftime("%a %d %b %Y"), sorted_datetimes):
    print(i)

