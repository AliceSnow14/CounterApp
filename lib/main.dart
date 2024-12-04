import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scream Counter',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'First flutter page by me :)'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter == 0) return;
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        actions: const [Icon(Icons.search), Icon(Icons.more_vert)],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 228, 73, 11),
        title: Text(widget.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.webp'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Contador de sustos 2024:',
                style: TextStyle(
                    color: Colors.white, fontFamily: 'Roboto', fontSize: 24),
              ),
              Text(
                '$_counter ${_counter == 1 ? 'susto' : 'sustos'}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ScreamButton(onPressed: _resetCounter, icon: Icons.restart_alt),
          const SizedBox(height: 10),
          ScreamButton(onPressed: _incrementCounter, icon: Icons.add),
          const SizedBox(height: 10),
          ScreamButton(onPressed: _decrementCounter, icon: Icons.remove),
        ],
      ),
    );
  }
}

class ScreamButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const ScreamButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.amber[900],
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
