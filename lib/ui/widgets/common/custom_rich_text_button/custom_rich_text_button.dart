import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'custom_rich_text_button_model.dart';

class CustomRichTextButton extends StackedView<CustomRichTextButtonModel> {
  const CustomRichTextButton(
      {required this.buttonText,
      required this.labelText,
      required this.onTap,
      this.labelStyle,
      this.buttonStyle,
      super.key});

  final String buttonText;
  final String labelText;
  final VoidCallback? onTap;
  final TextStyle? labelStyle;
  final TextStyle? buttonStyle;

  @override
  Widget builder(
    BuildContext context,
    CustomRichTextButtonModel viewModel,
    Widget? child,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: labelStyle ??
              AppTextStyles.titleRegularSize16.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.kcGray30,
                  fontWeight: FontWeight.w400),
        ),
        SizedBox(
          width: 6.w,
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            buttonText,
            style: buttonStyle ??
                AppTextStyles.titleRegularSize16.copyWith(
                    fontSize: 14.sp,
                    color: AppColors.kcPrimary70,
                    fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }

  @override
  CustomRichTextButtonModel viewModelBuilder(
    BuildContext context,
  ) =>
      CustomRichTextButtonModel();
}
