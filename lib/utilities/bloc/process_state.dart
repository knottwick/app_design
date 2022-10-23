part of 'process_bloc.dart';


abstract class ProcessState { }

class Initial extends ProcessState { }
class Executing extends ProcessState { }
class Success extends ProcessState { }
class Failure extends ProcessState { }

