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

import 'report_viewmodel.dart';

class ReportView extends StackedView<ReportViewModel> {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReportViewModel viewModel,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
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
                    const Spacer(),
                    Text(
                      AppText.ksAddReport,
                      style: AppTextStyles.titleRegularSize16.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.kcGray0),
                    ),
                    const Spacer(),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  AppText.ksSection1,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 14.5.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kcGray0),
                ),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                  height: screenHeight(context) * .013,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 1,
                          minHeight: 6.h,
                          color: AppColors.ksLinearIndicatorInActiveColor,
                          backgroundColor:
                              AppColors.ksLinearIndicatorInActiveColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0.r),
                          ),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.kcPrimary70),
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 1,
                          minHeight: 6.h,
                          color: AppColors.ksLinearIndicatorInActiveColor,
                          backgroundColor:
                              AppColors.ksLinearIndicatorInActiveColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0.r),
                          ),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                              AppColors.ksLinearIndicatorInActiveColor),
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 1,
                          minHeight: 6.h,
                          color: AppColors.ksLinearIndicatorInActiveColor,
                          backgroundColor:
                              AppColors.ksLinearIndicatorInActiveColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(5.0.r),
                          ),
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.ksLinearIndicatorInActiveColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  AppText.ksAddSelectReason,
                  style: AppTextStyles.titleRegularSize16.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kcGray0),
                ),
                SizedBox(
                  height: 26.h,
                ),
                Wrap(
                  children: viewModel.reportList.map(
                    (issue) {
                      bool isSelected = false;
                      if (viewModel.selectedReportedIssue!.contains(issue)) {
                        isSelected = true;
                      }
                      return GestureDetector(
                        onTap: () => viewModel.onTapReportIssue(issue),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 8),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.kcPrimary70
                                    : AppColors.kcGray40,
                                width: 1.3,
                              ),
                            ),
                            child: Text(
                              issue,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: isSelected
                                    ? AppColors.kcPrimary70
                                    : AppColors.kcGray40,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
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
          onTap: () => viewModel.actionRouteToReportUploadImageView(),
          isDisabled: false,
          loadingStateStatus: false,
        ),
      ),
    );
  }

  @override
  ReportViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReportViewModel();
}
