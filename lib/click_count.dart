import 'package:flutter/material.dart';

class ClickCountApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountText(),
    );
  }
}

class CountText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CountState();
  }
}

class CountState extends State<CountText> {
  int _count = 0;

  void addCount() => {
        setState(() => {_count++})
      };

  // void addCount() {
  //   setState(() {
  //     _count++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ClickCountDemo",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black12,
            backgroundColor: Colors.blueAccent,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: Container(
            color: Colors.red,
            child: Column(
              // verticalDirection: VerticalDirection.down,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                const Expanded(
                    flex: 1,
                    child: const Text(
                      'Hello!',
                      style: TextStyle(backgroundColor: Colors.orange),
                    )),
                const Expanded(
                    flex: 1,
                    child: const Text(
                      'Hello!',
                      style: TextStyle(backgroundColor: Colors.green),
                    )),
                const Expanded(
                    flex: 1,
                    child: const Text(
                      '当前点击次数为!',
                      style: TextStyle(backgroundColor: Colors.pink),
                    )),
                Expanded(
                    flex: 1,
                    child: Text(
                      '$_count',
                      style: TextStyle(backgroundColor: Colors.purple),
                    )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addCount,
        child: Icon(Icons.add),
      ),
    );
  }
}
