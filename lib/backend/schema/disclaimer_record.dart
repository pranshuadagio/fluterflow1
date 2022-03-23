import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'disclaimer_record.g.dart';

abstract class DisclaimerRecord
    implements Built<DisclaimerRecord, DisclaimerRecordBuilder> {
  static Serializer<DisclaimerRecord> get serializer =>
      _$disclaimerRecordSerializer;

  @nullable
  bool get confirm;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DisclaimerRecordBuilder builder) =>
      builder..confirm = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('disclaimer');

  static Stream<DisclaimerRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DisclaimerRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DisclaimerRecord._();
  factory DisclaimerRecord([void Function(DisclaimerRecordBuilder) updates]) =
      _$DisclaimerRecord;

  static DisclaimerRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDisclaimerRecordData({
  bool confirm,
}) =>
    serializers.toFirestore(DisclaimerRecord.serializer,
        DisclaimerRecord((d) => d..confirm = confirm));
