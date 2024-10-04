import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_images.dart';
import 'package:civic_24/ui/common/app_strings.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:civic_24/ui/common/ui_helpers.dart';
import 'package:civic_24/ui/utils/validation.dart';
import 'package:civic_24/ui/views/report/report_update_contact_details/report_update_contact_details_view.form.dart';
import 'package:civic_24/ui/widgets/common/custom_text_field/custom_text_field.dart';
import 'package:civic_24/ui/widgets/common/primary_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'report_update_contact_details_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'contactNumber'),
  FormTextField(name: 'location'),
  FormTextField(name: 'address'),
  FormTextField(name: 'contactEmail'),
])
class ReportUpdateContactDetailsView
    extends StackedView<ReportUpdateContactDetailsViewModel>
    with $ReportUpdateContactDetailsView {
  const ReportUpdateContactDetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReportUpdateContactDetailsViewModel viewModel,
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
                    AppText.ksSection3,
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
                                AppColors.kcPrimary70),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text(
                    AppText.ksAddContactDetails,
                    style: AppTextStyles.titleRegularSize16.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kcGray0),
                  ),
                  SizedBox(
                    height: 26.h,
                  ),
                  Text(
                    AppText.ksContactNumber,
                    style: AppTextStyles.titleRegularSize16.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kcGray0),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                    label: AppText.ksContactNumber,
                    keyBoardType: TextInputType.text,
                    validator: (val) => Validation.validateField(
                        AppText.ksContactNumberRequired),
                    hintText: AppText.ksContactNumber,
                    textInputAction: TextInputAction.next,
                    controller: contactNumberController,
                    focusNode: contactNumberFocusNode,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppText.ksLocation,
                    style: AppTextStyles.titleRegularSize16.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kcGray0),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                    label: AppText.ksLocation,
                    keyBoardType: TextInputType.text,
                    validator: (val) =>
                        Validation.validateField(AppText.ksLocationRequired),
                    hintText: AppText.ksLocation,
                    textInputAction: TextInputAction.next,
                    controller: locationController,
                    focusNode: locationFocusNode,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppText.ksAddress,
                    style: AppTextStyles.titleRegularSize16.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kcGray0),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                    label: AppText.ksAddress,
                    keyBoardType: TextInputType.text,
                    validator: (val) =>
                        Validation.validateField(AppText.ksAddressRequired),
                    hintText: AppText.ksAddress,
                    textInputAction: TextInputAction.next,
                    controller: addressController,
                    focusNode: addressFocusNode,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    AppText.ksEmailAddress,
                    style: AppTextStyles.titleRegularSize16.copyWith(
                        fontSize: 13.5.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.kcGray0),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  CustomTextField(
                    label: AppText.ksEmailAddress,
                    keyBoardType: TextInputType.emailAddress,
                    validator: (val) => Validation.validateField(
                        AppText.ksEmailAddressRequired),
                    hintText: AppText.ksEmailAddress,
                    textInputAction: TextInputAction.next,
                    controller: contactEmailController,
                    focusNode: contactEmailFocusNode,
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
            buttonText: AppText.ksSubmitReport,
            onTap: () => viewModel.actionRouteToRegisterPasswordView(
                number: contactNumberController.text,
                address: addressController.text,
                location: locationController.text,
                email: contactEmailController.text),
            isDisabled: (contactNumberController.text.isEmpty ||
                locationController.text.isEmpty ||
                addressController.text.isEmpty ||
                contactEmailController.text.isEmpty),
            loadingStateStatus: viewModel.loadingStateStatus,
          ),
        ),
      ),
    );
  }

  @override
  void onViewModelReady(ReportUpdateContactDetailsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(ReportUpdateContactDetailsViewModel viewModel) {
    disposeForm();
    super.onDispose(viewModel);
  }

  @override
  ReportUpdateContactDetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReportUpdateContactDetailsViewModel();
}
