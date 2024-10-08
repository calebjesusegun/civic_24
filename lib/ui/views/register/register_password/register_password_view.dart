import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_images.dart';
import 'package:civic_24/ui/common/app_strings.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:civic_24/ui/common/ui_helpers.dart';
import 'package:civic_24/ui/utils/validation.dart';
import 'package:civic_24/ui/views/register/register_password/register_password_view.form.dart';
import 'package:civic_24/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:civic_24/ui/widgets/common/primary_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'register_password_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'password'),
])
class RegisterPasswordView extends StackedView<RegisterPasswordViewModel>
    with $RegisterPasswordView {
  const RegisterPasswordView({required this.emailAddress, Key? key})
      : super(key: key);

  final String emailAddress;

  @override
  Widget builder(
    BuildContext context,
    RegisterPasswordViewModel viewModel,
    Widget? child,
  ) {
    return AbsorbPointer(
      absorbing: viewModel.loadingStateStatus,
      child: Scaffold(
        backgroundColor: AppColors.kcWhite,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: sidePadding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Material(
                    color: AppColors.kcTransparent,
                    child: InkWell(
                      onTap: () => viewModel.actionRouteBack(),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SvgPicture.asset(
                          AppImages.backButton,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppText.ksPassword,
                    style: AppTextStyles.titleRegularSize16.copyWith(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kcGray0),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    AppText.ksPreferredPassword,
                    style: AppTextStyles.titleRegularSize16.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kcGray30),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomTextField(
                    label: AppText.ksPassword,
                    keyBoardType: TextInputType.text,
                    validator: (val) =>
                        Validation.validateField(AppText.ksPasswordRequired),
                    hintText: AppText.ksPassword,
                    textInputAction: TextInputAction.next,
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    showVisibilityToggle: true,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
            horizontal: sidePadding,
            vertical: 36.h,
          ),
          child: PrimaryButton(
            buttonText: AppText.ksProceed,
            onTap: () =>
                viewModel.submit(emailAddress, passwordController.text),
            isDisabled: passwordController.text.isEmpty,
            loadingStateStatus: viewModel.loadingStateStatus,
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(RegisterPasswordViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(RegisterPasswordViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  RegisterPasswordViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterPasswordViewModel();
}
