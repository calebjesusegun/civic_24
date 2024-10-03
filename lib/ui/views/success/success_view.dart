import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_images.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:civic_24/ui/common/ui_helpers.dart';
import 'package:civic_24/ui/widgets/common/primary_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import 'success_viewmodel.dart';

class SuccessView extends StackedView<SuccessViewModel> {
  const SuccessView(
      {required this.titleText,
      required this.subText,
      required this.buttonLabel,
      this.outlineButtonOnTapFunction,
      required this.buttonOnTapFunction,
      super.key});

  final String titleText;
  final String subText;
  final String buttonLabel;
  final VoidCallback buttonOnTapFunction;
  final VoidCallback? outlineButtonOnTapFunction;

  @override
  Widget builder(
    BuildContext context,
    SuccessViewModel viewModel,
    Widget? child,
  ) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: SizedBox(
            height: screenHeight(context).h,
            child: Padding(
              padding: EdgeInsets.only(
                top: sidePadding,
                left: sidePadding,
                right: sidePadding,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppImages.checkLogo,
                            height: 100.h,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Text(
                            titleText,
                            style: AppTextStyles.titleRegularSize16.copyWith(
                              fontSize: 20.sp,
                              color: AppColors.kcGray0,
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                            subText,
                            style: AppTextStyles.titleRegularSize16.copyWith(
                              fontSize: 14.sp,
                              color: AppColors.kcGray20,
                              height: 2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    PrimaryButton(
                      buttonText: buttonLabel,
                      onTap: buttonOnTapFunction,
                      isDisabled: false,
                      loadingStateStatus: false,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  @override
  SuccessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SuccessViewModel();
}
