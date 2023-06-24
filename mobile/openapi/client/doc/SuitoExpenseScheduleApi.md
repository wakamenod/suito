# openapi.api.SuitoExpenseScheduleApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteExpenseSchedule**](SuitoExpenseScheduleApi.md#deleteexpenseschedule) | **DELETE** /expense-schedule | Delete expense schedule
[**expenseScheduleDetail**](SuitoExpenseScheduleApi.md#expensescheduledetail) | **POST** /expense-schedule/detail | Get expense schedule detail
[**registerExpenseSchedule**](SuitoExpenseScheduleApi.md#registerexpenseschedule) | **POST** /expense-schedule | Register expense schedule
[**updateExpenseSchedule**](SuitoExpenseScheduleApi.md#updateexpenseschedule) | **PUT** /expense-schedule | Update expense shcedule


# **deleteExpenseSchedule**
> JsonObject deleteExpenseSchedule(request)

Delete expense schedule

支出スケジュール情報を削除します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseScheduleApi();
final DeleteExpenseScheduleReq request = ; // DeleteExpenseScheduleReq | delete expenseSchedule req

try {
    final response = api.deleteExpenseSchedule(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseScheduleApi->deleteExpenseSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**DeleteExpenseScheduleReq**](DeleteExpenseScheduleReq.md)| delete expenseSchedule req | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseScheduleDetail**
> ExpenseScheduleDetailRes expenseScheduleDetail(request)

Get expense schedule detail

支出スケジュール詳細情報を取得します.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseScheduleApi();
final ExpenseScheduleDetailReq request = ; // ExpenseScheduleDetailReq | expense detail req

try {
    final response = api.expenseScheduleDetail(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseScheduleApi->expenseScheduleDetail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**ExpenseScheduleDetailReq**](ExpenseScheduleDetailReq.md)| expense detail req | 

### Return type

[**ExpenseScheduleDetailRes**](ExpenseScheduleDetailRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerExpenseSchedule**
> RegisterExpenseScheduleRes registerExpenseSchedule(request)

Register expense schedule

支出スケジュール情報を登録します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseScheduleApi();
final RegisterExpenseScheduleReq request = ; // RegisterExpenseScheduleReq | register expenseSchedule req

try {
    final response = api.registerExpenseSchedule(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseScheduleApi->registerExpenseSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**RegisterExpenseScheduleReq**](RegisterExpenseScheduleReq.md)| register expenseSchedule req | 

### Return type

[**RegisterExpenseScheduleRes**](RegisterExpenseScheduleRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExpenseSchedule**
> UpdateExpenseScheduleRes updateExpenseSchedule(request)

Update expense shcedule

支出スケジュール情報を更新します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseScheduleApi();
final UpdateExpenseScheduleReq request = ; // UpdateExpenseScheduleReq | update expenseSchedule req

try {
    final response = api.updateExpenseSchedule(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseScheduleApi->updateExpenseSchedule: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateExpenseScheduleReq**](UpdateExpenseScheduleReq.md)| update expenseSchedule req | 

### Return type

[**UpdateExpenseScheduleRes**](UpdateExpenseScheduleRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

