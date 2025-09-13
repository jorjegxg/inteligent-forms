import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/core/background_widgets/create_form_background_widget.dart';
import 'package:inteligent_forms/core/shared_widgets/my_snack_bar.dart';
import 'package:inteligent_forms/features/create_form/presentation/bloc/create_form_bloc/create_form_event.dart';
import 'package:inteligent_forms/features/create_form/presentation/pages/main_pages/view_fields_page.dart';
import 'package:inteligent_forms/features/create_form/presentation/pages/main_pages/view_sections_page.dart';

import '../../../../core/constants/string_constants.dart';
import '../bloc/create_form_bloc/create_form_bloc.dart';
import '../bloc/create_form_bloc/create_form_state.dart';
import 'main_pages/create_form_page.dart';

class FormTabController extends StatefulWidget {
  const FormTabController({super.key});

  @override
  State<FormTabController> createState() => _FormTabControllerState();
}

class _FormTabControllerState extends State<FormTabController> {
  final index = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CreateFormBackGroundWidget(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                AppCreateFormString.createForm,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              backgroundColor: Colors.transparent,
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: AppCreateFormString.formDetailes,
                  ),
                  Tab(
                    text: AppCreateFormString.section,
                  ),
                  Tab(
                    text: AppCreateFormString.field,
                  ),
                ],
              ),
            ),
            body: BlocListener<CreateFormBloc, CreateFormState>(
              listenWhen: (previous, current) =>
                  current.status == CreateFormStatus.error,
              listener: (context, state) {
                showMySnackBar(
                  context,
                  state.error,
                );
              },
              child: BlocListener<CreateFormBloc, CreateFormState>(
                listenWhen: (previous, current) =>
                    previous.status != current.status &&
                    current.status == CreateFormStatus.success,
                listener: (context, state) {
                  if (state.status == CreateFormStatus.success) {
                    context.read<CreateFormBloc>().add(
                          ResetCreateForm(),
                        );

                    Navigator.of(context).pop();
                  }
                },
                child: const TabBarView(
                  children: [
                    CreateFormPage(),
                    ViewSectionsPage(),
                    ViewFieldPage(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
