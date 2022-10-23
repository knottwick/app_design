part of 'process_bloc.dart';

abstract class ProcessEvent {
  execute() { }
}

// class Create<T> extends ProcessEvent {
//   late T inputs;
//   Create(this.inputs);
// }

// class CreateProcess extends ProcessEvent {

// }