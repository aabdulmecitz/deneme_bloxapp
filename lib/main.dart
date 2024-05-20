import 'package:bloxapp/src/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final xnumberController = TextEditingController();
  final ynumberController = TextEditingController();
  final _formKey = GlobalKey<FormFieldState> ();
  final _sayiValidator = RegExp(r'^[0-9]+$'); // Yalnızca sayıları kabul eder.

  final double x = 1;
  final double y = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                StreamBuilder(
                  stream: CalculatorBloc(0,0).calculatorStream,
                    builder: Text(CalculatorBloc(stream).),
                )
                InkWell(
                  onTap: (){
                    CalculatorBloc(x,y).addition();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    CalculatorBloc(x,y).substract();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.remove_circle),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    CalculatorBloc(x,y).multiply();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.cancel),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    CalculatorBloc(x,y).divide();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.safety_divider),
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),

    );
  }
}
