part of 'process_bloc.dart';

abstract class ProcessEvent { }

class Create<T> extends ProcessEvent {
  late T input;
  Create(this.input);
}

