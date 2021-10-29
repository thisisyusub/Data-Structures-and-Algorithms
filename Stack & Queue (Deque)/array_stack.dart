void main() {
  final stack = ArrayStack<int>();

  stack.push(4);
  stack.push(5);
  stack.push(6);
  stack.push(7);
  stack.push(8);

  print(stack);

  final popE = stack.pop();
  print('popped element: $popE');

  print(stack);
  print('size: ${stack.size()}');
  print('isEmpty: ${stack.isEmpty()}');

  stack.pop();
  stack.pop();
  stack.pop();
  stack.pop();

  print('size: ${stack.size()}');
  print('isEmpty: ${stack.isEmpty()}');

  stack.pop();
}

class ArrayStack<E> {
  late final List<E?> _elements;
  final int _capacity = 5;
  int _currentIndex = -1;

  ArrayStack() {
    _elements = List<E?>.generate(_capacity, (index) => null);
  }

  void push(E e) {
    if (size() == _elements.length) {
      throw Exception('Stack is full!');
    }

    _elements[++_currentIndex] = e;
  }

  E? pop() {
    if (isEmpty()) return null;

    final topElement = _elements[_currentIndex];
    _elements[_currentIndex] = null;
    _currentIndex--;

    return topElement;
  }

  E? top() {
    if (isEmpty()) return null;

    return _elements[_currentIndex];
  }

  int size() => _currentIndex + 1;

  bool isEmpty() => _currentIndex == -1;

  @override
  String toString() {
    return 'ArrayStack: ${_elements.toString()}';
  }
}
