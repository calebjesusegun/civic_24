import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:civic_24/ui/common/ui_helpers.dart';
import 'package:civic_24/ui/widgets/common/application_section/application_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'report_model.dart';

class SingleReport extends StackedView<SingleReportModel> {
  const SingleReport({
    super.key,
    required this.address,
    required this.location,
    required this.contactNumber,
    required this.contactEmail,
    required this.linkStatus,
    required this.linkStatusColor,
    required this.linkStatusBackgroundColor,
    required this.reportTitle,
    required this.imageUrl,
    required this.reportStatus,
  });

  final String reportTitle;
  final String reportStatus;
  final String imageUrl;
  final String address;
  final String location;
  final String contactNumber;
  final String contactEmail;
  final String linkStatus;
  final Color linkStatusColor;
  final Color linkStatusBackgroundColor;

  @override
  Widget builder(
    BuildContext context,
    SingleReportModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: AppColors.kcReportBorder,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            reportTitle,
            style: AppTextStyles.titleRegularSize16.copyWith(
                color: AppColors.kcGray0,
                fontSize: 14.5.sp,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0.r),
              // border: Border.all(color: AppColors.kcGray20, width: 0.25.w),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6.0.r),
              child: CachedNetworkImage(
                alignment: Alignment.center,
                imageUrl: imageUrl,
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: (Colors.grey[300])!,
                  highlightColor: (Colors.grey[100])!,
                  enabled: true,
                  child: Container(
                    width: screenWidth(context).w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: Colors.white,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    SizedBox(width: screenWidth(context).w),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          ApplicationSection(
            headerText: 'ADDRESS',
            labelText: address,
            flex: 1,
            isPaddingRequired: false,
          ),
          SizedBox(
            height: 16.h,
          ),
          ApplicationSection(
            headerText: 'LOCATION',
            labelText: location,
            flex: 1,
            isPaddingRequired: false,
          ),
          SizedBox(
            height: 18.h,
          ),
          ApplicationSection(
            headerText: 'CONTACT NUMBER',
            labelText: contactNumber,
            flex: 1,
            isPaddingRequired: false,
          ),
          SizedBox(
            height: 18.h,
          ),
          ApplicationSection(
            headerText: 'CONTACT EMAIL ADDRESS',
            labelText: contactEmail,
            flex: 1,
            isPaddingRequired: false,
          ),
          SizedBox(
            height: 18.h,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "STATUS",
                style: AppTextStyles.titleRegularSize16.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 11.5.sp,
                    color: AppColors.kcGray30),
              ),
              SizedBox(height: 8.h),
              UnconstrainedBox(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    // color: AppColors.gray1,
                    color: linkStatusBackgroundColor,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 13.w, vertical: 4.w),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: linkStatusColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        linkStatus,
                        style: AppTextStyles.titleRegularSize16.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: linkStatusColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  SingleReportModel viewModelBuilder(
    BuildContext context,
  ) =>
      SingleReportModel();
}
