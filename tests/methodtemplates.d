/+
 dub.sdl:
 name "methodtemplates"
 dependency "openmethods" path="../"
 buildType "x" {
   buildOptions "debugMode" "debugInfo" "unittests"
   debugVersions "explain"
 }

 buildType "xtc" {
   buildOptions "debugMode" "debugInfo" "unittests"
   debugVersions "explain" "traceCalls"
 }
 +/

import openmethods;
mixin(registerMethods);

class Matrix(T) {}
class DenseMatrix(T) : Matrix!(T) {}

mixin RegisterClass!(Matrix!double, DenseMatrix!double);
//mixin RegisterClass!(Matrix!int, DenseMatrix!int);

mixin DeclareMethod!("times", Matrix!double, double, virtual!(Matrix!double));
//mixin DeclareMethod!("times", Matrix!int, int, virtual!(Matrix!int));

DenseMatrix!T _times(T)(T, DenseMatrix!T) {
  return new DenseMatrix!T;
}

mixin DefineMethod!(_times!double);
//mixin DefineMethod!(_times!int);

void main()
{
  updateMethods();
  Matrix!double md = new DenseMatrix!double();
}
