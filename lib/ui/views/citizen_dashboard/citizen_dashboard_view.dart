import 'package:civic_24/models/report_model.dart';
import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/app_images.dart';
import 'package:civic_24/ui/common/app_strings.dart';
import 'package:civic_24/ui/common/app_text_styles.dart';
import 'package:civic_24/ui/common/ui_helpers.dart';
import 'package:civic_24/ui/widgets/common/no_data_found/no_data_found.dart';
import 'package:civic_24/ui/widgets/common/report/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'citizen_dashboard_viewmodel.dart';

class CitizenDashboardView extends StackedView<CitizenDashboardViewModel> {
  const CitizenDashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CitizenDashboardViewModel viewModel,
    Widget? child,
  ) {
    final dashboardScaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: dashboardScaffoldKey,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kcPrimary70,
        shape: const CircleBorder(),
        onPressed: () => viewModel.actionRouteToReportView(),
        child: const Icon(
          Icons.add,
          color: AppColors.kcWhite,
          size: 36,
        ),
      ),
      backgroundColor: AppColors.kcWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 16.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sidePadding,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${AppText.ksHello} ${viewModel.username}',
                          style: AppTextStyles.titleRegularSize16.copyWith(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.kcGray0),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SvgPicture.asset(
                          AppImages.hiEmoji,
                          width: 20.h,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      AppText.ksWeAreGlad,
                      style: AppTextStyles.titleRegularSize16.copyWith(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kcGray30),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    /// TabBar Header View
                    PreferredSize(
                      preferredSize: const Size.fromHeight(kToolbarHeight),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: AppColors.kcGray90,
                              width: 1.8,
                            ),
                          ),
                        ),
                        child: TabBar(
                          isScrollable: false,
                          tabAlignment: TabAlignment.fill,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: AppColors.kcPrimary70,
                          padding: EdgeInsets.only(
                              left: sidePadding, right: sidePadding),
                          unselectedLabelColor: AppColors.kcGray30,
                          unselectedLabelStyle:
                              AppTextStyles.titleRegularSize16.copyWith(
                            color: AppColors.kcGray90,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          labelColor: AppColors.kcPrimary70,
                          labelStyle: AppTextStyles.titleRegularSize16.copyWith(
                            color: AppColors.kcPrimary70,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          tabs: [
                            Tab(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppText.ksReports,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    AppText.ksStatus,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 12.h,
                    ),

                    /// TabBar Children View
                    SizedBox(
                      height: MediaQuery.of(context).size.height.h,
                      child: TabBarView(
                        physics: const BouncingScrollPhysics(),
                        children: <Widget>[
                          /// My Reports Section

                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: sidePadding,
                            ),
                            child: StreamBuilder<List<ReportModel>>(
                                stream: viewModel.getUserReports(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.kcPrimary70,
                                      ),
                                    );
                                  }
                                  if (snapshot.data!.isEmpty) {
                                    return const NoDataFound(
                                      text:
                                          "You have no reported issues. Click on the Add Icon to create a report",
                                    );
                                  }
                                  final reports = snapshot.data;
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: sidePadding),
                                    child: Column(
                                      children: reports!.map((report) {
                                        return SingleReport(
                                          reportTitle: report.reportReason!,
                                          imageUrl: report.imageUrl!,
                                          reportStatus: report.status!,
                                          address: report.address!,
                                          contactEmail: report.contactEmail!,
                                          contactNumber: report.contactNumber!,
                                          location: report.location!,
                                          linkStatusBackgroundColor:
                                              AppColors.kcGray90,
                                          linkStatusColor: AppColors.kcGray0,
                                        );
                                      }).toList(),
                                    ),
                                  );
                                }),
                          ),

                          /// Status Section
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: sidePadding,
                            ),
                            child: Text(AppText.ksStatus),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  CitizenDashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CitizenDashboardViewModel();
}
