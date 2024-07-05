import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String id;
  final String title;
  final String description;
  final String date;
  bool? isDone;
  bool? isDeleted;
  bool? isFavourite;

  Task({
    required this.title,
    required this.id,
    required this.description,
    required this.date,
    this.isDone,
    this.isDeleted,
    this.isFavourite,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavourite = isFavourite ?? false;
  }

  Task copyWith({
    String? title,
    String? id,
    String? date,
    bool? isDone,
    bool? isDeleted,
    String? description,
    bool? isFavourite,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      id: id ?? this.id,
      date: date ?? this.date,
      isFavourite: isFavourite ?? this.isFavourite,
      isDone: isDone ?? this.isDone,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'id': id,
      'date': date,
      'description': description,
      'isDone': isDone,
      'isDeleted': isDeleted,
      'isFavourite': isFavourite,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      id: map['id'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isFavourite:
          map['isFavourite'] != null ? map['isFavourite'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        id,
        description,
        date,
        isDone,
        isDeleted,
        isFavourite,
      ];
}
