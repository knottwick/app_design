import 'package:app_design/utilities/bloc/process_bloc.dart';

abstract class Process extends ProcessEvent {
  T createProcess<T>(T process);
}

class ProcessManager extends Process {
  @override
  T createProcess<T>(T process) {
    return process;
  }
}