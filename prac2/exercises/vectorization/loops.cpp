#include <iostream>

using namespace std;

constexpr int iterations = 100;
constexpr int arrays_size = 1000000;

double A[arrays_size];
double B[arrays_size];
double C[arrays_size];

int main(int argc, char** argv) {
  double total = 0;

  for (int i = 0; i < iterations; ++i) {
    for (int i = 0; i < arrays_size-1; ++i) {
      A[i] = i*2/3;
      B[i+1] = A[i] - B[i];
    }

    for (int i = 0; i < arrays_size-1; ++i) {
      A[i] = A[i] - B[i];
      B[i+1] = 2*C[i];
    }

    for (int i = arrays_size-1; i > 0; --i) {
      A[i-1] = A[i] + C[i];
      B[i] = C[i] - B[i];
    }

    for (int i = 0; i < arrays_size; ++i) {
      C[i] = A[i] + 2*B[i];
    }

    for (int i = 0; i < arrays_size; ++i) {
      total = total + C[i];
    }
  }

  cout << total << endl;
  return 0;
}
