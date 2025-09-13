import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../domain/entities/section_with_field.dart';

abstract class FillContentEvent extends Equatable {
  const FillContentEvent();

  @override
  List<Object> get props => [];
}

class ChangeSectionsContent extends FillContentEvent {
  final String sectionsContent;
  const ChangeSectionsContent({
    required this.sectionsContent,
  });

  @override
  List<Object> get props => [sectionsContent];
}

class ChangeParametersMap extends FillContentEvent {
  final Map<String, dynamic> parametersMap;
  const ChangeParametersMap({
    required this.parametersMap,
  });

  @override
  List<Object> get props => [parametersMap];
}

class ResetFillContent extends FillContentEvent {}

// class AutoFillContent extends FillContentEvent {
//   final SectionWithField sectionWithField;

//   const AutoFillContent({
//     required this.sectionWithField,
//   });

//   @override
//   List<Object> get props => [sectionWithField];
// }

class UploadFileEvent extends FillContentEvent {
  final ImageSource imageSource;
  final SectionWithField section;

  const UploadFileEvent(this.imageSource, this.section);

  @override
  List<Object> get props => [imageSource, section];
}
