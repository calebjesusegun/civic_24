import 'package:civic_24/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:civic_24/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:civic_24/ui/views/home/home_view.dart';
import 'package:civic_24/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:civic_24/services/secure_storage_service.dart';
import 'package:civic_24/ui/views/onboarding/onboarding_view.dart';
import 'package:civic_24/ui/views/register/register_view.dart';
import 'package:civic_24/ui/views/register/register_password/register_password_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: RegisterPasswordView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SecureStorageService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
