import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/core/background_widgets/create_form_background_widget.dart';
import 'package:inteligent_forms/core/constants/app_number_constants.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/shared_widgets/app_sized_boxes.dart';
import 'package:inteligent_forms/core/shared_widgets/my_button.dart';
import 'package:inteligent_forms/core/shared_widgets/my_text_field.dart';
import 'package:inteligent_forms/features/create_form/domain/entities/section.dart';
import 'package:inteligent_forms/features/create_form/presentation/bloc/create_form_bloc/create_form_bloc.dart';
import 'package:inteligent_forms/features/create_form/presentation/bloc/cubit/document_type_cubit.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/constants/font_constants.dart';
import '../../../../../core/utils/lists.dart';
import '../../bloc/create_form_bloc/create_form_event.dart';
import '../../bloc/cubit/document_type_state.dart';

class CreateSectionPage extends StatefulWidget {
  const CreateSectionPage({
    super.key,
  });

  @override
  State<CreateSectionPage> createState() => _CreateSectionPageState();
}

class _CreateSectionPageState extends State<CreateSectionPage> {
  TextEditingController contentController = TextEditingController();

  @override
  void dispose() {
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const CreateFormBackGroundWidget(),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            // backgroundColor: Colors.transparent,
            title: const Text(AppCreateFormString.createSection),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppNumberConstants.pageHorizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    AppCreateFormString.scanDocType,
                    style: TextStyle(
                        fontSize: FontConstants.largeFontSize,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  InputDecorator(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                    ),
                    child: BlocBuilder<DocumentTypeCubit, DocumentTypeState>(
                      builder: (context, state) {
                        return DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            menuMaxHeight: 30.h,
                            value: state.dropdownValue,
                            icon: const Icon(Icons.arrow_downward),
                            onChanged: (String? value) {
                              context
                                  .read<DocumentTypeCubit>()
                                  .changeDropdownValue(value!);
                            },
                            items: scanDocumentTypeList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ),
                                )
                                .toList(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    AppCreateFormString.sectionContent,
                    style: TextStyle(
                        fontSize: FontConstants.largeFontSize,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  MyTextField(
                    textInputAction: TextInputAction.newline,
                    textAlign: TextAlign.start,
                    maxLines: 10,
                    width: 95.w,
                    controller: contentController,
                    hintText: AppCreateFormString.sectionContent,
                  ),
                  AppSizedBoxes.kMediumBox(),
                  Center(
                    child: MyButton(
                      text: AppCreateFormString.createSection,
                      color: Theme.of(context).colorScheme.secondary,
                      width: 90.w,
                      onPressed: () {
                        context.read<CreateFormBloc>().add(
                              AddSection(
                                section: Section(
                                  content: contentController.text,
                                  scanType: context
                                      .read<DocumentTypeCubit>()
                                      .state
                                      .dropdownValue,
                                  sectionNumber: context
                                      .read<CreateFormBloc>()
                                      .state
                                      .sections
                                      .length,
                                ),
                              ),
                            );
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
