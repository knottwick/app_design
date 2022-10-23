import 'package:app_design/process/authentication/process_1.dart';
import 'package:app_design/process/authentication/process_2.dart';
import 'package:app_design/process/authentication/process_3.dart';
import 'package:app_design/process/base_process.dart';
import 'package:app_design/utilities/bloc/process_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: buildProcess()
      )
    );
  }

  Widget buildProcess() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProcessBloc<Process1>>(
          create: (BuildContext context) => ProcessBloc(Process1())
        ),
        BlocProvider<ProcessBloc<Process2>>(
          create: (BuildContext context) => ProcessBloc(Process2())
        ),
        BlocProvider<ProcessBloc<Process3>>(
          create: (BuildContext context) => ProcessBloc(Process3())
        )
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

  late ProcessManager _process;
  
  @override
  void initState() {
    super.initState();
    _process = ProcessManager();
  }

  @override
  Widget build(BuildContext context) {

    var process1 = _process.createProcess(Process1());
    var process2 = _process.createProcess(Process2());
    var process3 = _process.createProcess(Process3());

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BlocBuilder<ProcessBloc<Process1>, ProcessState>(
          builder: (context, state) {
            if (state is Executing) {
              return const CircularProgressIndicator();
            }
            else if (state is Success) {
              return Text(process1.output);
            }
            else {
              return const SizedBox.shrink();
            }
          },
        ),
        BlocBuilder<ProcessBloc<Process2>, ProcessState>(
          builder: (context, state) {
            if (state is Executing) {
              return const CircularProgressIndicator();
            }
            else if (state is Success) {
              return Text(process2.output);
            }
            else {
              return const SizedBox.shrink();
            }
          },
        ),
        BlocBuilder<ProcessBloc<Process3>, ProcessState>(
          builder: (context, state) {
            if (state is Executing) {
              return const CircularProgressIndicator();
            }
            else if (state is Success) {
              return Text(process3.output);
            }
            else {
              return const SizedBox.shrink();
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () async {
                process1.set(5);
                context.read<ProcessBloc<Process1>>().add(process1);
              }, 
              child: const Text("CLICK - 1")
            ),
            TextButton(
              onPressed: () async {
                process2.set(10);
                context.read<ProcessBloc<Process2>>().add(process2);
              }, 
              child: const Text("CLICK - 2")
            ),
            TextButton(
              onPressed: () async {
                process3.set(2);
                context.read<ProcessBloc<Process3>>().add(process3);
              }, 
              child: const Text("CLICK - 3")
            ),
          ],
        )
      ]
    );
  }

}


