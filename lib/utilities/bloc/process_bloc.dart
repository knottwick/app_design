import 'package:app_design/process/base_process.dart';
import 'package:app_design/process/template_process.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'process_event.dart';
part 'process_state.dart';

class ProcessBloc<T extends TemplateProcess> extends Bloc<ProcessEvent, ProcessState> {
  ProcessBloc(T process) : super(Initial()) {
    on<ProcessEvent>((event, emit) async {
      try {
        if (event is Create) {
          emit(Executing());

          var manager = ProcessManager();
          var p = manager.createProcess(process);
          var output = await p.excute(event.input);

          emit(output);
        }
      }
      catch (e) {

      }
      
    });
  }
}

class ProcessOutput<T> {

}

Type typeOf<T>() => T;
T? cast<T>(x) => x is T ? x : null;