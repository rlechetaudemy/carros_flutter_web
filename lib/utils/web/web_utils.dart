size(double size, {double min = 0, double max = double.infinity}) {
  if (size < min) {
    return min;
  }
  if (size > max) {
    return max;
  }
  return size;
}
