extension IterableExtension on Iterable {
  T? optionalSingle<T>(
    bool Function(T element) conditionHandler,
  ) {
    for (var item in this) {
      final stateIterator = conditionHandler(item);

      if (!stateIterator) {
        continue;
      }

      return item;
    }

    return null;
  }
}
