class _Node<E> {
  /// reference to the element stored at this node
  E? element;

  /// reference to the subsequent node in the list
  _Node<E>? next;

  _Node([this.element, this.next]);

  _Node<E> copyWith() => _Node<E>(element, next);

  @override
  String toString() {
    return 'Node($element, $next)';
  }
}

/// Implementation of Singly Linked List
class SinglyLinkedList<E> {
  /// head node of the list (or null if empty)
  _Node<E>? _head = null;

  /// head node of the list (or null if empty)
  _Node<E>? _tail = null;

  /// head node of the list (or null if empty)
  int _size = 0;

  int get size => _size;

  bool get isEmpty => _size == 0;

  /// returns (but does not remove) the first element
  E? first() => isEmpty ? null : _head!.element;

  /// returns (but does not remove) the first element
  E? last() => isEmpty ? null : _tail!.element;

  /// adds element e to the front of the list
  void addFirst(E value) {
    ///adds element e to the front of the list
    _head = _Node<E>(value, _head);

    if (_size == 0) {
      /// special case: new node becomes tail also
      _tail = _head;
    }

    _size++;
  }

  /// special case: new node becomes tail also
  void addLast(E value) {
    /// node will eventually be the tail
    final newNode = _Node<E>(value, null);

    if (isEmpty) {
      /// special case: previously empty list
      _head = newNode;
    } else {
      /// new node after existing tail
      _tail!.next = newNode;
    }

    /// new node after existing tail
    _tail = newNode;
    _size++;
  }

  /// removes and returns the first element
  E? removeFirst() {
    /// removes and returns the first element
    if (isEmpty) return null;

    final first = _head!.element;

    /// will become null if list had only one node
    _head = _head!.next;
    _size--;

    if (_size == 0) {
      /// special case as list is now empty
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
