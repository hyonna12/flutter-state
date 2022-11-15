import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numProvider = Provider((_) => 2);

void main() {
  runApp(
    // 위젯에서 프로바이더를 사용하고 읽기 위해
    // 앱 전체적으로 "ProviderScope" 위젯을 감싸줘야 합니다.
    // 여기에 프로바이더의 상태가 저장됩니다.
    ProviderScope(
      child: MyApp(),
    ),
  );
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
          Expanded(child: AComponent()),
          Expanded(child: BComponent()),
        ],
      ),
    );
  }
}

// StatelessWidget 대신에 Riverpod의 ConsumerWidget을 상속받아 사용합니다.
class AComponent extends ConsumerWidget {
  const AComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int num = ref.read(numProvider);

    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          Text("ACompoent"),
          Expanded(
            child: Align(
              child: Text(
                "${num}",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// supplier 공급자 - 상태를 변경
class BComponent extends StatelessWidget {
  const BComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          Text("BCompoent"),
          Expanded(
            child: Align(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "숫자증가",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
