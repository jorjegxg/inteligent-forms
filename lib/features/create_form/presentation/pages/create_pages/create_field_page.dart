import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/core/background_widgets/create_field_background_widget.dart';
import 'package:inteligent_forms/core/constants/app_number_constants.dart';
import 'package:inteligent_forms/core/shared_widgets/app_sized_boxes.dart';

import '../../../../../core/constants/font_constants.dart';
import '../../../../../core/constants/string_constants.dart';
import '../../../domain/entities/field.dart';
import '../../bloc/create_field_bloc/create_field_bloc.dart';
import '../../widgets/create_field_button.dart';
import '../../widgets/documents_keywords_chips.dart';
import '../../widgets/field_type_dropdown.dart';
import '../../widgets/is_mandatory_checkbox.dart';
import '../../widgets/key_word_text_field.dart';
import '../../widgets/label_text_field.dart';
import '../../widgets/new_options_chips.dart';

class CreateFieldPage extends StatefulWidget {
  const CreateFieldPage({
    super.key,
    this.field,
  });

  final Field? field;

  @override
  State<CreateFieldPage> createState() => _CreateFieldPageState();
}

class _CreateFieldPageState extends State<CreateFieldPage> {
  late TextEditingController labelController;
  late TextEditingController placeholderKeywordController;
  TextEditingController docsKeywordsController = TextEditingController();
  TextEditingController optionsKeywordsController = TextEditingController();

  @override
  void initState() {
    labelController = TextEditingController(
      text: context.read<CreateFieldBloc>().state.label,
    );
    placeholderKeywordController = TextEditingController(
      text: context.read<CreateFieldBloc>().state.placeholderKeyWord,
    );

    super.initState();
  }

  @override
  void dispose() {
    labelController.dispose();
    placeholderKeywordController.dispose();
    docsKeywordsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CreateFieldBackGroundWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: const Text(AppCreateFormString.createField),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                left: AppNumberConstants.pageHorizontalPadding,
                right: AppNumberConstants.pageHorizontalPadding,
                top: AppNumberConstants.pageVerticalPadding,
                bottom: AppNumberConstants.bottomPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSizedBoxes.kSmallBox(),
                  LabelTextField(
                    labelController: labelController,
                  ),
                  AppSizedBoxes.kSmallBox(),
                  KeyWordTextField(
                    keywordController: placeholderKeywordController,
                  ),
                  AppSizedBoxes.kSmallBox(),
                  const IsMandatoryCheckbox(),
                  AppSizedBoxes.kSmallBox(),
                  Text(
                    AppCreateFormString.fieldType,
                    style: TextStyle(
                      fontSize: FontConstants.mediumFontSize,
                      color: Colors.white,
                    ),
                  ),
                  AppSizedBoxes.kSmallBox(),
                  const FieldTypeDropdown(),
                  AppSizedBoxes.kSmallBox(),
                  NewOptionsChips(
                    optionsKeywordsController: optionsKeywordsController,
                  ),
                  AppSizedBoxes.kMediumBox(),
                  DocumentKeywordsChips(
                    docsKeywordsController: docsKeywordsController,
                  ),
                  AppSizedBoxes.kMediumBox(),
                  Center(
                    child: CreateFieldButton(
                      isEditMode: widget.field != null,
                      keywordController: placeholderKeywordController,
                      labelController: labelController,
                      keyToBeDeleted: widget.field != null
                          ? widget.field?.placeholderKeyWord
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
