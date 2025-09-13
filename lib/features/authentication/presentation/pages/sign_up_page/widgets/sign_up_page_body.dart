import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/shared_widgets/my_button.dart';
import 'package:inteligent_forms/core/shared_widgets/my_text_button.dart';
import 'package:inteligent_forms/core/shared_widgets/my_text_field.dart';
import 'package:inteligent_forms/core/utils/lists.dart';
import 'package:inteligent_forms/features/authentication/presentation/pages/login_page/login_page.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constants/app_number_constants.dart';
import '../../../../../../core/shared_widgets/app_sized_boxes.dart';
import '../../../bloc/account_type_bloc.dart/bloc/account_type_bloc.dart';
import '../../../bloc/account_type_bloc.dart/bloc/account_type_state.dart';
import '../../../bloc/authentication_bloc/authentication_bloc.dart';
import '../../../bloc/authentication_bloc/authentication_state.dart';
import 'account_type_dropdown.dart';

class SignUpPageBody extends HookWidget {
  const SignUpPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final addressController = useTextEditingController();
    final fiscalCodeController = useTextEditingController();

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppNumberConstants.pageHorizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              const AccountTypeDropdown(),
              AppSizedBoxes.kSmallBox(),
              BlocBuilder<AccountTypeBloc, AccountTypeState>(
                builder: (context, state) {
                  return MyTextField(
                    textInputAction: TextInputAction.next,
                    controller: nameController,
                    hintText: state.accountType ==
                            AccountTypeConstants.individual
                        ? '${AppStringConstants.name} ${AppStringConstants.unique}'
                        : state.accountType == AccountTypeConstants.company
                            ? '${AppStringConstants.companyName}'
                                ' ${AppStringConstants.unique}'
                            : '${AppStringConstants.institutionName}'
                                ' ${AppStringConstants.unique}',
                  );
                },
              ),
              AppSizedBoxes.kSmallBox(),
              MyTextField(
                controller: emailController,
                hintText: AppStringConstants.email,
              ),
              AppSizedBoxes.kSmallBox(),
              MyTextField(
                controller: passwordController,
                hintText: AppStringConstants.password,
                isPassword: true,
              ),
              AppSizedBoxes.kSmallBox(),
              MyTextField(
                controller: confirmPasswordController,
                hintText: AppStringConstants.confirmPassword,
                isPassword: true,
              ),
              AppSizedBoxes.kSmallBox(),
              MyTextField(
                controller: addressController,
                hintText: AppStringConstants.address,
              ),
              BlocBuilder<AccountTypeBloc, AccountTypeState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      if (state.accountType ==
                          AccountTypeConstants.company) ...[
                        AppSizedBoxes.kSmallBox(),
                        MyTextField(
                          controller: fiscalCodeController,
                          hintText: AppStringConstants.fiscalCode,
                        ),
                      ]
                    ],
                  );
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyTextButton(
                    text: AppStringConstants.login,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<AuthenticationBloc, AuthenticationState>(
                    buildWhen: (previous, current) {
                      return current is LoadingState ||
                          current is SignUpFailureState;
                    },
                    builder: (context, state) {
                      return MyButton(
                        isLoading: state is LoadingState,
                        text: AppStringConstants.signUp,
                        onPressed: () {
                          context.read<AuthenticationBloc>().add(
                                SignUpStarted(
                                  name: nameController.text.trim(),
                                  emailAddress:
                                      emailController.text.toLowerCase().trim(),
                                  password: passwordController.text,
                                  confirmPassword:
                                      confirmPasswordController.text,
                                  fiscalCode: fiscalCodeController.text.trim(),
                                  address: addressController.text.trim(),
                                ),
                              );
                        },
                        width: 30.w,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
