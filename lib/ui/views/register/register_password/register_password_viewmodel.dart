import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.logger.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:civic_24/ui/views/register/register_password/register_password_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterPasswordViewModel extends FormViewModel
    with $RegisterPasswordView {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('RegisterViewModel');

  /// Method to route Back to previous View
  void actionRouteBack() {
    _navigationService.back();
  }

  /// Method to register a new user with email and password
  void submit(String email, String password) async {
    _logger.i("Email Address: $email and Password $password");
    // TODO(Civic24): Implement Firebase SignUp Integration
  }

  /// Method to route to success view
  void actionRouteToSuccessView() {
    _navigationService.navigateToSuccessView(
        titleText: "Account Created",
        subText:
            "Get ready to explore the amazing features Civic24 has to offer.",
        buttonLabel: "Proceed",
        buttonOnTapFunction: () => actionRouteToLoginView());
  }

  /// Method to route to the login view
  void actionRouteToLoginView() {
    _navigationService.navigateToLoginView();
  }
}
