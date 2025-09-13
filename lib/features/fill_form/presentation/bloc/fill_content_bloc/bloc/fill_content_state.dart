import 'package:equatable/equatable.dart';

class FillContentState extends Equatable {
  final Map<String, dynamic> parametersMap;
  final String sectionsContent;
  final bool isLoading;
  final String errorMessage;

  const FillContentState({
    required this.parametersMap,
    required this.sectionsContent,
    this.isLoading = false,
    this.errorMessage = "",
  });

  FillContentState copyWith({
    Map<String, dynamic>? parametersMap,
    String? sectionsContent,
    bool? isLoading,
    String? errorMessage,
  }) {
    return FillContentState(
      parametersMap: parametersMap ?? this.parametersMap,
      sectionsContent: sectionsContent ?? this.sectionsContent,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props =>
      [parametersMap, sectionsContent, isLoading, errorMessage];
}
