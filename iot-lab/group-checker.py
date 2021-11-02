import re 
import sys

group = sys.argv[1]

if len(group) == 1:
	group = "0"+group

print(group[0:2])