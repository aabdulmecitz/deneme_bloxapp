import 'dart:async';

class CalculatorBloc {
  final double x;
  final double y;

  final _calculatorController = StreamController<int>();

  CalculatorBloc.xliyli(this.x, this.y);
  CalculatorBloc(null, null);
  Stream<int> get calculatorStream => _calculatorController.stream;

  void addition(){
    x + y ;
  }

  void substract(){
    x - y ;
  }

  void multiply(){
    x * y ;
  }

  void divide(){
    x / y ;
  }

  void dispose(){
    _calculatorController.close();
  }

}