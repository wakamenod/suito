# openapi.api.SuitoIncomeScheduleApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**incomeScheduleDetail**](SuitoIncomeScheduleApi.md#incomescheduledetail) | **POST** /income-schedule/detail | Get income schedule detail
[**updateIncomeSchedule**](SuitoIncomeScheduleApi.md#updateincomeschedule) | **PUT** /income-schedule | Update income schedule


# **incomeScheduleDetail**
> IncomeScheduleDetailRes incomeScheduleDetail(request)

Get income schedule detail

収入スケジュール詳細情報を取得します.

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

# **updateIncomeSchedule**
> UpdateIncomeScheduleRes updateIncomeSchedule(request)

Update income schedule

収入スケジュール情報を更新します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoIncomeScheduleApi();
final UpdateIncomeScheduleReq request = ; // UpdateIncomeScheduleReq | update incomeSchedule req

try {
    final response = api.updateIncomeSchedule(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoIncomeScheduleApi->updateIncomeSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateIncomeScheduleReq**](UpdateIncomeScheduleReq.md)| update incomeSchedule req | 

### Return type

[**UpdateIncomeScheduleRes**](UpdateIncomeScheduleRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

