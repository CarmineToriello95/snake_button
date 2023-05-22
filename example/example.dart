import 'package:flutter/material.dart';
import 'package:snake_button/snake_button.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Example App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  late final SnakeButtonController _snakeButtonController;

  @override
  void initState() {
    _snakeButtonController = SnakeButtonController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade900,
          title: const Text("Example"),
        ),
        floatingActionButton: _buildFloatingButton(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () => _snakeButtonController.show(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text("Show snake button"),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            ElevatedButton(
              onPressed: () => _snakeButtonController.hide(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                "Hide snake button",
              ),
            ),
          ],
        ),
      );

  Widget _buildFloatingButton() {
    final elevatedButton = ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade900,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      onPressed: () {},
      child: const Icon(
        Icons.add,
      ),
    );

    return SnakeButton(
      controller: _snakeButtonController,
      snakeAnimationDuration: const Duration(milliseconds: 500),
      snakeColor: Colors.green.shade900,
      snakeWidth: 5.0,
      borderRadius: 20.0,
      child: SizedBox(
        height: 70,
        width: 70,
        child: elevatedButton,
      ),
    );
  }
}
