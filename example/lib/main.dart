import 'package:flutter/material.dart';
import 'package:flutter_filter_dialog/flutter_filter_dialog.dart';

import 'modeles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  myWidget(){
    List<FilterModel> spCs = [];
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: spCs.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              FilterModel spC = spCs[i];
              List<S2Choice<int>> _choiceItems = [];
              for (int j = 0; j < spC.options.length; j++) {
                _choiceItems.add(
                    S2Choice(
                    value: spC.options[j].id,
                    title: spC.options[j].title,
                    style: const S2ChoiceStyle(
                        titleStyle:
                        TextStyle(fontFamily: "Roboto", fontSize: 14))));
              }

              Column(
                children: [
                  // SmartSelect<String>.multiple(
                  //   modalConfig: S2ModalConfig(
                  //     title:
                  //     (spC.title),
                  //   ),
                  //   choiceActiveStyle: const S2ChoiceStyle(
                  //       titleStyle:
                  //       TextStyle(color: Colors.red)),
                  //   modalHeaderStyle: const S2ModalHeaderStyle(),
                  //   placeholder: "",
                  //   // selectedValue: widget.selList[i],
                  //   choiceItems: _choiceItems,
                  //   modalType: S2ModalType.bottomSheet,
                  //   onModalClose: (state, confirmed) {
                  //     setState(() {
                  //       widget.selList[i] =
                  //           state.selection?.value ?? [];
                  //     });
                  //     widget.callBack(widget.selList);
                  //   },
                  //   choiceDivider: false,
                  //   tileBuilder: (context, state) {
                  //     if (widget.reset) {
                  //       state.refresh(widget.selList[i]);
                  //       if (i == spCs.length - 1) {
                  //         widget.reset = false;
                  //       }
                  //     }
                  //
                  //     return S2Tile.fromState(
                  //       state,
                  //       isTwoLine: false,
                  //       textStyle: const TextStyle(
                  //           fontFamily: "Yekan", fontSize: 16),
                  //       leading: CircleAvatar(
                  //         backgroundColor:
                  //         widget.selList[i]!.isNotEmpty
                  //             ? Colors.red
                  //             : Colors.blueGrey,
                  //         child: Column(
                  //           crossAxisAlignment:
                  //           CrossAxisAlignment.center,
                  //           mainAxisAlignment:
                  //           MainAxisAlignment.center,
                  //           children: [
                  //             Text(
                  //               widget.selList[i]!.length
                  //                   .toString(),
                  //               style: const TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 12),
                  //             ),
                  //             const Padding(
                  //               padding: EdgeInsets.all(2.0),
                  //               child: Divider(
                  //                 height: 2,
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //             Text(
                  //               spC.opTs.length.toString(),
                  //               style: const TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 12),
                  //             ),
                  //           ],
                  //         ),
                  //         // backgroundImage: NetworkImage(
                  //         //   'https://source.unsplash.com/yeVtxxPxzbw/100x100',
                  //         // ),
                  //       ),
                  //     );
                  //   },
                  //   onChange: (selected) => setState(() {
                  //     widget.selList[i] = selected?.value ?? [];
                  //     // widget.selList[i] = selected?.value;
                  //   }),
                  // ),
                  const Divider(indent: 2),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
