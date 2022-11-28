abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {
  CounterIncrementPressed(this.id);
  final String id;
}

class CounterDecrementPressed extends CounterEvent {
  CounterDecrementPressed(this.id);
  final String id;
}
