class CounterState {
  int counter;

  CounterState({this.counter});

  factory CounterState.initial(){
    return CounterState(counter: 0);
  }
}