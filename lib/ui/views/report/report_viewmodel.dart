import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.logger.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReportViewModel extends BaseViewModel {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _logger = getLogger('ReportViewModel');

  List<String> reportList = [
    'Suspicious activity',
    'Crime',
    'Road Condition',
    'Medical Facility',
    'Others'
  ];

  List<String>? selectedReportedIssue = [];

  void onTapReportIssue(String issue) {
    if (!selectedReportedIssue!.contains(issue)) {
      if (selectedReportedIssue!.length < 2) {
        selectedReportedIssue!.add(issue);
        rebuildUi();
        _logger.i(selectedReportedIssue);
      }
    } else {
      selectedReportedIssue!.removeWhere((element) => element == issue);
      rebuildUi();
      _logger.i(selectedReportedIssue);
    }
  }

  /// Method to route Back to previous View
  void actionRouteBack() {
    _navigationService.back();
  }

  /// Method to route to the report upload image details view
  void actionRouteToReportUploadImageView() async {
    _navigationService.navigateToReportUploadImageView(reportReason: "");
    _logger.i("Report Reason");
  }
}
