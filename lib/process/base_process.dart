abstract class BaseProcess {
  execute() { }
}

abstract class Process extends BaseProcess {
  T createProcess<T>(T process);
}

class ProcessManager extends Process {
  @override
  T createProcess<T>(T process) {
    return process;
  }
}