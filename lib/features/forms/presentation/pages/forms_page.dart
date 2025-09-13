import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/core/constants/app_number_constants.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/shared_widgets/my_alert_dialog.dart';
import 'package:inteligent_forms/core/shared_widgets/my_delete_slidable.dart';
import 'package:inteligent_forms/core/shared_widgets/my_slidable.dart';
import 'package:inteligent_forms/features/forms/presentation/widgets/form_tile.dart';

import '../../../../core/background_widgets/create_field_background_widget.dart';
import '../../../../core/shared_widgets/my_snack_bar.dart';
import '../../../create_form/presentation/pages/form_tab_controler_page.dart';
import '../bloc/forms_bloc.dart';

class FormsPage extends StatelessWidget {
  const FormsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CreateFieldBackGroundWidget(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(AppStringConstants.forms),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const FormTabController(),
                ),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          body: BlocListener<FormsBloc, FormsState>(
            listener: (context, state) {
              if (state is FormsError) {
                showMySnackBar(context, state.message);
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppNumberConstants.pageHorizontalPadding,
                  vertical: AppNumberConstants.pageVerticalPadding,
                ),
                child: BlocBuilder<FormsBloc, FormsState>(
                  builder: (context, state) {
                    if (state is FormsLoadingState) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      );
                    }
                    if (state is FormsLoaded) {
                      return Column(
                        children: [
                          const SizedBox(
                            width: double.infinity,
                          ),
                          ...state.formEntities.map(
                            (formEntity) => MySlidable(
                              actions: [
                                MyDeleteSlidable(
                                  onPressed: () {
                                    showMyDialog(
                                      context,
                                      title: AppStringConstants.deleteForm,
                                      content:
                                          AppStringConstants.deleteFormContent,
                                      onPressed: () {
                                        context.read<FormsBloc>().add(
                                              FormsDeleteEvent(
                                                formEntity: formEntity,
                                              ),
                                            );
                                      },
                                    );
                                  },
                                ),
                              ],
                              child: FormTile(
                                formEntity: formEntity,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
