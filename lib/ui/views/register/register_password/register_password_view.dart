import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'register_password_viewmodel.dart';

class RegisterPasswordView extends StackedView<RegisterPasswordViewModel> {
  const RegisterPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterPasswordViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  RegisterPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterPasswordViewModel();
}
