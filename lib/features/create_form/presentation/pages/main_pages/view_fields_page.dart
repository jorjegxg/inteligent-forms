import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/core/shared_widgets/my_delete_slidable.dart';
import 'package:inteligent_forms/core/shared_widgets/my_edit_slidable.dart';
import 'package:inteligent_forms/core/shared_widgets/my_slidable.dart';
import 'package:inteligent_forms/features/create_form/presentation/bloc/create_field_bloc/create_field_bloc.dart';
import 'package:inteligent_forms/features/create_form/presentation/pages/create_pages/create_field_page.dart';
import 'package:inteligent_forms/features/create_form/presentation/widgets/field_card.dart';

import '../../../../../core/constants/app_number_constants.dart';
import '../../bloc/create_field_bloc/create_field_event.dart';
import '../../bloc/create_form_bloc/create_form_bloc.dart';
import '../../bloc/create_form_bloc/create_form_event.dart';
import '../../bloc/create_form_bloc/create_form_state.dart';

class ViewFieldPage extends StatefulWidget {
  const ViewFieldPage({super.key});

  @override
  State<ViewFieldPage> createState() => _ViewFieldPageState();
}

class _ViewFieldPageState extends State<ViewFieldPage> {
  void addField() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateFieldPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        heroTag: 'view_fields_page',
        onPressed: addField,
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<CreateFormBloc, CreateFormState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
              top: AppNumberConstants.pageVerticalPadding,
            ),
            child: ListView.builder(
              itemCount: state.fields.length,
              itemBuilder: (BuildContext context, int index) {
                return MySlidable(
                  actions: [
                    MyEditSlidable(
                      onPressed: () {
                        context.read<CreateFieldBloc>().add(
                              CreateFieldEdit(
                                field: state.fields[index],
                              ),
                            );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateFieldPage(
                              field: state.fields[index],
                            ),
                          ),
                        );
                      },
                    ),
                    MyDeleteSlidable(
                      onPressed: () {
                        context.read<CreateFormBloc>().add(
                              RemoveFieldEvent(
                                placeholderKeyWord:
                                    state.fields[index].placeholderKeyWord,
                              ),
                            );
                      },
                    )
                  ],
                  child: FieldCard(
                    field: state.fields[index],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
