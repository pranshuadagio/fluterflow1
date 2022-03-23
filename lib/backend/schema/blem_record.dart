import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'blem_record.g.dart';

abstract class BlemRecord implements Built<BlemRecord, BlemRecordBuilder> {
  static Serializer<BlemRecord> get serializer => _$blemRecordSerializer;

  @nullable
  int get progress;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BlemRecordBuilder builder) =>
      builder..progress = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BLEM');

  static Stream<BlemRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BlemRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BlemRecord._();
  factory BlemRecord([void Function(BlemRecordBuilder) updates]) = _$BlemRecord;

  static BlemRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBlemRecordData({
  int progress,
}) =>
    serializers.toFirestore(
        BlemRecord.serializer, BlemRecord((b) => b..progress = progress));
