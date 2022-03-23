import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'challenge_record.g.dart';

abstract class ChallengeRecord
    implements Built<ChallengeRecord, ChallengeRecordBuilder> {
  static Serializer<ChallengeRecord> get serializer =>
      _$challengeRecordSerializer;

  @nullable
  BuiltList<String> get challenge;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ChallengeRecordBuilder builder) =>
      builder..challenge = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('challenge');

  static Stream<ChallengeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ChallengeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ChallengeRecord._();
  factory ChallengeRecord([void Function(ChallengeRecordBuilder) updates]) =
      _$ChallengeRecord;

  static ChallengeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createChallengeRecordData() => serializers.toFirestore(
    ChallengeRecord.serializer, ChallengeRecord((c) => c..challenge = null));
