# Suppress -Wrange-loop-construct, triggered as an error by modern GCC with -Werror.
CXXFLAGS:append = " -Wno-error=range-loop-construct"
