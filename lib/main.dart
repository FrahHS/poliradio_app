import 'package:flutter/material.dart';
import 'package:poliradio_app/screens/dashboard_screen.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:poliradio_app/widgets/titlebar_widget.dart';

const backgroundColor = Color(0xFF333333);

void main() {
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(800, 500);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Poliradio Desktop";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Poliradio Desktop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: WindowBorder(
            color: Colors.blue,
            width: 0,
            child: Container(
              color: backgroundColor,
              child: Column(
                children: const [
                  TitleBarWidget(),
                  DashboardPage(title: 'Flutter Demo Home Page'),
                ],
              ),
            ),
          ),
        ));
  }
}
