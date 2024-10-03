import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewModel extends BaseViewModel {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();

  /// Method to route to the register view
  void actionRouteToRegisterView() {
    _navigationService.navigateToRegisterView();
  }
}
