part of 'process_bloc.dart';


abstract class ProcessState { }

class Initial extends ProcessState { }
class Executing extends ProcessState { }

class Success<T> extends ProcessState {
  late T output;
  Success(this.output);
}
