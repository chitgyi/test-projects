import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:code_management/app/core/utils/view_model.dart';
import 'package:code_management/app/core/utils/view_state.dart';

class CustomBuilder<T extends ViewModel> extends StatelessWidget {
  const CustomBuilder({
    Key? key,
    required this.onSuccess,
    this.onError,
    this.onLoading,
  }) : super(key: key);
  final Widget Function()? onLoading;
  final Widget Function(T viewModel)? onError;
  final Widget Function(T viewModel) onSuccess;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      init: Get.find<T>(),
      builder: (viewModel) {
        if (viewModel.viewState == ViewState.completed) {
          return onSuccess(viewModel);
        }

        if (viewModel.viewState == ViewState.error) {
          return onError == null
              ? Center(
                  child: Text(viewModel.errorMessage ?? "An error occurred"),
                )
              : onError!(viewModel);
        }

        return onLoading == null
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : onLoading!();
      },
    );
  }
}
