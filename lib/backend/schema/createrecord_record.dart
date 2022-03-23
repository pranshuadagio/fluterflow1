import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'createrecord_record.g.dart';

abstract class CreaterecordRecord
    implements Built<CreaterecordRecord, CreaterecordRecordBuilder> {
  static Serializer<CreaterecordRecord> get serializer =>
      _$createrecordRecordSerializer;

  @nullable
  DateTime get appointmentTime;

  @nullable
  String get appointmentName;

  @nullable
  double get appointmentDescription;

  @nullable
  String get appointmentEmail;

  @nullable
  String get appointmentType;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CreaterecordRecordBuilder builder) => builder
    ..appointmentName = ''
    ..appointmentDescription = 0.0
    ..appointmentEmail = ''
    ..appointmentType = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('createrecord');

  static Stream<CreaterecordRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CreaterecordRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CreaterecordRecord._();
  factory CreaterecordRecord(
          [void Function(CreaterecordRecordBuilder) updates]) =
      _$CreaterecordRecord;

  static CreaterecordRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCreaterecordRecordData({
  DateTime appointmentTime,
  String appointmentName,
  double appointmentDescription,
  String appointmentEmail,
  String appointmentType,
}) =>
    serializers.toFirestore(
        CreaterecordRecord.serializer,
        CreaterecordRecord((c) => c
          ..appointmentTime = appointmentTime
          ..appointmentName = appointmentName
          ..appointmentDescription = appointmentDescription
          ..appointmentEmail = appointmentEmail
          ..appointmentType = appointmentType));
