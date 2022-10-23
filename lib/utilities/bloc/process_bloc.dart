import 'package:app_design/process/template_process.dart';
import 'package:bloc/bloc.dart';

part 'process_event.dart';
part 'process_state.dart';

class ProcessBloc<T extends TemplateProcess> extends Bloc<ProcessEvent, ProcessState> {
  ProcessBloc(T process) : super(Initial()) {
    on<ProcessEvent>((event, emit) async {
      try {
        emit(Executing());
        await event.execute();
        emit(Success());
      }
      catch (e) {
        emit(Failure());
      }
    });
  }
}