import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'payment_record.g.dart';

abstract class PaymentRecord
    implements Built<PaymentRecord, PaymentRecordBuilder> {
  static Serializer<PaymentRecord> get serializer => _$paymentRecordSerializer;

  @nullable
  BuiltList<int> get code;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PaymentRecordBuilder builder) =>
      builder..code = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payment');

  static Stream<PaymentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PaymentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PaymentRecord._();
  factory PaymentRecord([void Function(PaymentRecordBuilder) updates]) =
      _$PaymentRecord;

  static PaymentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPaymentRecordData() => serializers.toFirestore(
    PaymentRecord.serializer, PaymentRecord((p) => p..code = null));
