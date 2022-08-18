/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields

import 'package:serverpod_client/serverpod_client.dart';
import 'dart:typed_data';
import 'protocol.dart';

class Todo extends SerializableEntity {
  @override
  String get className => 'Todo';

  int? id;
  late String title;
  late String des;
  late bool isComplete;

  Todo({
    this.id,
    required this.title,
    required this.des,
    required this.isComplete,
  });

  Todo.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    title = _data['title']!;
    des = _data['des']!;
    isComplete = _data['isComplete']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'title': title,
      'des': des,
      'isComplete': isComplete,
    });
  }
}
