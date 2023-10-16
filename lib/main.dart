import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> widgetList = [
    A(
        Colors.orange,
        key: UniqueKey(),
    ),
    A(
        Colors.blue,
        key: UniqueKey(),
    )
  ];

  onChange() {
    setState(() {
      // A위젯을 삭제하고 widgetList.removeAt(0)
      // 삭제하면 삭제한 위젯을 반환까지 함
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: widgetList,
              ),
              ElevatedButton(
                onPressed: onChange,
                child: Text('toggle'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////

class A extends StatefulWidget {
  Color color;

  A(this.color, {super.key});

  @override
  State<A> createState() => _AState(this.color);
}

class _AState extends State<A> {
  Color _color;
  // 기본 생성자에서 -> 사용자 정의 변경됨
  _AState(this._color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 300,
        color: _color,
        child: Center(
          child: Text("A"),
        ),
      ),
    );
  }
}