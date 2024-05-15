import 'package:calculadora/config/calc_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

import 'widgets/widgets.dart';

class CalcApp extends StatefulWidget {
  const CalcApp({super.key});

  @override
  State<CalcApp> createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String _historial = '';
  String _expression = '';

  void allClear(String text) {
    setState(() {
      _historial='';
      _expression='';
    });
  }

  void clear(String text) {
    setState(() {
      _expression='';
    });
  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _historial = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numClick(String text){
    setState(() {
      _expression+=text;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      theme: CalcTheme().getTheme(),
      title: 'Calculadora',
      home: Scaffold(
          body: Scaffold(
        backgroundColor: const Color.fromRGBO(55, 62, 64, 1),
        body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Text(
                    _historial,
                    style: GoogleFonts.rubik(
                        textStyle:
                            const TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    _expression,
                    style: GoogleFonts.rubik(
                        textStyle:
                            const TextStyle(fontSize: 48, color: Colors.white)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    bgColor: 0xFFFAA916,
                    text: 'AC',
                    callback: allClear,
                    textSize: 20,
                  ),
                  CalcButton(
                    bgColor: 0xFFFAA916,
                    text: 'C',
                    callback: clear,
                    textSize: 20,
                  ),
                  CalcButton(
                    bgColor: 0xFFFAA916,
                    text: '%',
                    callback: allClear,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '/',
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '7',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '8',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '9',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '*',
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '4',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '5',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '6',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '-',
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '1',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '2',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '3',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '+',
                    callback: numClick,
                    textSize: 20,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalcButton(
                    text: '0',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '00',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '.',
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: '=',
                    callback: evaluate,
                    textSize: 20,
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
