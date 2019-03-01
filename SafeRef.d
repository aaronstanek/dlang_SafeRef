module SafeRef;

struct SR(T) {
  public:
  T p;
  this(T s) {
    p = s;
  }
  this(SR!T s) {
    p = s.p;
  }
  void opAssign(T s) {
    p = s;
  }
  bool isNull() {
    if (p is null) {
      return true;
    }
    else {
      return false;
    }
  }
  T opCall() {
    if (p is null) {
      throw new Exception("Null Dereference");
    }
    else {
      return p;
    }
  }
}

T NF(T)(T input) {
  if (input is null) {
    throw new Exception("Null Dereference");
  }
  else {
    return input;
  }
}
