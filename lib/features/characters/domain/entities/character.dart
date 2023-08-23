// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final String image;
  final String title;
  final String description;

  const CharacterEntity({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [image, title, description];

  @override
  bool get stringify => true;
}
