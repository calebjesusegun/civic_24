import 'dart:io';
import 'package:civic_24/app/app.locator.dart';
import 'package:civic_24/app/app.logger.dart';
import 'package:civic_24/app/app.router.dart';
import 'package:civic_24/services/firebase_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:path/path.dart' as path;

class ReportUploadImageViewModel extends BaseViewModel {
  /// Initializing the required Services and Dependencies
  final _navigationService = locator<NavigationService>();
  final _firebaseService = locator<FirebaseService>();
  final _logger = getLogger('ReportUploadImageViewModel');

  /// Method to route Back to previous View
  void actionRouteBack() {
    _navigationService.back();
  }

  /// Method to route to the register password view
  void actionRouteToRegisterPasswordView(
      {required String number,
      required String location,
      required String address,
      required String email}) async {
    _navigationService.navigateToRegisterPasswordView(emailAddress: email);
    _logger.i("Email Address: $email");
  }

  /// Method to route to the login view
  void actionRouteToLoginView() {
    _navigationService.navigateToLoginView();
  }

  /// LoadingState Status Variable declaration
  bool _loadingStateStatus = false;
  bool get loadingStateStatus => _loadingStateStatus;

  /// Method that returns a boolean for the disabled state if an image has been selected or not
  bool getDisabledState() {
    return selectedMedia.isEmpty;
  }

  /// Method to remove an image that was selected
  void actionRemoveImage() {
    _selectedMedia.clear();
    rebuildUi();
  }

  /// List of selected image
  final List<File?> _selectedMedia = [];
  List<File?> get selectedMedia => _selectedMedia;

  /// Variable to store the selected File image
  File _file = File('');
  File get file => _file;
  String _fileName = "";

  /// Variable to store the the selected image Uint8List
  Uint8List imageUint8List = Uint8List(0);

  /// Method to initiate the setBusy State
  updateLoadingState(bool status) {
    _loadingStateStatus = status;
    rebuildUi();
  }

  /// Method to select a food image from the device Photo Library
  Future pickFiles() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    if (result != null) {
      _file = File(result.files.single.path!);

      _fileName = path.basename(_file.path);

      imageUint8List = await _file.readAsBytes();

      _selectedMedia.add(_file);

      rebuildUi();
    }
  }

  /// Method to route to the report update contact details view
  void actionRouteToReportUpdateContactDetailsView(String reportReason) async {
    updateLoadingState(true);
    String imageUrl = await _firebaseService.uploadImage(
        fileName: _fileName, imageFile: _file);

    updateLoadingState(false);

    if (imageUrl.isNotEmpty) {
      _navigationService.navigateToReportUpdateContactDetailsView(
          reportReason: reportReason, imageUrl: imageUrl);
      _logger.i("ImageUrl: $imageUrl");
    }
  }
}
