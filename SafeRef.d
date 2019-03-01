module SafeRef;

// this module exists to prevent unexpected segfaults from crashing a program
// when all the dereference operations are passed through the SR class
// or the NF function, any unexpected segfaults will be turned into exceptions
// which can be handled as any other exception

struct SR(T) {
  // SafeRef class
  // dereferencing through opCall will never cause a segfault
  // can wrap object references or pointers
  // can be set either by another of its type, or by the type it wraps
  // no exception is thrown if a null value is passed in
  // the internal value p is make publically acessable to allow users
  // of this module the highest degree of freedom possible
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
  // Null Filter
  // if the input is not null, then it will be passed out unchanged
  // if the input is null, an exception will be thrown
  // input can be an object reference or pointer
  if (input is null) {
    throw new Exception("Null Dereference");
  }
  else {
    return input;
  }
}
