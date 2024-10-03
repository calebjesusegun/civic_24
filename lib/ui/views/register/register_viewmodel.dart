import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.logger.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:civic_24/ui/views/register/register_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends FormViewModel with $RegisterView {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('RegisterViewModel');

  /// Method to route Back to previous View
  void actionRouteBack() {
    _navigationService.back();
  }

  /// Method to route to the register password view
  void actionRouteToRegisterPasswordView(String email) async {
    _navigationService.navigateToRegisterPasswordView(emailAddress: email);
    _logger.i("Email Address: $email");
  }

  /// Method to route to the login view
  void actionRouteToLoginView() {
    _navigationService.navigateToLoginView();
  }
}
