import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CitizenDashboardViewModel extends BaseViewModel {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('CitizenDashboardViewModel');

  final String _username = "";
  String get username => _username;

  /// Method to route to the report view
  void actionRouteToReportView() {
    // _navigationService.navigateToRegisterView();
  }
}
