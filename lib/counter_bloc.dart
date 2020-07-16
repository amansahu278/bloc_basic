import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_1/counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{

  void onIncrement(){
    add(IncrementEvent());
  }

  void onDecrement(){
    add(DecrementEvent());
  }

  CounterBloc(CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if(event is IncrementEvent){
      yield CounterState(counter: state.counter + 1);
    } else if(event is DecrementEvent){
      yield CounterState(counter: state.counter - 1);
    }
  }
  
}