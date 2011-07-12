# 
# Utility file to help our programs find their libraries.
#

# Find the root of the intro_programming project
intro_base = File.join File.dirname( __FILE__ ), ".."

# Find the `lib` directory
libdir = File.join intro_base, "lib"

require 'rubygems'
# Add `lib` to our loadpath, so its contents can be `require`'d by our
# code.
$LOAD_PATH.push libdir
