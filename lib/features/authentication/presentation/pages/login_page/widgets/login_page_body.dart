import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:inteligent_forms/core/constants/app_number_constants.dart';
import 'package:inteligent_forms/core/constants/font_constants.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/shared_widgets/my_text_button.dart';
import 'package:inteligent_forms/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/shared_widgets/my_button.dart';
import '../../../../../../core/shared_widgets/my_text_field.dart';
import '../../../bloc/authentication_bloc/authentication_state.dart';
import '../../sign_up_page/sign_up_page.dart';

class LoginPageBody extends HookWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppNumberConstants.pageHorizontalPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              Text(
                '${AppStringConstants.intelligent}\n${AppStringConstants.forms}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: FontConstants.largeFontSize,
                    ),
              ),
              SizedBox(
                height: 20.h,
              ),
              MyTextField(
                controller: emailController,
                hintText: AppStringConstants.email,
              ),
              SizedBox(
                height: 2.h,
              ),
              MyTextField(
                controller: passwordController,
                hintText: AppStringConstants.password,
                isPassword: true,
              ),
              SizedBox(
                height: 5.h,
              ),
              MyTextButton(
                text: AppStringConstants.signUp,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpPage(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 5.h,
              ),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return MyButton(
                    color: Theme.of(context).colorScheme.secondary,
                    isLoading: state is LoadingState,
                    text: AppStringConstants.login,
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(
                            LoginStarted(
                              emailAddress: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
