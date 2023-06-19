//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/column_chart_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'column_chart_category_data.g.dart';

/// ColumnChartCategoryData
///
/// Properties:
/// * [categoryName] 
/// * [columnChartData] 
@BuiltValue()
abstract class ColumnChartCategoryData implements Built<ColumnChartCategoryData, ColumnChartCategoryDataBuilder> {
  @BuiltValueField(wireName: r'categoryName')
  String get categoryName;

  @BuiltValueField(wireName: r'columnChartData')
  BuiltList<ColumnChartData> get columnChartData;

  ColumnChartCategoryData._();

  factory ColumnChartCategoryData([void updates(ColumnChartCategoryDataBuilder b)]) = _$ColumnChartCategoryData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ColumnChartCategoryDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ColumnChartCategoryData> get serializer => _$ColumnChartCategoryDataSerializer();
}

class _$ColumnChartCategoryDataSerializer implements PrimitiveSerializer<ColumnChartCategoryData> {
  @override
  final Iterable<Type> types = const [ColumnChartCategoryData, _$ColumnChartCategoryData];

  @override
  final String wireName = r'ColumnChartCategoryData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ColumnChartCategoryData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'categoryName';
    yield serializers.serialize(
      object.categoryName,
      specifiedType: const FullType(String),
    );
    yield r'columnChartData';
    yield serializers.serialize(
      object.columnChartData,
      specifiedType: const FullType(BuiltList, [FullType(ColumnChartData)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ColumnChartCategoryData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ColumnChartCategoryDataBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'categoryName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.categoryName = valueDes;
          break;
        case r'columnChartData':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ColumnChartData)]),
          ) as BuiltList<ColumnChartData>;
          result.columnChartData.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ColumnChartCategoryData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ColumnChartCategoryDataBuilder();
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

