import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_1/counter_event.dart';

import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{

  CounterBloc(CounterState initialState) : super(initialState);

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if(event is IncrementEvent){
      yield state..counter += 1;
    } else if(event is DecrementEvent){
      yield state..counter -= 1;
    }
  }
  
}