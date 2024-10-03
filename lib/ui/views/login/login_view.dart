import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_images.dart';
import 'package:civic_24/ui/common/app_strings.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:civic_24/ui/common/ui_helpers.dart';
import 'package:civic_24/ui/utils/validation.dart';
import 'package:civic_24/ui/views/login/login_view.form.dart';
import 'package:civic_24/ui/widgets/common/custom_rich_text_button/custom_rich_text_button.dart';
import 'package:civic_24/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:civic_24/ui/widgets/common/primary_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'login_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
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
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 80.w,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppText.ksEmailAddress,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 19.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kcGray0),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  AppText.ksPreferredEmail,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kcGray30),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  label: AppText.ksEmailAddress,
                  keyBoardType: TextInputType.emailAddress,
                  validator: (val) =>
                      Validation.validateField(AppText.ksEmailAddressRequired),
                  hintText: AppText.ksEmailAddress,
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  focusNode: emailFocusNode,
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
                SizedBox(
                  height: 40.h,
                ),
                PrimaryButton(
                  buttonText: AppText.ksProceed,
                  onTap: () => viewModel.submit(
                      emailController.text, passwordController.text),
                  isDisabled: (emailController.text.isEmpty ||
                      passwordController.text.isEmpty),
                  loadingStateStatus: false,
                ),
                SizedBox(
                  height: 12.h,
                ),
                CustomRichTextButton(
                  buttonText: AppText.ksSignUp,
                  labelText: AppText.ksDontHaveAnAccount,
                  onTap: () => viewModel.actionRouteToRegisterView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
