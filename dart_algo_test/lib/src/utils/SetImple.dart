class SetImple {
  static bool equals<T>(Set<T>? a, Set<T>? b) {
    if (a == null) return b == null;
    if (b == null || a.length != b.length) return false;
    if (identical(a, b)) return true;

    for (final T value in a.union(b)) {
      if (!b.contains(value) || !a.contains(value)) return false;
    }

    return true;
  }
}
