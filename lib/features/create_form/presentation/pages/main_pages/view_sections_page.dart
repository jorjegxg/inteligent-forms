import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/core/shared_widgets/my_delete_slidable.dart';
import 'package:inteligent_forms/features/create_form/presentation/pages/create_pages/create_section_page.dart';
import 'package:inteligent_forms/features/create_form/presentation/widgets/section_card.dart';

import '../../../../../core/constants/app_number_constants.dart';
import '../../../../../core/shared_widgets/my_slidable.dart';
import '../../bloc/create_form_bloc/create_form_bloc.dart';
import '../../bloc/create_form_bloc/create_form_event.dart';
import '../../bloc/create_form_bloc/create_form_state.dart';

class ViewSectionsPage extends StatefulWidget {
  const ViewSectionsPage({super.key});

  @override
  State<ViewSectionsPage> createState() => _ViewSectionsPageState();
}

class _ViewSectionsPageState extends State<ViewSectionsPage> {
  void addSection() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateSectionPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      floatingActionButton: FloatingActionButton(
        heroTag: 'view_sections_page',
        onPressed: addSection,
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: AppNumberConstants.pageVerticalPadding,
        ),
        child: BlocBuilder<CreateFormBloc, CreateFormState>(
          builder: (context, state) {
            return ListView.builder(
              //Should be a list of sections
              itemCount: state.sections.length,
              itemBuilder: (BuildContext context, int index) {
                return MySlidable(
                  actions: [
                    MyDeleteSlidable(
                      onPressed: () {
                        context.read<CreateFormBloc>().add(
                              DeleteSectionEvent(
                                sectionNumber: index,
                              ),
                            );
                      },
                    ),
                  ],
                  child: SectionCard(
                    section: state.sections[index],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
