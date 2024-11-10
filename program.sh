# C
clang -v -fverbose-asm -o ./c/program ./c/main.c
PASS_C=$(./c/program)
rm ./c/program

# C++
clang++ -v -fverbose-asm -o ./cpp/program ./cpp/main.cxx
PASS_CPP=$(./cpp/program $PASS_C)
rm ./cpp/program

# Pascal
PASS_PASCAL==$(./pascal/program $PASS_CPP)

# Python
PASS_PYTHON=$(python -v ./python/main.py $PASS_PASCAL)

# Rust
rustc -v -o ./rust/program ./rust/main.rs
PASS_RUST=$(./rust/program $PASS_PYTHONG)
rm ./rust/program

# Fortran
gfortran ./fortran/main.f90 -v -o ./fortran/program
PASS_FORTRAN=$(./fortran/program $PASS_RUST)
rm ./fortran/program

# Java
PASS_JAVA=$(java ./java/main.java)

# Go
PASS_GO=$(go run -v ./go/main.go $PASS_JAVA)

# Bash...of course
PASS_BASH=$(echo $PASS_GO)

# Lua
PASS_LUA=$(lua -W ./lua/main.lua $PASS_BASH)

# Javascript
PASS_JS=$(node ./js/main.js $PASS_LUA)

echo $PASS_JS
