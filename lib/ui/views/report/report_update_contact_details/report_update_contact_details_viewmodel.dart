import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.logger.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:civic_24/ui/views/report/report_update_contact_details/report_update_contact_details_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReportUpdateContactDetailsViewModel extends FormViewModel
    with $ReportUpdateContactDetailsView {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('ReportUpdateContactDetailsViewModel');

  /// LoadingState Status Variable declaration
  bool _loadingStateStatus = false;
  bool get loadingStateStatus => _loadingStateStatus;

  /// Method to initiate the setBusy State
  void initiateLoading(bool value) {
    _loadingStateStatus = value;
    rebuildUi();
  }

  /// Method to route Back to previous View
  void actionRouteBack() {
    _navigationService.back();
  }

  /// Method to route to the register password view
  void actionRouteToRegisterPasswordView(
      {required String number,
      required String location,
      required String address,
      required String email}) async {
    _navigationService.navigateToRegisterPasswordView(emailAddress: email);
    _logger.i("Email Address: $email");
  }

  /// Method to route to the login view
  void actionRouteToLoginView() {
    _navigationService.navigateToLoginView();
  }
}
