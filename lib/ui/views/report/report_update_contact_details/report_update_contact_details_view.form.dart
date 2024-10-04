// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String ContactNumberValueKey = 'contactNumber';
const String LocationValueKey = 'location';
const String AddressValueKey = 'address';
const String ContactEmailValueKey = 'contactEmail';

final Map<String, TextEditingController>
    _ReportUpdateContactDetailsViewTextEditingControllers = {};

final Map<String, FocusNode> _ReportUpdateContactDetailsViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _ReportUpdateContactDetailsViewTextValidations = {
  ContactNumberValueKey: null,
  LocationValueKey: null,
  AddressValueKey: null,
  ContactEmailValueKey: null,
};

mixin $ReportUpdateContactDetailsView {
  TextEditingController get contactNumberController =>
      _getFormTextEditingController(ContactNumberValueKey);
  TextEditingController get locationController =>
      _getFormTextEditingController(LocationValueKey);
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);
  TextEditingController get contactEmailController =>
      _getFormTextEditingController(ContactEmailValueKey);

  FocusNode get contactNumberFocusNode =>
      _getFormFocusNode(ContactNumberValueKey);
  FocusNode get locationFocusNode => _getFormFocusNode(LocationValueKey);
  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);
  FocusNode get contactEmailFocusNode =>
      _getFormFocusNode(ContactEmailValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_ReportUpdateContactDetailsViewTextEditingControllers.containsKey(
        key)) {
      return _ReportUpdateContactDetailsViewTextEditingControllers[key]!;
    }

    _ReportUpdateContactDetailsViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _ReportUpdateContactDetailsViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_ReportUpdateContactDetailsViewFocusNodes.containsKey(key)) {
      return _ReportUpdateContactDetailsViewFocusNodes[key]!;
    }
    _ReportUpdateContactDetailsViewFocusNodes[key] = FocusNode();
    return _ReportUpdateContactDetailsViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    contactNumberController.addListener(() => _updateFormData(model));
    locationController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    contactEmailController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    contactNumberController.addListener(() => _updateFormData(model));
    locationController.addListener(() => _updateFormData(model));
    addressController.addListener(() => _updateFormData(model));
    contactEmailController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          ContactNumberValueKey: contactNumberController.text,
          LocationValueKey: locationController.text,
          AddressValueKey: addressController.text,
          ContactEmailValueKey: contactEmailController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _ReportUpdateContactDetailsViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _ReportUpdateContactDetailsViewFocusNodes.values) {
      focusNode.dispose();
    }

    _ReportUpdateContactDetailsViewTextEditingControllers.clear();
    _ReportUpdateContactDetailsViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get contactNumberValue =>
      this.formValueMap[ContactNumberValueKey] as String?;
  String? get locationValue => this.formValueMap[LocationValueKey] as String?;
  String? get addressValue => this.formValueMap[AddressValueKey] as String?;
  String? get contactEmailValue =>
      this.formValueMap[ContactEmailValueKey] as String?;

  set contactNumberValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ContactNumberValueKey: value}),
    );

    if (_ReportUpdateContactDetailsViewTextEditingControllers.containsKey(
        ContactNumberValueKey)) {
      _ReportUpdateContactDetailsViewTextEditingControllers[
              ContactNumberValueKey]
          ?.text = value ?? '';
    }
  }

  set locationValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LocationValueKey: value}),
    );

    if (_ReportUpdateContactDetailsViewTextEditingControllers.containsKey(
        LocationValueKey)) {
      _ReportUpdateContactDetailsViewTextEditingControllers[LocationValueKey]
          ?.text = value ?? '';
    }
  }

  set addressValue(String? value) {
    this.setData(
      this.formValueMap..addAll({AddressValueKey: value}),
    );

    if (_ReportUpdateContactDetailsViewTextEditingControllers.containsKey(
        AddressValueKey)) {
      _ReportUpdateContactDetailsViewTextEditingControllers[AddressValueKey]
          ?.text = value ?? '';
    }
  }

  set contactEmailValue(String? value) {
    this.setData(
      this.formValueMap..addAll({ContactEmailValueKey: value}),
    );

    if (_ReportUpdateContactDetailsViewTextEditingControllers.containsKey(
        ContactEmailValueKey)) {
      _ReportUpdateContactDetailsViewTextEditingControllers[
              ContactEmailValueKey]
          ?.text = value ?? '';
    }
  }

  bool get hasContactNumber =>
      this.formValueMap.containsKey(ContactNumberValueKey) &&
      (contactNumberValue?.isNotEmpty ?? false);
  bool get hasLocation =>
      this.formValueMap.containsKey(LocationValueKey) &&
      (locationValue?.isNotEmpty ?? false);
  bool get hasAddress =>
      this.formValueMap.containsKey(AddressValueKey) &&
      (addressValue?.isNotEmpty ?? false);
  bool get hasContactEmail =>
      this.formValueMap.containsKey(ContactEmailValueKey) &&
      (contactEmailValue?.isNotEmpty ?? false);

  bool get hasContactNumberValidationMessage =>
      this.fieldsValidationMessages[ContactNumberValueKey]?.isNotEmpty ?? false;
  bool get hasLocationValidationMessage =>
      this.fieldsValidationMessages[LocationValueKey]?.isNotEmpty ?? false;
  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;
  bool get hasContactEmailValidationMessage =>
      this.fieldsValidationMessages[ContactEmailValueKey]?.isNotEmpty ?? false;

  String? get contactNumberValidationMessage =>
      this.fieldsValidationMessages[ContactNumberValueKey];
  String? get locationValidationMessage =>
      this.fieldsValidationMessages[LocationValueKey];
  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
  String? get contactEmailValidationMessage =>
      this.fieldsValidationMessages[ContactEmailValueKey];
}

extension Methods on FormStateHelper {
  setContactNumberValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ContactNumberValueKey] = validationMessage;
  setLocationValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LocationValueKey] = validationMessage;
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;
  setContactEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[ContactEmailValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    contactNumberValue = '';
    locationValue = '';
    addressValue = '';
    contactEmailValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      ContactNumberValueKey: getValidationMessage(ContactNumberValueKey),
      LocationValueKey: getValidationMessage(LocationValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
      ContactEmailValueKey: getValidationMessage(ContactEmailValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _ReportUpdateContactDetailsViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _ReportUpdateContactDetailsViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      ContactNumberValueKey: getValidationMessage(ContactNumberValueKey),
      LocationValueKey: getValidationMessage(LocationValueKey),
      AddressValueKey: getValidationMessage(AddressValueKey),
      ContactEmailValueKey: getValidationMessage(ContactEmailValueKey),
    });
