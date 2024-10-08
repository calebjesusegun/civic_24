import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.logger.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:civic_24/services/firebase_service.dart';
import 'package:civic_24/ui/common/toast.dart';
import 'package:civic_24/ui/views/login/login_view.form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel with $LoginView {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _firebaseService = locator<FirebaseService>();
  final _logger = getLogger('LoginViewModel');

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

  /// Method to login a new user with email and password
  void submit(String email, String password) async {
    _logger.i("Email Address: $email and Password $password");

    updateLoadingState(true);
    User? user =
        await _firebaseService.signInWithEmailAndPassword(email, password);
    updateLoadingState(false);
    if (user != null) {
      showToast(message: "User successfully Signed In");
      actionRouteToHomeView();
    } else {
      showToast(message: "An unexpected error occured");
    }
  }

  /// Method to route to success view
  void actionRouteToHomeView() async {
    _navigationService.navigateToCitizenDashboardView();
  }

  /// Method to route to the register view
  void actionRouteToRegisterView() {
    _navigationService.navigateToRegisterView();
  }
}
