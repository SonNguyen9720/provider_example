import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/another_model.dart';
import 'package:provider_example/my_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MyModel>(create: (context) => MyModel()),
        ProxyProvider<MyModel, AnotherModel>(
          update: (context, myModel, anotherModel) => AnotherModel(myModel),
        )
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('My app')),
          body: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>(
                    builder: (context, myModel, child) {
                      return ElevatedButton(
                        onPressed: () {
                          myModel.doSomething('Good bye');
                        },
                        child: const Text('Do something'),
                      );
                    },
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(32),
                    color: Colors.blue[200],
                    child: Consumer<MyModel>(
                      builder: (context, myModel, child) =>
                          Text(myModel.someValue),
                    )),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.red[200],
                      child: Consumer<AnotherModel>(
                        builder: (context, anotherModel, child) =>
                            ElevatedButton(
                                onPressed: () => anotherModel.doSomeThingElse(),
                                child: child),
                        child: const Text('Do something'),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ///For FutureProvider example
  // Future<MyModel> someAsyncFunctionToGetMyModel() async {
  //   await Future.delayed(const Duration(seconds: 5));
  //   return MyModel(someValue: 'Init some value');
  // }

  ///For StreamProvider example
  // Stream<MyModel> getStreamOfMyModel() {
  //   return Stream<MyModel>.periodic(const Duration(seconds: 2),
  //       (value) => MyModel(someValue: value.toString())).take(10);
  // }
}
