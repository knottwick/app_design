import 'package:app_design/utilities/bloc/process_bloc.dart';

class TemplateProcess<TInput, TOutput> extends ProcessEvent {
   
  late TInput input;
  late TOutput output;

  void set(TInput input) async {
    this.input = input;
  }

  @override
  execute() async {
    super.execute();
    await createOutput();
  }

  createOutput() { }
}