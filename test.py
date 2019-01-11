#!/usr/bin/python
import sys
modulenames = set(sys.modules)&set(globals())
allmodules = [sys.modules[name] for name in modulenames]
