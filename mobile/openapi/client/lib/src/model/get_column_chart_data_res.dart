//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/services_column_chart_category_data.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_column_chart_data_res.g.dart';

/// GetColumnChartDataRes
///
/// Properties:
/// * [expenseData] 
/// * [incomeData] 
@BuiltValue()
abstract class GetColumnChartDataRes implements Built<GetColumnChartDataRes, GetColumnChartDataResBuilder> {
  @BuiltValueField(wireName: r'expenseData')
  BuiltList<ServicesColumnChartCategoryData> get expenseData;

  @BuiltValueField(wireName: r'incomeData')
  BuiltList<ServicesColumnChartCategoryData> get incomeData;

  GetColumnChartDataRes._();

  factory GetColumnChartDataRes([void updates(GetColumnChartDataResBuilder b)]) = _$GetColumnChartDataRes;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetColumnChartDataResBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetColumnChartDataRes> get serializer => _$GetColumnChartDataResSerializer();
}

class _$GetColumnChartDataResSerializer implements PrimitiveSerializer<GetColumnChartDataRes> {
  @override
  final Iterable<Type> types = const [GetColumnChartDataRes, _$GetColumnChartDataRes];

  @override
  final String wireName = r'GetColumnChartDataRes';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetColumnChartDataRes object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'expenseData';
    yield serializers.serialize(
      object.expenseData,
      specifiedType: const FullType(BuiltList, [FullType(ServicesColumnChartCategoryData)]),
    );
    yield r'incomeData';
    yield serializers.serialize(
      object.incomeData,
      specifiedType: const FullType(BuiltList, [FullType(ServicesColumnChartCategoryData)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GetColumnChartDataRes object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetColumnChartDataResBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'expenseData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ServicesColumnChartCategoryData)]),
          ) as BuiltList<ServicesColumnChartCategoryData>;
          result.expenseData.replace(valueDes);
          break;
        case r'incomeData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ServicesColumnChartCategoryData)]),
          ) as BuiltList<ServicesColumnChartCategoryData>;
          result.incomeData.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetColumnChartDataRes deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetColumnChartDataResBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

