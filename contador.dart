import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void increaseCounter() {
    setState(() {
      if (counter < 50) {
        counter++;
      }
    });
  }

  void decreaseCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Contador con botones'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Contador: $counter',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ColoredButton(
                color: Colors.red,
                label: 'Aumentar',
                onPressed: increaseCounter,
              ),
              SizedBox(height: 20),
              ColoredButton(
                color: Colors.green,
                label: 'Disminuir',
                onPressed: decreaseCounter,
              ),
              SizedBox(height: 20),
              ColoredButton(
                color: Colors.blue,
                label: 'Limpiar',
                onPressed: resetCounter,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColoredButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onPressed;

  const ColoredButton({
    Key? key,
    required this.color,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: EdgeInsets.all(20),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
