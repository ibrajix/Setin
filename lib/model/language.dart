import 'package:equatable/equatable.dart';

class Language extends Equatable {

  int id;
  String name;
  bool isSelected;

  Language({
    required this.id, required this.name, required this.isSelected,
  });

  @override
  List<Object?> get props => [id, name, isSelected];

  void languageSelected(){
    isSelected = true;
  }

}