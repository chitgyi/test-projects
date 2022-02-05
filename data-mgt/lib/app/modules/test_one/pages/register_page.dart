import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/app/core/widgets/custom_button.dart';
import 'package:interview/app/core/widgets/custom_dropdown.dart';
import 'package:interview/app/core/widgets/switch_bar.dart';
import 'package:interview/app/modules/test_one/view_models/register_view_model.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<RegisterViewModel>(
        init: Get.find<RegisterViewModel>(),
        builder: (viewModel) => SingleChildScrollView(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Header(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 14.0,
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: viewModel.firstNameController,
                        validator: viewModel.firstNameValidator,
                        decoration: const InputDecoration(
                          hintText: 'First Name *',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      const SizedBox(height: 14.0),
                      TextFormField(
                        controller: viewModel.lastNameController,
                        validator: viewModel.lastNameValidator,
                        decoration: const InputDecoration(
                          hintText: 'Last Name *',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      const SizedBox(height: 14.0),
                      TextFormField(
                        controller: viewModel.emailController,
                        validator: viewModel.emailValidator,
                        decoration: const InputDecoration(
                          hintText: 'Email Address *',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      const SizedBox(height: 14.0),
                      TextFormField(
                        controller: viewModel.nationalityController,
                        validator: viewModel.nationalityValidator,
                        decoration: const InputDecoration(
                          hintText: 'Nationality *',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                      const SizedBox(height: 14.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: viewModel.dobController,
                              validator: viewModel.dobValidator,
                              readOnly: true,
                              onTap: viewModel.onTapDob,
                              decoration: const InputDecoration(
                                hintText: 'Date of Birth *',
                                suffixIcon: Icon(Icons.date_range),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: SwitchBar(
                              items: const ['Female', 'Male'],
                              onSelected: viewModel.onSelectedGender,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 14.0),
                      CustomDropDown(
                        validator: viewModel.countryValidator,
                        items: viewModel.countryStrings,
                        hintText: 'Country of Residence *',
                        onSelected: viewModel.onSelectedCountry,
                      ),
                      const SizedBox(height: 14.0),
                      TextFormField(
                        controller: viewModel.phController,
                        readOnly: viewModel.selectedCountry == null,
                        validator: viewModel.phoneValidator,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Mobile Number (Optinal)',
                          prefixIcon: viewModel.selectedCountry != null
                              ? Padding(
                                  child: Text(viewModel
                                      .selectedCountry!.prefixPhoneCode),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 14.0),
                                )
                              : null,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  child: CustomButton(
                    onTap: viewModel.onSubmit,
                    text: 'Create my account now',
                    gradient: const LinearGradient(colors: [
                      Color(0xFF0AB4C5),
                      Color(0xFF30759E),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(Icons.arrow_back_ios),
          ),
          const SizedBox(height: 16.0),
          Text(
            "Almost There!",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 14.0),
          Text(
            "Complete the form below to create your Rady to Travel account",
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(height: 8.0),
          Text(
            "*Mandatory",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.grey,
                ),
          )
        ],
      ),
    );
  }
}
