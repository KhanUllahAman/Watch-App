import 'dart:convert';

import 'package:isar/isar.dart';
part 'note_model.g.dart';

@collection
class Note {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  final String title;
  final String description;
  final DateTime lastModified;
  Note({
    required this.id,
    required this.title,
    required this.description,
    required this.lastModified,
  });

  Note copyWith({
    Id? id,
    String? title,
    String? description,
    DateTime? lastModified,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      lastModified: lastModified ?? this.lastModified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'lastModified': lastModified.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      title: map['title'] as String,
      description: map['description'] as String,
      lastModified:
          DateTime.fromMillisecondsSinceEpoch(map['lastModified'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(id: $id, title: $title, description: $description, lastModified: $lastModified)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.lastModified == lastModified;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        lastModified.hashCode;
  }
}
