import 'dart:convert';
import 'package:flutter/material.dart';

import '../../domain/entities/character.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel({
    required super.image,
    required super.title,
    required super.description,
  });

  CharacterModel copyWith({
    String? image,
    String? title,
    String? description,
  }) {
    return CharacterModel(
      image: image ?? this.image,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'title': title,
      'description': description,
    };
  }

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      image: map['Icon']['URL'] as String,
      title: (map['Text'] as String).split('-').first.trim(),
      description: map['Text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CharacterModel.fromJson(String source) =>
      CharacterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  static Future<List<CharacterModel>> fromJsonCustom(String source) async {
    var decoded = json.decode(source);

    // debugPrint("DECODED: $decoded");

    List<CharacterModel> value =
        await decoded!["RelatedTopics"].map<CharacterModel>((i) {
      var map = i as Map<String, dynamic>;
      // debugPrint("INSTANCE: $map");

      return CharacterModel.fromMap(map);
    }).toList();

    debugPrint("VALUE: $value");

    return value;
  }
}
