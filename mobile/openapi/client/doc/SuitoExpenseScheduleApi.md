# openapi.api.SuitoExpenseScheduleApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**expenseScheduleDetail**](SuitoExpenseScheduleApi.md#expensescheduledetail) | **POST** /expense-schedule/detail | Get expense schedule detail


# **expenseScheduleDetail**
> ExpenseScheduleDetailRes expenseScheduleDetail(request)

Get expense schedule detail

購入スケジュール詳細情報を取得します.

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

