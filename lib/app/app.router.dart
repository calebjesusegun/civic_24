// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:civic_24/ui/views/citizen_dashboard/citizen_dashboard_view.dart'
    as _i8;
import 'package:civic_24/ui/views/login/login_view.dart' as _i6;
import 'package:civic_24/ui/views/onboarding/onboarding_view.dart' as _i3;
import 'package:civic_24/ui/views/register/register_password/register_password_view.dart'
    as _i5;
import 'package:civic_24/ui/views/register/register_view.dart' as _i4;
import 'package:civic_24/ui/views/report/report_update_contact_details/report_update_contact_details_view.dart'
    as _i11;
import 'package:civic_24/ui/views/report/report_upload_image/report_upload_image_view.dart'
    as _i10;
import 'package:civic_24/ui/views/report/report_view.dart' as _i9;
import 'package:civic_24/ui/views/startup/startup_view.dart' as _i2;
import 'package:civic_24/ui/views/success/success_view.dart' as _i7;
import 'package:flutter/material.dart' as _i12;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i13;

class Routes {
  static const startupView = '/startup-view';

  static const onboardingView = '/onboarding-view';

  static const registerView = '/register-view';

  static const registerPasswordView = '/register-password-view';

  static const loginView = '/login-view';

  static const successView = '/success-view';

  static const citizenDashboardView = '/citizen-dashboard-view';

  static const reportView = '/report-view';

  static const reportUploadImageView = '/report-upload-image-view';

  static const reportUpdateContactDetailsView =
      '/report-update-contact-details-view';

  static const all = <String>{
    startupView,
    onboardingView,
    registerView,
    registerPasswordView,
    loginView,
    successView,
    citizenDashboardView,
    reportView,
    reportUploadImageView,
    reportUpdateContactDetailsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.startupView,
      page: _i2.StartupView,
    ),
    _i1.RouteDef(
      Routes.onboardingView,
      page: _i3.OnboardingView,
    ),
    _i1.RouteDef(
      Routes.registerView,
      page: _i4.RegisterView,
    ),
    _i1.RouteDef(
      Routes.registerPasswordView,
      page: _i5.RegisterPasswordView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: _i6.LoginView,
    ),
    _i1.RouteDef(
      Routes.successView,
      page: _i7.SuccessView,
    ),
    _i1.RouteDef(
      Routes.citizenDashboardView,
      page: _i8.CitizenDashboardView,
    ),
    _i1.RouteDef(
      Routes.reportView,
      page: _i9.ReportView,
    ),
    _i1.RouteDef(
      Routes.reportUploadImageView,
      page: _i10.ReportUploadImageView,
    ),
    _i1.RouteDef(
      Routes.reportUpdateContactDetailsView,
      page: _i11.ReportUpdateContactDetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.StartupView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.StartupView(),
        settings: data,
      );
    },
    _i3.OnboardingView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.OnboardingView(),
        settings: data,
      );
    },
    _i4.RegisterView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.RegisterView(),
        settings: data,
      );
    },
    _i5.RegisterPasswordView: (data) {
      final args = data.getArgs<RegisterPasswordViewArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i5.RegisterPasswordView(
            emailAddress: args.emailAddress, key: args.key),
        settings: data,
      );
    },
    _i6.LoginView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.LoginView(),
        settings: data,
      );
    },
    _i7.SuccessView: (data) {
      final args = data.getArgs<SuccessViewArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i7.SuccessView(
            titleText: args.titleText,
            subText: args.subText,
            buttonLabel: args.buttonLabel,
            outlineButtonOnTapFunction: args.outlineButtonOnTapFunction,
            buttonOnTapFunction: args.buttonOnTapFunction,
            key: args.key),
        settings: data,
      );
    },
    _i8.CitizenDashboardView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.CitizenDashboardView(),
        settings: data,
      );
    },
    _i9.ReportView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ReportView(),
        settings: data,
      );
    },
    _i10.ReportUploadImageView: (data) {
      final args = data.getArgs<ReportUploadImageViewArguments>(nullOk: false);
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.ReportUploadImageView(
            reportReason: args.reportReason, key: args.key),
        settings: data,
      );
    },
    _i11.ReportUpdateContactDetailsView: (data) {
      return _i12.MaterialPageRoute<dynamic>(
        builder: (context) => const _i11.ReportUpdateContactDetailsView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class RegisterPasswordViewArguments {
  const RegisterPasswordViewArguments({
    required this.emailAddress,
    this.key,
  });

  final String emailAddress;

  final _i12.Key? key;

  @override
  String toString() {
    return '{"emailAddress": "$emailAddress", "key": "$key"}';
  }

  @override
  bool operator ==(covariant RegisterPasswordViewArguments other) {
    if (identical(this, other)) return true;
    return other.emailAddress == emailAddress && other.key == key;
  }

  @override
  int get hashCode {
    return emailAddress.hashCode ^ key.hashCode;
  }
}

class SuccessViewArguments {
  const SuccessViewArguments({
    required this.titleText,
    required this.subText,
    required this.buttonLabel,
    this.outlineButtonOnTapFunction,
    required this.buttonOnTapFunction,
    this.key,
  });

  final String titleText;

  final String subText;

  final String buttonLabel;

  final void Function()? outlineButtonOnTapFunction;

  final void Function() buttonOnTapFunction;

  final _i12.Key? key;

  @override
  String toString() {
    return '{"titleText": "$titleText", "subText": "$subText", "buttonLabel": "$buttonLabel", "outlineButtonOnTapFunction": "$outlineButtonOnTapFunction", "buttonOnTapFunction": "$buttonOnTapFunction", "key": "$key"}';
  }

  @override
  bool operator ==(covariant SuccessViewArguments other) {
    if (identical(this, other)) return true;
    return other.titleText == titleText &&
        other.subText == subText &&
        other.buttonLabel == buttonLabel &&
        other.outlineButtonOnTapFunction == outlineButtonOnTapFunction &&
        other.buttonOnTapFunction == buttonOnTapFunction &&
        other.key == key;
  }

  @override
  int get hashCode {
    return titleText.hashCode ^
        subText.hashCode ^
        buttonLabel.hashCode ^
        outlineButtonOnTapFunction.hashCode ^
        buttonOnTapFunction.hashCode ^
        key.hashCode;
  }
}

class ReportUploadImageViewArguments {
  const ReportUploadImageViewArguments({
    required this.reportReason,
    this.key,
  });

  final String reportReason;

  final _i12.Key? key;

  @override
  String toString() {
    return '{"reportReason": "$reportReason", "key": "$key"}';
  }

  @override
  bool operator ==(covariant ReportUploadImageViewArguments other) {
    if (identical(this, other)) return true;
    return other.reportReason == reportReason && other.key == key;
  }

  @override
  int get hashCode {
    return reportReason.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i13.NavigationService {
  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegisterPasswordView({
    required String emailAddress,
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.registerPasswordView,
        arguments:
            RegisterPasswordViewArguments(emailAddress: emailAddress, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSuccessView({
    required String titleText,
    required String subText,
    required String buttonLabel,
    void Function()? outlineButtonOnTapFunction,
    required void Function() buttonOnTapFunction,
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.successView,
        arguments: SuccessViewArguments(
            titleText: titleText,
            subText: subText,
            buttonLabel: buttonLabel,
            outlineButtonOnTapFunction: outlineButtonOnTapFunction,
            buttonOnTapFunction: buttonOnTapFunction,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCitizenDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.citizenDashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.reportView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportUploadImageView({
    required String reportReason,
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.reportUploadImageView,
        arguments: ReportUploadImageViewArguments(
            reportReason: reportReason, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToReportUpdateContactDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.reportUpdateContactDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOnboardingView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.onboardingView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.registerView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegisterPasswordView({
    required String emailAddress,
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.registerPasswordView,
        arguments:
            RegisterPasswordViewArguments(emailAddress: emailAddress, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSuccessView({
    required String titleText,
    required String subText,
    required String buttonLabel,
    void Function()? outlineButtonOnTapFunction,
    required void Function() buttonOnTapFunction,
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.successView,
        arguments: SuccessViewArguments(
            titleText: titleText,
            subText: subText,
            buttonLabel: buttonLabel,
            outlineButtonOnTapFunction: outlineButtonOnTapFunction,
            buttonOnTapFunction: buttonOnTapFunction,
            key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCitizenDashboardView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.citizenDashboardView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.reportView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportUploadImageView({
    required String reportReason,
    _i12.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.reportUploadImageView,
        arguments: ReportUploadImageViewArguments(
            reportReason: reportReason, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithReportUpdateContactDetailsView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.reportUpdateContactDetailsView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
