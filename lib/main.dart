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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Pomme, Poire et Ananas'),
      debugShowCheckedModeBanner: false,
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
  List<String> list = [];

  void _incrementCounter() {
    setState(() {
      _counter++;
      list.add(_counter.toString());
    });
  }

  String returnPathPicture(N) {
    bool res = true;
    String pathPicture = "";

    for (var i = 2; i <= N / i; ++i) {
      if (N % i == 0) {
        res = false;
      }
    }
    if (res && N != 1) {
      pathPicture = 'images/ananas.png';
    } else if (res == false && N % 2 == 0) {
      pathPicture = 'images/pomme.png';
    } else {
      pathPicture = 'images/poire.png';
    }

    return pathPicture;
  }

  String returnTitleByCounter(N) {
    bool res = true;
    String title = "";

    for (var i = 2; i <= N / i; ++i) {
      if (N % i == 0) {
        res = false;
      }
    }
    if (res && N != 1) {
      title = 'NP';
    } else if (res == false && N % 2 == 0) {
      title = 'Paire';
    } else {
      title = 'Impaire';
    }

    return title;
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Pomme, Poire et Ananas';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text("$_counter - ${returnTitleByCounter(_counter)} "),
        ),
        body: list.isEmpty
            ? const Text('Vide')
            : ListView.builder(
                itemCount: list.length,
                prototypeItem: ListTile(
                  title: Text(list.first),
                ),
                itemBuilder: (context, index) {
                  return Container(
                    color: (int.parse(list[index]) % 2 == 1
                        ? Colors.cyan
                        : Colors.indigo),
                    child: Row(
                      children: [
                        Image.asset(returnPathPicture(int.parse(list[index]))),
                        Text(
                          list[index],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
