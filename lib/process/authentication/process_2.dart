import 'package:app_design/process/template_process.dart';

class Process2 extends TemplateProcess<int, String> {

  @override
  createOutput() async {
    await Future.delayed(Duration(seconds: input));
    output = "Process 2 : Success";
  }
}
