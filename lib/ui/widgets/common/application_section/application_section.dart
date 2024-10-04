import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'application_section_model.dart';

class ApplicationSection extends StackedView<ApplicationSectionModel> {
  const ApplicationSection({
    super.key,
    required this.headerText,
    required this.labelText,
    this.labelColor,
    this.fontWeight,
    this.flex,
    this.isPaddingRequired = false,
  });

  final String headerText;
  final String labelText;
  final Color? labelColor;
  final bool? isPaddingRequired;
  final FontWeight? fontWeight;
  final int? flex;

  @override
  Widget builder(
    BuildContext context,
    ApplicationSectionModel viewModel,
    Widget? child,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: AppTextStyles.titleRegularSize16.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 11.5.sp,
              color: AppColors.kcGray30),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          labelText,
          style: AppTextStyles.titleRegularSize16.copyWith(
              fontWeight: fontWeight ?? FontWeight.w400,
              fontSize: 15.sp,
              color: labelColor ?? AppColors.kcGray0),
        ),
      ],
    );
  }

  @override
  ApplicationSectionModel viewModelBuilder(
    BuildContext context,
  ) =>
      ApplicationSectionModel();
}
