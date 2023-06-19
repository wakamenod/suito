# openapi.api.SuitoChartApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getColumnChartData**](SuitoChartApi.md#getcolumnchartdata) | **GET** /chart/column | Get column chart data


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

