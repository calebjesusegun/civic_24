import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_images.dart';
import 'package:civic_24/ui/common/app_strings.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:civic_24/ui/common/ui_helpers.dart';
import 'package:civic_24/ui/utils/validation.dart';
import 'package:civic_24/ui/views/register/register_view.form.dart';
import 'package:civic_24/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:civic_24/ui/widgets/common/primary_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'register_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
])
class RegisterView extends StackedView<RegisterViewModel> with $RegisterView {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RegisterViewModel viewModel,
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
              viewModel.actionRouteToRegisterPasswordView(emailController.text),
          isDisabled: emailController.text.isEmpty,
          loadingStateStatus: false,
        ),
      ),
    );
  }

  @override
  void onViewModelReady(RegisterViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(RegisterViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  RegisterViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      RegisterViewModel();
}
