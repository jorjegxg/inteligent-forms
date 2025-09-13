import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/core/constants/app_number_constants.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/shared_widgets/app_sized_boxes.dart';
import 'package:inteligent_forms/core/shared_widgets/my_button.dart';
import 'package:inteligent_forms/core/shared_widgets/my_snack_bar.dart';
import 'package:inteligent_forms/features/fill_form/presentation/bloc/fill_form_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/constants/font_constants.dart';
import '../../../../core/utils/functions.dart';
import '../bloc/fill_content_bloc/bloc/fill_content_bloc.dart';
import '../bloc/fill_content_bloc/bloc/fill_content_state.dart';
import '../bloc/fill_form_state.dart';

class PreviewDocumentPage extends StatelessWidget {
  PreviewDocumentPage({
    super.key,
    required this.formId,
    //required this.section
  });
  // final SectionWithField section;
  //Todo: add section to constructor
  final String formId;
  String content = "";
  @override
  Widget build(BuildContext context) {
    return BlocListener<FillFormBloc, FillFormState>(
      listener: (context, state) {
        if (state is AddSubmissionLoadedState) {
          Navigator.of(context).pop();
        }

        if (state is FillFormErrorState) {
          showMySnackBar(context, state.message);
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            AppSizedBoxes.kMediumBox(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(
                          AppNumberConstants.pageVerticalPadding),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "DOCUMENT",
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: FontConstants.largeFontSize,
                                color: const Color(0xFF00446A),
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ),
              ],
            ),
            AppSizedBoxes.kMediumBox(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
              ),
              height: 50.h,
              width: 80.w,
              child: BlocBuilder<FillContentBloc, FillContentState>(
                builder: (context, state) {
                  log("state.parametersMap: ${state.parametersMap}");
                  log("state.sectionsContent: ${state.sectionsContent}");

                  content = replaceWithString(
                    state.parametersMap,
                    state.sectionsContent,
                  );

                  return Text(
                    content,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: FontConstants.smallFontSize,
                          color: const Color(0xFF00446A),
                          fontWeight: FontWeight.bold,
                        ),
                  );
                },
              ),
            ),
            AppSizedBoxes.kMediumBox(),
            BlocBuilder<FillContentBloc, FillContentState>(
              builder: (context, stateContent) {
                return BlocBuilder<FillFormBloc, FillFormState>(
                  builder: (context, formState) {
                    return MyButton(
                      isLoading: formState is FillFormLoadingState,
                      width: 50.w,
                      color: Theme.of(context).colorScheme.secondary,
                      text: AppCreateFormString.submitForm,
                      onPressed: () {
                        context.read<FillFormBloc>().add(
                              AddSumbisionEvent(
                                formId: formId,
                                content: content,
                                dateWhenSubmited: DateTime.now(),
                                dateToBeDeleted: DateTime.now().add(
                                  const Duration(days: 7),
                                ),
                                listOfFields: [
                                  for (int i = 0;
                                      i <
                                              stateContent
                                                  .parametersMap.keys.length &&
                                          i < 5;
                                      i++)
                                    stateContent.parametersMap.values
                                                .elementAt(i)
                                                .runtimeType ==
                                            DateTime
                                        ? stateContent.parametersMap.values
                                            .elementAt(i)
                                            .toString()
                                            .substring(0, 10)
                                        : "${stateContent.parametersMap.values.elementAt(i)}"
                                ],
                              ),
                            );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
