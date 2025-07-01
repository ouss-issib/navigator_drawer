import 'package:flutter/material.dart';
import 'package:flutter_navigator/widgets/my_drawer.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Counter"),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade300, Colors.deepPurple.shade800],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 32),
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Counter Value",
                    style: theme.textTheme.headlineLarge!.copyWith(
                      color: Colors.deepPurple.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "$counter",
                    style: theme.textTheme.headlineMedium!.copyWith(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        heroTag: "btn1",
                        onPressed: () {
                          setState(() {
                            counter--;
                          });
                        },
                        backgroundColor: Colors.deepPurple,
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(width: 24),
                      FloatingActionButton(
                        heroTag: "btn2",
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                        },
                        backgroundColor: Colors.deepPurple,
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
