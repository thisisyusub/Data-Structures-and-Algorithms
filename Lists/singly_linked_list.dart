void main() {
  final singlyLinkedList = SinglyLinkedList<int>();

  print('Adding First ---------');
  singlyLinkedList.addFirst(1);
  singlyLinkedList.addFirst(2);
  singlyLinkedList.addFirst(3);

  print(singlyLinkedList);
  print(singlyLinkedList.first());
  print(singlyLinkedList.last());
  print(singlyLinkedList.size);

  print('Adding Last ---------');
  singlyLinkedList.addLast(4);
  print(singlyLinkedList);
  print(singlyLinkedList.first());
  print(singlyLinkedList.last());
  print(singlyLinkedList.size);

  print('Removing First ---------');
  singlyLinkedList.removeFirst();
  print(singlyLinkedList);
  print(singlyLinkedList.first());
  print(singlyLinkedList.last());
  print(singlyLinkedList.size);
}

class _Node<E> {
  E? element;
  _Node<E>? next;

  _Node([this.element, this.next]);

  _Node<E> copyWith() => _Node<E>(element, next);

  @override
  String toString() {
    return 'Node($element, $next)';
  }
}

class SinglyLinkedList<E> {
  _Node<E>? _head = null;
  _Node<E>? _tail = null;
  int _size = 0;

  int get size => _size;

  bool get isEmpty => _size == 0;

  E? first() => isEmpty ? null : _head!.element;

  E? last() => isEmpty ? null : _tail!.element;

  void addFirst(E value) {
    _head = _Node<E>(value, _head);

    if (_size == 0) {
      _tail = _head;
    }

    _size++;
  }

  void addLast(E value) {
    final newNode = _Node<E>(value, null);

    if (isEmpty) {
      _head = newNode;
    } else {
      _tail!.next = newNode;
    }

    _tail = newNode;
    _size++;
  }

  E? removeFirst() {
    if (isEmpty) return null;

    final first = _head!.element;
    _head = _head!.next;
    _size--;

    if (_size == 0) {
      _tail = null;
    }

    return first;
  }

  @override
  String toString() {
    final buffer = StringBuffer();

    if (isEmpty) return '[]';

    buffer.write('[');
    _Node<E>? tempHead = _head;

    while (tempHead != null) {
      final comma = tempHead.next == null ? '' : ', ';

      buffer.write('${tempHead.element}$comma');
      tempHead = tempHead.next;
    }

    buffer.write(']');

    return buffer.toString();
  }
}
