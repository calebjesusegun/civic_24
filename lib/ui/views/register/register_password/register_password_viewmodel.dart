import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.logger.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:civic_24/services/firebase_service.dart';
import 'package:civic_24/ui/common/app_colors.dart';
import 'package:civic_24/ui/common/toast.dart';
import 'package:civic_24/ui/views/register/register_password/register_password_view.form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterPasswordViewModel extends FormViewModel
    with $RegisterPasswordView {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _firebaseService = locator<FirebaseService>();
  final _logger = getLogger('RegisterViewModel');

  /// Method to route Back to previous View
  void actionRouteBack() {
    _navigationService.back();
  }

  /// LoadingState Status Variable declaration
  bool _loadingStateStatus = false;
  bool get loadingStateStatus => _loadingStateStatus;

  updateLoadingState(bool status) {
    _loadingStateStatus = status;
    rebuildUi();
  }

  /// Method to register a new user with email and password
  void submit(String email, String password) async {
    _logger.i("Email Address: $email and Password $password");
    updateLoadingState(true);
    User? user =
        await _firebaseService.signUpWithEmailAndPassword(email, password);
    updateLoadingState(false);
    if (user != null) {
      actionRouteToSuccessView();
    }
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
    _navigationService.clearStackAndShow(Routes.loginView);
  }
}
