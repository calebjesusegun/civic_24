import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.logger.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:civic_24/ui/views/login/login_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel with $LoginView {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('LoginViewModel');

  /// Method to route Back to previous View
  void actionRouteBack() {
    _navigationService.back();
  }

  /// Method to login a new user with email and password
  void submit(String email, String password) async {
    _logger.i("Email Address: $email and Password $password");
    // TODO(Civic24): Implement Firebase Login Integration
  }

  /// Method to route to success view
  void actionRouteToHomeView() async {
    _navigationService.navigateToHomeView();
  }

  /// Method to route to the register view
  void actionRouteToRegisterView() {
    _navigationService.navigateToRegisterView();
  }
}
