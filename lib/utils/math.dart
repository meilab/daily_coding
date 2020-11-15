import 'dart:math';

/// Returns log base 2 of x.
num log2(num x) => log(x) / log(2);

/// Returns log base 10 of x.
num log10(num x) => log(x) / log(10);

double abs(double a) {
  if (a > 0) {
    return a;
  } else if (a < 0) {
    return -a;
  } else {
    // in case of null
    return 0;
  }
}
