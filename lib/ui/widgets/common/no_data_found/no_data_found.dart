import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'no_data_found_model.dart';

class NoDataFound extends StackedView<NoDataFoundModel> {
  final String text;

  const NoDataFound({super.key, required this.text});

  @override
  Widget builder(
    BuildContext context,
    NoDataFoundModel viewModel,
    Widget? child,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          "assets/lottie/no-transactions.json",
          width: 130,
          height: 130,
          alignment: Alignment.center,
        ),
        Align(
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppTextStyles.titleRegularSize16.copyWith(
              color: AppColors.kcGray30,
              fontWeight: FontWeight.w500,
              fontSize: 14.5.sp,
            ),
          ),
        )
      ],
    );
  }

  @override
  NoDataFoundModel viewModelBuilder(
    BuildContext context,
  ) =>
      NoDataFoundModel();
}
