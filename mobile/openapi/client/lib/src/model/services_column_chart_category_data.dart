//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/services_column_chart_data.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'services_column_chart_category_data.g.dart';

/// ServicesColumnChartCategoryData
///
/// Properties:
/// * [categoryName] 
/// * [columnChartData] 
@BuiltValue()
abstract class ServicesColumnChartCategoryData implements Built<ServicesColumnChartCategoryData, ServicesColumnChartCategoryDataBuilder> {
  @BuiltValueField(wireName: r'categoryName')
  String? get categoryName;

  @BuiltValueField(wireName: r'columnChartData')
  BuiltList<ServicesColumnChartData>? get columnChartData;

  ServicesColumnChartCategoryData._();

  factory ServicesColumnChartCategoryData([void updates(ServicesColumnChartCategoryDataBuilder b)]) = _$ServicesColumnChartCategoryData;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ServicesColumnChartCategoryDataBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ServicesColumnChartCategoryData> get serializer => _$ServicesColumnChartCategoryDataSerializer();
}

class _$ServicesColumnChartCategoryDataSerializer implements PrimitiveSerializer<ServicesColumnChartCategoryData> {
  @override
  final Iterable<Type> types = const [ServicesColumnChartCategoryData, _$ServicesColumnChartCategoryData];

  @override
  final String wireName = r'ServicesColumnChartCategoryData';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ServicesColumnChartCategoryData object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.categoryName != null) {
      yield r'categoryName';
      yield serializers.serialize(
        object.categoryName,
        specifiedType: const FullType(String),
      );
    }
    if (object.columnChartData != null) {
      yield r'columnChartData';
      yield serializers.serialize(
        object.columnChartData,
        specifiedType: const FullType(BuiltList, [FullType(ServicesColumnChartData)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ServicesColumnChartCategoryData object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ServicesColumnChartCategoryDataBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(ServicesColumnChartData)]),
          ) as BuiltList<ServicesColumnChartData>;
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
  ServicesColumnChartCategoryData deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ServicesColumnChartCategoryDataBuilder();
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

