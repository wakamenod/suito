# openapi.api.SuitoChartApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getColumnChartData**](SuitoChartApi.md#getcolumnchartdata) | **GET** /chart/column | Get column chart data
[**getPieChartData**](SuitoChartApi.md#getpiechartdata) | **GET** /chart/pie | Get pie chart data


# **getColumnChartData**
> GetColumnChartDataRes getColumnChartData()

Get column chart data

棒グラフデータを取得します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoChartApi();

try {
    final response = api.getColumnChartData();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoChartApi->getColumnChartData: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetColumnChartDataRes**](GetColumnChartDataRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPieChartData**
> GetPieChartDataRes getPieChartData(start, end)

Get pie chart data

円グラフデータを取得します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoChartApi();
final String start = start_example; // String | Range start (YYYY-MM-DD)
final String end = end_example; // String | Range end (YYYY-MM-DD)

try {
    final response = api.getPieChartData(start, end);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoChartApi->getPieChartData: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start** | **String**| Range start (YYYY-MM-DD) | 
 **end** | **String**| Range end (YYYY-MM-DD) | 

### Return type

[**GetPieChartDataRes**](GetPieChartDataRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

