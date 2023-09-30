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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {


  List<List<int>> selList = [
    [1, 2],
    [],
    []
  ];

  List<List<int>> selListCurrent = [
    [0, 1],
    [],
    []
  ];

  bool reset = false;


  MyHomePage({super.key, required this.title});

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

  void callBack(List<List<int>> selList) {}
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
    List<FilterModel> spCs = [
      FilterModel(0, 0, "Mode 0", [
        FilterOptionModel(0, 0, "A0"),
        FilterOptionModel(1, 1, "B0"),
        FilterOptionModel(2, 2, "C0")
      ]),
      FilterModel(1, 1, "Mode 1", [
        FilterOptionModel(0, 0, "A1"),
        FilterOptionModel(1, 1, "B1"),
        FilterOptionModel(2, 2, "C1")
      ]),
      FilterModel(2, 2, "Mode 2", [
        FilterOptionModel(0, 0, "A2"),
        FilterOptionModel(1, 1, "B2"),
        FilterOptionModel(2, 2, "C2")
      ]),
    ];
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
      body: myWidget(spCs),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  myWidget(List<FilterModel> spCs) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: ListView.builder(
            itemCount: spCs.length,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, i) {
              FilterModel spC = spCs[i];
              List<S2Choice<int>> _choiceItems = [];
              List<S2Choice<int>> _selectedChoice = [];
              for (int j = 0; j < spC.options.length; j++) {
                _choiceItems.add(S2Choice(
                    value: spC.options[j].id,
                    title: spC.options[j].title,
                    style: const S2ChoiceStyle(
                        titleStyle:
                            TextStyle(fontFamily: "Roboto", fontSize: 14))));

                if(j < 2) {
                  _selectedChoice.add(S2Choice(
                      value: spC.options[j].id,
                      title: spC.options[j].title,
                      style: const S2ChoiceStyle(
                          titleStyle:
                          TextStyle(fontFamily: "Roboto", fontSize: 14))));
                }
              }
              // Text(spCs[i].title);

              return Column(
                children: [
                  /// multiple sample
                  SmartSelect<int>.multiple(
                    /// Header [Clickable => Open Dialog & Config Dialog]
                    modalConfig: S2ModalConfig(
                      //todo : Title
                      title: (spC.title),
                      //todo : dialog style
                      style: const S2ModalStyle(
                          backgroundColor: Colors.white,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 5),
                          ),
                          elevation: 3),
                      type: S2ModalType.popupDialog,

                      //todo : filter
                      useFilter: true,
                      filterAuto: true,
                      filterDelay: const Duration(milliseconds: 100),
                      filterHint: "Filter.....",

                      //todo : Confirm
                      useConfirm: true,
                      confirmIcon: const Icon(Icons.check),
                      confirmLabel: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            color: Colors.white
                          )),
                      confirmColor: Colors.red,

                      //todo: Other
                      useHeader: true,

                    ),

                    //todo : Header Dialog

                    modalHeaderStyle: const S2ModalHeaderStyle(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide:
                                BorderSide(color: Colors.white, width: 5)),
                        backgroundColor: Colors.deepOrangeAccent,
                        textStyle:
                            TextStyle(color: Colors.white, fontSize: 14)),

                    placeholder: "select ...",
                    selectedValue: widget.selList[i],
                    savedValue: widget.selListCurrent[i],
                    // selectedChoice: _selectedChoice,
                    choiceItems: _choiceItems,
                    choiceType: S2ChoiceType.checkboxes,
                    // choiceBuilder: (context, value, anotherValue) {
                    //   return Text("data", style: TextStyle(
                    //     color: anotherValue.selected ? Colors.red : Colors.black
                    //   ),);
                    // },


                    // choiceStyle: S2ChoiceStyle(color: Colors.deepPurple),
                    // choiceActiveStyle: const S2ChoiceStyle(
                    //     titleStyle: TextStyle(
                    //       color: Colors.green,
                    //     )
                    // ),
                    //
                    // choiceLastStyle: S2ChoiceStyle(color: Colors.yellow),
                    // choiceActiveLastStyle: S2ChoiceStyle(color: Colors.red),

                    modalType: S2ModalType.bottomSheet,
                    onModalClose: (state, confirmed) {
                      setState(() {
                        widget.selList[i] = state.selection?.value ?? [];
                      });
                      widget.callBack(widget.selList);
                    },
                    choiceDivider: false,
                    tileBuilder: (context, state) {
                      if (widget.reset) {
                        // state.refresh(widget.selList[i], widget.selListCurrent[i]);
                        if (i == spCs.length - 1) {
                          widget.reset = false;
                        }
                      }

                      return S2Tile.fromState(
                        state,
                        isTwoLine: false,
                        textStyle:
                            const TextStyle(fontFamily: "Yekan", fontSize: 16),
                        // leading: CircleAvatar(
                        //   backgroundColor:
                        //   widget.selList[i]!.isNotEmpty
                        //       ? Colors.red
                        //       : Colors.blueGrey,
                        //   child: Column(
                        //     crossAxisAlignment:
                        //     CrossAxisAlignment.center,
                        //     mainAxisAlignment:
                        //     MainAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         widget.selList[i]!.length
                        //             .toString(),
                        //         style: const TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 12),
                        //       ),
                        //       const Padding(
                        //         padding: EdgeInsets.all(2.0),
                        //         child: Divider(
                        //           height: 2,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       Text(
                        //         spC.options.length.toString(),
                        //         style: const TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 12),
                        //       ),
                        //     ],
                        //   ),
                        //   // backgroundImage: NetworkImage(
                        //   //   'https://source.unsplash.com/yeVtxxPxzbw/100x100',
                        //   // ),
                        // ),
                      );
                    },
                    onChange: (selected) => setState(() {
                      widget.selList[i] = selected?.value ?? [];
                      // widget.selList[i] = selected?.value;
                    }),
                  ),

                  /// single sample
                  SmartSelect<int>.single(
                    modalConfig: S2ModalConfig(
                      title: (spC.title),
                    ),
                    choiceActiveStyle: const S2ChoiceStyle(
                        titleStyle: TextStyle(color: Colors.green)),
                    modalHeaderStyle: const S2ModalHeaderStyle(),
                    placeholder: "",
                    selectedValue: 0,
                    choiceItems: _choiceItems,
                    modalType: S2ModalType.bottomSheet,
                    onModalClose: (state, confirmed) {
                      setState(() {
                        // widget.selList[i] =
                        //     state.selection?.value ?? [];
                      });
                      widget.callBack(widget.selList);
                    },
                    choiceDivider: false,
                    tileBuilder: (context, state) {
                      if (widget.reset) {
                        // state.refresh(widget.selList[i]);
                        if (i == spCs.length - 1) {
                          widget.reset = false;
                        }
                      }

                      return S2Tile.fromState(
                        state,
                        isTwoLine: false,
                        textStyle:
                            const TextStyle(fontFamily: "Yekan", fontSize: 16),
                        // leading: CircleAvatar(
                        //   backgroundColor:
                        //   widget.selList[i]!.isNotEmpty
                        //       ? Colors.red
                        //       : Colors.blueGrey,
                        //   child: Column(
                        //     crossAxisAlignment:
                        //     CrossAxisAlignment.center,
                        //     mainAxisAlignment:
                        //     MainAxisAlignment.center,
                        //     children: [
                        //       Text(
                        //         widget.selList[i]!.length
                        //             .toString(),
                        //         style: const TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 12),
                        //       ),
                        //       const Padding(
                        //         padding: EdgeInsets.all(2.0),
                        //         child: Divider(
                        //           height: 2,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       Text(
                        //         spC.options.length.toString(),
                        //         style: const TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 12),
                        //       ),
                        //     ],
                        //   ),
                        //   // backgroundImage: NetworkImage(
                        //   //   'https://source.unsplash.com/yeVtxxPxzbw/100x100',
                        //   // ),
                        // ),
                      );
                    },
                    onChange: (selected) => setState(() {
                      // widget.selList[i] = selected?.value ?? [];
                      // widget.selList[i] = selected?.value;
                    }),
                  ),
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
