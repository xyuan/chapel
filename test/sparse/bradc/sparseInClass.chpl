const D = [1..9];

class C {
  var SparseD: sparse subdomain(D);

  def foo() {
    writeln("SparseD is: ", SparseD);
    SparseD += 4;
    writeln("SparseD is: ", SparseD);
  }
}

var myC = C();
myC.foo();
