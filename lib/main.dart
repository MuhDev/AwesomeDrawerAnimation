import './drawer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Awesome Drawer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final double maxSlide = 200.0;
  late AnimationController animationController;
  bool? _canBeDragged;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    super.initState();
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();
  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft =
        animationController.isDismissed && details.globalPosition.dx < 100;
    bool isDragCloseFromright =
        animationController.isCompleted && details.globalPosition.dx > 150;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromright;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged!) {
      double delta = details.primaryDelta! / maxSlide;
      animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (animationController.isDismissed || animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      animationController.fling(velocity: visualVelocity);
    } else if (animationController.value < 0.5) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 109, 145, 199),
      body: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            double slide= maxSlide*animationController.value;
            double scale=1-(animationController.value*0.3);
            return Stack(
              children: [
                const MyDrawer(),
                Transform(
                  transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onHorizontalDragStart: _onDragStart,
                    onHorizontalDragUpdate: _onDragUpdate,
                    onHorizontalDragEnd: _onDragEnd,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(animationController.value*15),
                      child: Scaffold(
                        appBar: AppBar(
                          title: Text(widget.title),
                          leading: IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: toggle),
                        ),
                        body: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'You have pushed the button this many times:',
                              ),
                              Text(
                                '$_counter',
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ],
                          ),
                        ),
                        floatingActionButton: FloatingActionButton(
                          onPressed: _incrementCounter,
                          tooltip: 'Increment',
                          child: const Icon(Icons.add),
                        ), // This trailing comma makes auto-formatting nicer for build methods.
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

