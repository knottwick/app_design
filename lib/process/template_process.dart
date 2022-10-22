import 'package:app_design/process/base_process.dart';
import 'package:app_design/utilities/bloc/process_bloc.dart';

abstract class TemplateProcess<TInput, TOutput> extends BaseProcess {
   
   late TInput input;
   late TOutput output;

   excute(TInput input) async {
      this.input = input;
      await execute();
      return Success<TOutput>(this.output);
   }

   @override
   execute() async {
      super.execute();
      await createOutput();
   }

   createOutput() { }
}