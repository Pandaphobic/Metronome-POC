import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Metronome MVP'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyStatefulWidget(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  double _counter = 0;

  bool _isPlaying = false;

  String _buttonText = 'Start';

  void isPlaying() {
    setState(() {
      _isPlaying = !_isPlaying;
      _buttonText = _isPlaying ? 'Stop' : 'Start';
    });
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '${_counter.round().toString()} bpm',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Slider(
            value: _counter,
            max: 250,
            label: _counter.round().toString(),
            onChanged: (double value) {
              setState(() {
                _counter = value;
              });
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: isPlaying,
            // tooltip: 'Increment',
            child: Text(_buttonText),
          ),
        ],
      ),
    );
  }
}
