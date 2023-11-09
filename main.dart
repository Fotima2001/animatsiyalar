//
// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const App());
// }
// class App extends StatefulWidget {
//   const App({super.key});
//
//   @override
//   State<App> createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: AnimatedContainerScaffold(),
//       home: Animations(),
//     );
//   }
// }
//
// class Animations extends StatefulWidget {
//   const Animations({
//     super.key,
//   });
//
//   @override
//   State<Animations> createState() => _AnimationsState();
// }
//
// class _AnimationsState extends State<Animations> {
//   var random = Random();
//   var opacity = 1.0;
//   bool isFirstChilddAlive = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Align(
//             child: AnimatedOpacity(
//               opacity: opacity,
//               duration: const Duration(milliseconds: 250),
//               child: Container(
//                 width: 300,
//                 height: 300,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 alignment: Alignment.center,
//                 child: const Text(
//                   'This is a text',
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           AnimatedButton(
//             text: opacity == 0 ? 'Show' : 'Fade',
//             onTap: () {
//               opacity = random.nextDouble();
//               setState(() {});
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class AnimatedButton extends StatefulWidget {
//   final Function() onTap;
//   final String text;
//   const AnimatedButton({
//     required this.onTap,
//     required this.text,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<AnimatedButton> createState() => _AnimatedButtonState();
// }
//
// class _AnimatedButtonState extends State<AnimatedButton> {
//   double width = double.maxFinite;
//   double height = 60;
//   double verticalMargin = 20;
//   double horizontalMargin = 20;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: widget.onTap,
//       onTapDown: (_) {
//         verticalMargin = 30;
//         height = 40;
//         horizontalMargin = 40;
//         setState(() {});
//         print("OnTapDown");
//       },
//       onTapUp: (_) {
//         verticalMargin = 20;
//         height = 60;
//         horizontalMargin = 20;
//         setState(() {});
//         print("onTapUp");
//       },
//       onTapCancel: () {
//         verticalMargin = 20;
//         height = 60;
//         horizontalMargin = 20;
//         setState(() {});
//         print("onTapCancel");
//       },
//       child: AnimatedContainer(
//         margin: EdgeInsets.symmetric(
//           vertical: verticalMargin,
//           horizontal: horizontalMargin,
//         ),
//         width: width,
//         height: height,
//         duration: const Duration(milliseconds: 250),
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         alignment: Alignment.center,
//         child: Text(
//           widget.text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const App());
// }
//
// class App extends StatefulWidget {
//   const App({super.key});
//
//   @override
//   State<App> createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//
//   double width = 200;
//   double height = 200;
//   double radius = 8;
//   Color color = Colors.yellow;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: [
//             AnimatedContainer(
//               width: width,
//               height: height,
//               decoration: BoxDecoration(
//                 color: color,
//                 borderRadius: BorderRadius.circular(radius),
//               ),
//               duration: const Duration(seconds: 3),
//               curve: Curves.easeInOutCubicEmphasized,
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             var random = Random();
//             width = random.nextDouble() * 300;
//             height = random.nextDouble() * 300;
//             radius = random.nextDouble() * 300;
//             var red = random.nextInt(225);
//             var green = random.nextInt(225);
//             var blue = random.nextInt(225);
//
//             color = Color.fromRGBO(red, green, blue, 1);
//             setState(() {});
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class AnimatedButton extends StatefulWidget {
//   const AnimatedButton({Key? key}) : super(key: key);
//
//   @override
//   State<AnimatedButton> createState() => _AnimatedButtonState();
// }
//
// class _AnimatedButtonState extends State<AnimatedButton> {
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(duration: duration);
//   }
// }


import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnimationWidget(),
    );
  }
}

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> rotateAnimation;
  late AnimationController rotateAnimationController;

  @override
  void initState() {
    rotateAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          rotateAnimationController.forward();
        } else if (status == AnimationStatus.completed) {
          rotateAnimationController.repeat();
        }
      })
      ..forward();
    rotateAnimation =
        Tween<double>(begin: 0, end: 2 * pi).animate(rotateAnimationController);

    super.initState();
  }

  @override
  void dispose() {
    rotateAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation : rotateAnimation,
            child: Image.asset("assets/png/img.png"),
            builder: (context,child){
              return Transform.rotate(
                angle : rotateAnimation.value,
                child: child,
              );
            }
        ),
      ),
    );
  }
}

class AnimationChild extends AnimatedWidget{
  const AnimationChild({
    super.key,
    required Animation animation,
  }) : super(listenable: animation);
  @override
  Widget build(BuildContext context){
    return Transform.rotate(
      angle: (listenable as Animation<double>).value,
      child: Image.asset("assets/earth.png"),
    );
  }
}