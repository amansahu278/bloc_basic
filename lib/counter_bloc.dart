import 'dart:async';
import 'package:bloc_1/counter_event.dart';

class CounterBloc{
  int _counter = 0;

  //Counter state
  final StreamController _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStateController.sink; //Event
  Stream<int> get counter => _counterStateController.stream;  //Action or state, this is what we wil listen to

  // Counter event
  final StreamController _counterEventController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  /* MY understanding
  * A sink is an input stream and stream is output stream
  * We add things to a sink and the stream recieves those.
  * Here, we add Increment/Decrement Event to the sink,
  * the _counterEventController stream recieves it, we listen for the occurence
  * of such events and appropriatelu add values to the _counterState sink,
  * since some value is inputted to _counterStateSink, the stream picks up that value
  * */

  CounterBloc(){
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(event) {
    if (event is IncrementEvent){
      _counter ++;
    } else {
      _counter --;
    }
    _inCounter.add(_counter);
  }

  void dispose(){
    _counterEventController.close();
    _counterStateController.close();
  }
}