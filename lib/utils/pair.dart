// Copyright (c) 2022, one of the D3F outsourcing projects. All rights reserved.

// coverage:ignore-file

/// A pair of values.
class Pair<E, F> {
  late final E first;
  late final F last;

  Pair(this.first, this.last);

  @override
  int get hashCode => first.hashCode ^ last.hashCode;

  @override
  bool operator ==(other) {
    if (other is! Pair) {
      return false;
    }
    return other.first == first && other.last == last;
  }

  @override
  String toString() => '($first, $last)';
}
