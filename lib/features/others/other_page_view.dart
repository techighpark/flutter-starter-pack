import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtherPageView extends StatefulWidget {
  static String routeUrl = '/etc';
  static String routeName = 'etc';
  const OtherPageView({super.key});

  @override
  State<OtherPageView> createState() => _OtherPageViewState();
}

class _OtherPageViewState extends State<OtherPageView> {
  int count = 0;
  Color acceptedColor = Colors.indigo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              PhysicalModel(
                elevation: 28.0,
                shadowColor: Colors.blue,
                shape: BoxShape.circle,
                color: Colors.pink.shade300,
                child: const SizedBox(
                  height: 200,
                  width: 200,
                ),
              ),

              ///------------------------------------------------------------------------------------------
              /// [Draggable], [DragTarget]
              ///------------------------------------------------------------------------------------------
              Draggable(
                data: Colors.deepOrange,
                feedback: Container(
                  color: Colors.deepOrange,
                  height: 100,
                  width: 100,
                  child: const Icon(Icons.directions_run),
                ),
                childWhenDragging: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.pinkAccent,
                  child: const Center(
                    child: Text('Child When Dragging'),
                  ),
                ),
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  color: Colors.lightGreenAccent,
                  child: const Center(
                    child: Text('Draggable'),
                  ),
                ),
              ),

              DragTarget(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                    height: 100.0,
                    width: 100.0,
                    color: acceptedColor,
                    child: Center(
                      child: Text('$count'),
                    ),
                  );
                },
                onAccept: (Color data) {
                  setState(() {
                    acceptedColor = data;
                  });
                },
              ),

              ///------------------------------------------------------------------------------------------
              /// [CallbackShortcuts]
              ///------------------------------------------------------------------------------------------
              CallbackShortcuts(
                bindings: <ShortcutActivator, VoidCallback>{
                  const SingleActivator(LogicalKeyboardKey.arrowUp): () {
                    setState(() => count = count + 1);
                  },
                  const SingleActivator(LogicalKeyboardKey.arrowDown): () {
                    setState(() => count = count - 1);
                  },
                },
                child: Focus(
                  child: Text('Counter: $count'),
                ),
              )

              ///------------------------------------------------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
