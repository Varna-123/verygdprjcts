import 'package:blocprjcts/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("incrementd"),
                    duration: Duration(seconds: 2),
                  ));
                } else {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text("decremented"),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),//counter widget only rebuild
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            )
          ],
        ),
      ),

      // body: BlocListener<CounterCubit, CounterState>(
      //   listener: (context, state) {
      //     print("bloc listener work");
      //     if (state.wasIncremented == true) {
      //       Scaffold.of(context).showSnackBar(
      //         SnackBar(
      //           content: Text("incremented"),
      //           duration: Duration(seconds: 2),
      //         ),
      //       );
      //     }

      //     // TODO: implement listener
      //   },
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         const Text(
      //           'You have pushed the button this many times:',
      //         ),
      //         BlocBuilder<CounterCubit, CounterState>(
      //           builder: (context, state) {
      //             print("blocbuilder work");
      //             return Text(
      //               state.counterValue.toString(),
      //               style: Theme.of(context).textTheme.headline4,
      //             );
      //           },
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: BlocProvider.of<CounterCubit>(context).increment,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: BlocProvider.of<CounterCubit>(context).decrement,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
