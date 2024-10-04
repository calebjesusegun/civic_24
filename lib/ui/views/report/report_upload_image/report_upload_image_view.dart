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

import 'report_upload_image_viewmodel.dart';

// ignore: must_be_immutable
class ReportUploadImageView extends StackedView<ReportUploadImageViewModel> {
  ReportUploadImageView({required this.reportReason, Key? key})
      : super(key: key);

  String reportReason;

  @override
  Widget builder(
    BuildContext context,
    ReportUploadImageViewModel viewModel,
    Widget? child,
  ) {
    final Size size = MediaQuery.of(context).size;
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
                    AppText.ksSection2,
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
                    AppText.ksUploadImage,
                    style: AppTextStyles.titleRegularSize16.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kcGray0),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Builder(builder: (context) {
                    if (viewModel.selectedMedia.isEmpty) {
                      return Material(
                        color: AppColors.kcTransparent,
                        child: InkWell(
                          onTap: () => viewModel.pickFiles(),
                          child: Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              AppImages.uploadImage,
                              fit: BoxFit.fill,
                              width: size.width.w,
                              height: 220.h,
                            ),
                          ),
                        ),
                      );
                    }
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(6.r),
                      child: Image.file(
                        viewModel.file,
                        fit: BoxFit.cover,
                        width: size.width.w,
                        height: 300.h,
                      ),
                    );
                  }),
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
            buttonText: AppText.ksSubmitReport,
            onTap: () =>
                viewModel.actionRouteToReportUpdateContactDetailsView(),
            isDisabled: viewModel.getDisabledState(),
            loadingStateStatus: viewModel.loadingStateStatus,
          ),
        ),
      ),
    );
  }

  @override
  ReportUploadImageViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReportUploadImageViewModel();
}
