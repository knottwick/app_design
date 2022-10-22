import 'dart:developer';

import 'package:app_design/process/authentication/process_1.dart';
import 'package:app_design/process/authentication/process_2.dart';
import 'package:app_design/process/base_process.dart';
import 'package:app_design/utilities/bloc/process_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    
  }

  void _incrementCounter() {
    setState(() {
    
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        
        child: buildProcess()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      )
    );
  }

  Widget buildProcess() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProcessBloc<Process1>>(
          create: (BuildContext context) { 
            var process = ProcessBloc(Process1());
            return process..add(Create(5));
          }
        ),
        BlocProvider<ProcessBloc<Process2>>(
          create: (BuildContext context) { 
            var process = ProcessBloc(Process2());
            return process..add(Create(1));
          }
        ),
      ],
      child: const Center(
        child: Pages()
      ),
    );
  }
}

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  createState() => _Pages();
}

class _Pages extends State<Pages> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocBuilder<ProcessBloc<Process1>, ProcessState>(
          builder: (context, state) {
            log(state.toString());
            if (state is Executing) {
              return const CircularProgressIndicator();
            }
            else if (state is Success<String>) {
              return Text(state.output);
            }
            else {
              return const SizedBox.shrink();
            }
          },
        ),
        BlocBuilder<ProcessBloc<Process2>, ProcessState>(
          builder: (context, state) {
            log(state.toString());
            if (state is Executing) {
              return const CircularProgressIndicator();
            }
            else if (state is Success<String>) {
              return Text(state.output);
            }
            else {
              return const SizedBox.shrink();
            }
          },
        ),
        // Container(
        //   color: Colors.green,
        //   child: BlocBuilder<ProcessBloc<Process2>, ProcessState>(
        //     builder: (context, state) {
        //       if (state is ProcessExecuting) {
        //         return const CircularProgressIndicator(color: Colors.red,);
        //       }
        //       else {
        //         return const SizedBox.shrink();
        //       }
        //     },
        //   )
        // )
        
      ]
    );
  }

}


