import 'package:stacked/stacked.dart';

class CustomTextFieldModel extends BaseViewModel {
  bool _passwordVisible = false;
  bool get passwordVisible => _passwordVisible;

  void showText() {
    _passwordVisible = !_passwordVisible;
    rebuildUi();
  }
}
