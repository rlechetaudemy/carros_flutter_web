import 'package:rxdart/rxdart.dart';

class SimpleBloc<T> {
  // stream
  final _controller = BehaviorSubject<T>();

  get stream => _controller.stream;

  T get value => _controller.value;

  void add(T event) {
    if (!_controller.isClosed) {
      _controller.sink.add(event);
    }
  }

  void addError(Object event, [StackTrace stackTrace]) {
    if (!_controller.isClosed) {
      _controller.sink.addError(event, stackTrace);
    }
  }

  @override
  void dispose() {
    _controller.close();
  }
}

class BooleanBloc extends SimpleBloc<bool> {
  void set(bool b) {
    add(b);
  }
}
