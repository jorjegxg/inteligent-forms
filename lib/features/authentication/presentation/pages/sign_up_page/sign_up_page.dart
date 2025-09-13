import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/features/authentication/presentation/pages/sign_up_page/widgets/sign_up_page_body.dart';

import '../../../../../core/shared_widgets/my_snack_bar.dart';
import '../../bloc/authentication_bloc/authentication_bloc.dart';
import '../../bloc/authentication_bloc/authentication_state.dart';
import '../app_bottom_bar.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is SignUpFailureState) {
            showMySnackBar(context, state.message);
          }
          if (state is SignUpSuccessState) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AppBottomBar(),
                ),
                (route) => false);
          }
        },
        builder: (context, state) {
          return const SignUpPageBody();
        },
      ),
    );
  }
}
