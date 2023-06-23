# openapi.api.SuitoIncomeScheduleApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**incomeScheduleDetail**](SuitoIncomeScheduleApi.md#incomescheduledetail) | **POST** /income-schedule/detail | Get income schedule detail


# **incomeScheduleDetail**
> IncomeScheduleDetailRes incomeScheduleDetail(request)

Get income schedule detail

購入スケジュール詳細情報を取得します.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoIncomeScheduleApi();
final IncomeScheduleDetailReq request = ; // IncomeScheduleDetailReq | income detail req

try {
    final response = api.incomeScheduleDetail(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoIncomeScheduleApi->incomeScheduleDetail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**IncomeScheduleDetailReq**](IncomeScheduleDetailReq.md)| income detail req | 

### Return type

[**IncomeScheduleDetailRes**](IncomeScheduleDetailRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

