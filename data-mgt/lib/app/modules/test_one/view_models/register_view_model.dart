import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/core/model/country.dart';
import 'package:interview/app/core/utils/extensions/date_string_extension.dart';

class RegisterViewModel extends GetxController {
  Country? selectedCountry;
  String? gender;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final nationalityController = TextEditingController();
  final dobController = TextEditingController();
  final phController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<String> get countryStrings =>
      countries.map((country) => country.name).toList();

  List<String> get genders => ['Female', 'Male'];

  void onSelectedCountry(index) {
    selectedCountry = countries[index];
    update();
  }

  void onSelectedGender(String _gender) {
    gender = _gender;
  }

  bool isValid() {
    return formKey.currentState!.validate();
  }

  String? firstNameValidator(String? _) {
    if (firstNameController.text.isEmpty) {
      return 'Please enter your first name';
    }
    return null;
  }

  String? lastNameValidator(String? _) {
    if (lastNameController.text.isEmpty) {
      return 'Please enter your last name';
    }
    return null;
  }

  String? emailValidator(String? _) {
    if (emailController.text.isEmpty) {
      return 'Please enter your email';
    }

    if (!emailController.text.isEmail) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? nationalityValidator(String? _) {
    if (nationalityController.text.isEmpty) {
      return 'Please enter your nationality';
    }
    return null;
  }

  String? dobValidator(String? _) {
    if (dobController.text.isEmpty) {
      return 'Please select your date of birth';
    }
    return null;
  }

  String? countryValidator(int? _) {
    if (selectedCountry == null) {
      return 'Please select country';
    }
    return null;
  }

  String? phoneValidator(String? _) {
    if (phController.text.isNotEmpty) {
      if (selectedCountry == null) {
        return 'Please select country first';
      }
      if (!(selectedCountry!.prefixPhoneCode + phController.text)
          .isPhoneNumber) {
        debugPrint(
            (selectedCountry?.prefixPhoneCode ?? '') + phController.text);
        return 'Please enter a valid phone number';
      }
    }

    return null;
  }

  void onSubmit() {
    if (isValid()) {
      // print all the data
      debugPrint(
          """
      First Name: ${firstNameController.text}
      Last Name: ${lastNameController.text}
      Email: ${emailController.text}
      Nationality: ${nationalityController.text}
      DOB: ${dobController.text}
      Gender: $gender
      Country: ${selectedCountry!.name}
      Phone: ${selectedCountry!.prefixPhoneCode} ${phController.text}
      """);
      Get.snackbar(
        'Register Successfully!',
        'Your account has been created. Please login',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void onTapDob() async {
    final pickedDateTime = await Get.dialog<DateTime>(
      DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      ),
    );

    dobController.text =
        pickedDateTime == null ? '' : pickedDateTime.toDDMMYYYYY;
  }
}
