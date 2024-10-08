import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.logger.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:civic_24/models/report_model.dart';
import 'package:civic_24/services/firebase_service.dart';
import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/toast.dart';
import 'package:civic_24/ui/views/report/report_update_contact_details/report_update_contact_details_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReportUpdateContactDetailsViewModel extends FormViewModel
    with $ReportUpdateContactDetailsView {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _firebaseService = locator<FirebaseService>();
  final _logger = getLogger('ReportUpdateContactDetailsViewModel');

  /// LoadingState Status Variable declaration
  bool _loadingStateStatus = false;
  bool get loadingStateStatus => _loadingStateStatus;

  /// Method to route Back to previous View
  void actionRouteBack() {
    _navigationService.back();
  }

  updateLoadingState(bool status) {
    _loadingStateStatus = status;
    rebuildUi();
  }

  /// Method to create a report
  void submit(
      {required String number,
      required String location,
      required String address,
      required String reportReason,
      required String imageUrl,
      required String email}) async {
    try {
      ReportModel reportModel = ReportModel(
        reportReason: reportReason,
        imageUrl: imageUrl,
        contactNumber: number,
        location: location,
        address: address,
        status: 'pending',
        contactEmail: email,
      );

      updateLoadingState(true);
      _firebaseService.createReport(reportModel);
      updateLoadingState(false);

      _logger.i("Success");

      // actionRouteToSuccessView();
    } on Exception {
      showToast(
          message: 'An unexpected error occured... Kindly try again',
          color: AppColors.kcFail);
    }
  }

  /// Method to route to success view
  void actionRouteToSuccessView() {
    _navigationService.navigateToSuccessView(
        titleText: "Report Created",
        subText:
            "Get ready to explore the amazing features Civic24 has to offer.",
        buttonLabel: "Proceed",
        buttonOnTapFunction: () => actionRouteToCitizenDashboardView());
  }

  /// Method to route to the citizen dashboard view
  void actionRouteToCitizenDashboardView() {
    _navigationService.clearStackAndShow(Routes.citizenDashboardView);
  }

  /// Method to route to the login view
  void actionRouteToLoginView() {
    _navigationService.navigateToLoginView();
  }
}
