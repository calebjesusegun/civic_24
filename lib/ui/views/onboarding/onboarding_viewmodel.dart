import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:civic_24/services/secure_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _secureStorageService = locator<SecureStorageService>();

  /// Method to route to the register view
  void actionRouteToRegisterView() async {
    String isValidString =
        await _secureStorageService.readFirstTimeUser() ?? "false";

    bool isValid = isValidString.toLowerCase() == 'true';
    if (isValid) {
      _navigationService.navigateToLoginView();
    } else {
      _navigationService.navigateToRegisterView();
      String response = "true";
      await _secureStorageService.writeFirstTimeUser(firstTimeUser: response);
    }
    // _secureStorageService
  }
}
