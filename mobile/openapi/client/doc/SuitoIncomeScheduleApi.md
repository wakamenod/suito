# openapi.api.SuitoIncomeScheduleApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteIncomeSchedule**](SuitoIncomeScheduleApi.md#deleteincomeschedule) | **DELETE** /income-schedule | Delete income schedule
[**incomeScheduleDetail**](SuitoIncomeScheduleApi.md#incomescheduledetail) | **POST** /income-schedule/detail | Get income schedule detail
[**registerIncomeSchedule**](SuitoIncomeScheduleApi.md#registerincomeschedule) | **POST** /income-schedule | Register income schedule
[**updateIncomeSchedule**](SuitoIncomeScheduleApi.md#updateincomeschedule) | **PUT** /income-schedule | Update income schedule


# **deleteIncomeSchedule**
> JsonObject deleteIncomeSchedule(request)

Delete income schedule

収入スケジュール情報を削除します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoIncomeScheduleApi();
final DeleteIncomeScheduleReq request = ; // DeleteIncomeScheduleReq | delete incomeSchedule req

try {
    final response = api.deleteIncomeSchedule(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoIncomeScheduleApi->deleteIncomeSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**DeleteIncomeScheduleReq**](DeleteIncomeScheduleReq.md)| delete incomeSchedule req | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **registerIncomeSchedule**
> RegisterIncomeScheduleRes registerIncomeSchedule(request)

Register income schedule

収入スケジュール情報を登録します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoIncomeScheduleApi();
final RegisterIncomeScheduleReq request = ; // RegisterIncomeScheduleReq | register incomeSchedule req

try {
    final response = api.registerIncomeSchedule(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoIncomeScheduleApi->registerIncomeSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**RegisterIncomeScheduleReq**](RegisterIncomeScheduleReq.md)| register incomeSchedule req | 

### Return type

[**RegisterIncomeScheduleRes**](RegisterIncomeScheduleRes.md)

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

