import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: ABComponent()),
          Expanded(child: CComponent()),
          // rebuild 할 때 변하지 않는 값은 const(새롭게 그림그리지 않고 동일한 그림을 재사용) 붙여줌
        ],
      ),
    );
  }
}

class ABComponent extends StatelessWidget {
  const ABComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CComponent extends StatefulWidget {
  const CComponent({Key? key}) : super(key: key);

  @override
  State<CComponent> createState() => _CComponentState();
}

class _CComponentState extends State<CComponent> {
  int num = 1;
  // 변수는 stateful한 위젯이 가지고 있어야함

  void increase() {
    setState(() {
      // 값 변경하면서 build
      num++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// // 컨슈머 (소비자) - 상태를 가지며 상태를 통해 그림을 그림
// class AComponent extends StatelessWidget {
//   final int num;
//   const AComponent(this.num, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.yellow,
//       child: Column(
//         children: [
//           Text("AComponent"),
//           Expanded(
//             child: Align(
//               child: Text(
//                 "${num}",
//                 style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // supplier 공급자 - 상태를 변경
// class BComponent extends StatelessWidget {
//   final Function increase;
//   const BComponent(this.increase, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.blue,
//       child: Column(
//         children: [
//           Text("BComponent"),
//           Expanded(
//             child: Align(
//               child: ElevatedButton(
//                 onPressed: () {
//                   increase();
//                 },
//                 child: Text(
//                   "숫자증가",
//                   style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
