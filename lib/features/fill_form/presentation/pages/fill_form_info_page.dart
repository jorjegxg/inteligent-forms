import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/shared_widgets/app_sized_boxes.dart';
import 'package:inteligent_forms/core/shared_widgets/my_button.dart';
import 'package:inteligent_forms/core/shared_widgets/my_snack_bar.dart';
import 'package:inteligent_forms/features/create_form/domain/entities/field.dart';
import 'package:inteligent_forms/features/fill_form/domain/entities/section_with_field.dart';
import 'package:inteligent_forms/features/fill_form/presentation/bloc/fill_content_bloc/bloc/fill_content_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_number_constants.dart';
import '../../../../core/constants/font_constants.dart';
import '../../../../core/utils/lists.dart';
import '../bloc/fill_content_bloc/bloc/fill_content_event.dart';
import '../bloc/fill_content_bloc/bloc/fill_content_state.dart';
import '../widgets/picture_or_camera_pop_up.dart';

TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();

class FillFormInfoPage extends StatefulWidget {
  const FillFormInfoPage({
    super.key,
    required this.listOfSections,
    required this.formId,
  });

  final List<SectionWithField> listOfSections;
  final String formId;

  @override
  State<FillFormInfoPage> createState() => _FillFormInfoPageState();
}

class _FillFormInfoPageState extends State<FillFormInfoPage> {
  @override
  void initState() {
    String concatinatedString = "";
    for (final SectionWithField section in widget.listOfSections) {
      concatinatedString += "${section.content}\n\n";
    }

    log('in init concatinatedString $concatinatedString');

    context.read<FillContentBloc>().add(
          ChangeSectionsContent(
            sectionsContent: concatinatedString,
          ),
        );
  }

  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<FillContentBloc, FillContentState>(
      listenWhen: (previous, current) =>
          previous.errorMessage != current.errorMessage,
      listener: (context, state) {
        if (state.errorMessage.isNotEmpty) {
          showMySnackBar(context, state.errorMessage);
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppNumberConstants.longTilePadding,
            vertical: AppNumberConstants.pageVerticalPadding,
          ),
          child: Column(
            children: [
              BlocBuilder<FillContentBloc, FillContentState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    );
                  }
                  return FormBuilder(
                    initialValue: state.parametersMap,
                    key: formKey,
                    onChanged: () {
                      formKey.currentState!.save();
                      log('formKey.currentState!.value  ${formKey.currentState!.value}');
                    },
                    child: Column(
                      children: [
                        for (final SectionWithField section
                            in widget.listOfSections)
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Section ${section.sectionNumber}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: FontConstants.largeFontSize,
                                          color: Colors.white,
                                        ),
                                  ),
                                  MyButton(
                                    width: 0,
                                    text: AppStringConstants.scanDocs,
                                    onPressed: () async {
                                      showPictureOrCameraPopUp(
                                        context,
                                        onCameraPressed: () {
                                          context.read<FillContentBloc>().add(
                                                UploadFileEvent(
                                                  ImageSource.camera,
                                                  section,
                                                ),
                                              );
                                        },
                                        onPhotoGalleryPressed: () {
                                          context.read<FillContentBloc>().add(
                                                UploadFileEvent(
                                                  ImageSource.gallery,
                                                  section,
                                                ),
                                              );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                              AppSizedBoxes.kMediumBox(),
                              for (final Field field in section.fields)
                                Column(
                                  children: [
                                    if (field.fieldType ==
                                            FieldTypeConstants.number ||
                                        field.fieldType ==
                                            FieldTypeConstants.decimal)
                                      FormBuilderTextField(
                                        name: field.placeholderKeyWord,
                                        validator: (value) {
                                          if (field.mandatory == true &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return 'Please select at least one option';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              AppNumberConstants
                                                  .longTilePadding,
                                            ),
                                          ),
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          filled: true,
                                          hintText: field.label,
                                        ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    if (field.fieldType ==
                                        FieldTypeConstants.date)
                                      FormBuilderDateTimePicker(
                                        name: field.placeholderKeyWord,
                                        inputType: InputType.date,
                                        format: DateFormat("yyyy-MM-dd"),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              AppNumberConstants
                                                  .longTilePadding,
                                            ),
                                          ),
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          filled: true,
                                          hintText: field.label,
                                        ),
                                        validator: (value) {
                                          if (field.mandatory == true &&
                                              value == null) {
                                            return 'Please select at least one option';
                                          }
                                          return null;
                                        },
                                      ),
                                    if (field.fieldType ==
                                        FieldTypeConstants.text)
                                      FormBuilderTextField(
                                        name: field.placeholderKeyWord,
                                        validator: (value) {
                                          if (field.mandatory == true &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return 'Please select at least one option';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              AppNumberConstants
                                                  .longTilePadding,
                                            ),
                                          ),
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          filled: true,
                                          hintText: field.label,
                                        ),
                                      ),
                                    if (field.fieldType ==
                                        FieldTypeConstants.singleChoice)
                                      FormBuilderDropdown(
                                        name: field.placeholderKeyWord,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                              AppNumberConstants
                                                  .longTilePadding,
                                            ),
                                          ),
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          filled: true,
                                          hintText: field.label,
                                        ),
                                        validator: (value) {
                                          if (field.mandatory == true &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return 'Please select at least one option';
                                          }
                                          return null;
                                        },
                                        items: field.options!
                                            .map((option) => DropdownMenuItem(
                                                  value: option,
                                                  child: Text(option),
                                                ))
                                            .toList(),
                                      ),
                                    if (field.fieldType ==
                                        FieldTypeConstants.multipleChoice)
                                      FormBuilderCheckboxGroup(
                                        name: field.placeholderKeyWord,
                                        validator: (value) {
                                          if (field.mandatory == true &&
                                              (value == null ||
                                                  value.isEmpty)) {
                                            return 'Please select at least one option';
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                            left: AppNumberConstants
                                                .longTilePadding,
                                            right: AppNumberConstants
                                                .longTilePadding,
                                          ),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          labelText: field.label,
                                          labelStyle: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .copyWith(
                                                fontSize:
                                                    FontConstants.largeFontSize,
                                                color: Colors.grey.shade400,
                                              ),
                                        ),
                                        options: field.options!
                                            .map((option) =>
                                                FormBuilderFieldOption(
                                                  value: option,
                                                  child: Text(option),
                                                ))
                                            .toList(),
                                      ),
                                    AppSizedBoxes.kSmallBox(),
                                  ],
                                ),
                            ],
                          ),
                        AppSizedBoxes.kMediumBox(),
                        MyButton(
                          text: AppStringConstants.saveFields,
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.saveAndValidate()) {
                              context.read<FillContentBloc>().add(
                                    ChangeParametersMap(
                                      parametersMap:
                                          formKey.currentState!.value,
                                    ),
                                  );
                            }
                          },
                        )
                      ],
                    ),
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
