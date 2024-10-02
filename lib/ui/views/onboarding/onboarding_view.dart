import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_images.dart';
import 'package:civic_24/ui/common/app_strings.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:civic_24/ui/common/ui_helpers.dart';
import 'package:civic_24/ui/widgets/common/primary_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    OnboardingViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: AppColors.kcPrimary0,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: sidePadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.appLogo,
                    width: 80.w,
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                SvgPicture.asset(
                  AppImages.onboarding1,
                  height: 230.h,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  AppText.ksCivicReportingSystem,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.kcGray0),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  AppText.ksCivicReportingSystemDetails,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.kcGray20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: sidePadding,
          vertical: 40.h,
        ),
        child: PrimaryButton(
          buttonText: AppText.ksGetStarted,
          onTap: () => viewModel.actionRouteToOnboardingUsername(),
          isDisabled: false,
          loadingStateStatus: false,
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OnboardingViewModel();
}
