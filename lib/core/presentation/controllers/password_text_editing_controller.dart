import 'package:reactive_variables/reactive_variables.dart';

import 'app_text_editing_controller.dart';

class PassTextEditingController extends AppTextEditingController {
  PassTextEditingController({super.text, bool isTextHidden = true})
      : isTextHidden = isTextHidden.rv;

  final Rv<bool> isTextHidden;

}
