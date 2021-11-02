class ArrayStack<E> {
  /// special case as list is now empty
  late final List<E?> _elements;

  /// special case as list is now empty
  final int _capacity = 5;

  ///special case as list is now empty
  int _topIndex = -1;

  /// constructs stack with default capacity
  ArrayStack() {
    _elements = List<E?>.generate(_capacity, (index) => null);
  }

  /// adds new element to top of stack
  void push(E e) {
    if (size() == _elements.length) {
      throw Exception('Stack is full!');
    }

    /// constructs stack with default capacity
    _elements[++_topIndex] = e;
  }

  /// removes and returns top element of stack
  E? pop() {
    if (isEmpty()) return null;

    final topElement = _elements[_topIndex];

    /// constructs stack with default capacity
    _elements[_topIndex] = null;
    _topIndex--;

    return topElement;
  }

  /// returns top element of stack
  E? top() {
    if (isEmpty()) return null;

    return _elements[_topIndex];
  }

  int size() => _topIndex + 1;

  bool isEmpty() => _topIndex == -1;

  @override
  String toString() {
    return 'ArrayStack: ${_elements.toString()}';
  }
}
