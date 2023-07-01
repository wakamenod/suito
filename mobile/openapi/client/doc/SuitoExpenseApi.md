# openapi.api.SuitoExpenseApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteExpense**](SuitoExpenseApi.md#deleteexpense) | **DELETE** /expense | Delete expense
[**expenseDetail**](SuitoExpenseApi.md#expensedetail) | **POST** /expense/detail | Get expense detail
[**listExpenseLocations**](SuitoExpenseApi.md#listexpenselocations) | **GET** /expense/locations | List expense locations
[**registerExpense**](SuitoExpenseApi.md#registerexpense) | **POST** /expense | Register expense
[**updateExpense**](SuitoExpenseApi.md#updateexpense) | **PUT** /expense | Update expense


# **deleteExpense**
> JsonObject deleteExpense(request)

Delete expense

支出情報を削除します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseApi();
final DeleteExpenseReq request = ; // DeleteExpenseReq | delete expense req

try {
    final response = api.deleteExpense(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseApi->deleteExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**DeleteExpenseReq**](DeleteExpenseReq.md)| delete expense req | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **expenseDetail**
> ExpenseDetailRes expenseDetail(request)

Get expense detail

購入詳細情報を取得します.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseApi();
final ExpenseDetailReq request = ; // ExpenseDetailReq | expense detail req

try {
    final response = api.expenseDetail(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseApi->expenseDetail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**ExpenseDetailReq**](ExpenseDetailReq.md)| expense detail req | 

### Return type

[**ExpenseDetailRes**](ExpenseDetailRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listExpenseLocations**
> ListExpenseLocationsRes listExpenseLocations()

List expense locations

購入場所ー一覧を返却します.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseApi();

try {
    final response = api.listExpenseLocations();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseApi->listExpenseLocations: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListExpenseLocationsRes**](ListExpenseLocationsRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerExpense**
> RegisterExpenseRes registerExpense(request)

Register expense

支出情報を登録します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseApi();
final RegisterExpenseReq request = ; // RegisterExpenseReq | register expense req

try {
    final response = api.registerExpense(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseApi->registerExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**RegisterExpenseReq**](RegisterExpenseReq.md)| register expense req | 

### Return type

[**RegisterExpenseRes**](RegisterExpenseRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExpense**
> UpdateExpenseRes updateExpense(request)

Update expense

支出情報を更新します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseApi();
final UpdateExpenseReq request = ; // UpdateExpenseReq | update expense req

try {
    final response = api.updateExpense(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseApi->updateExpense: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateExpenseReq**](UpdateExpenseReq.md)| update expense req | 

### Return type

[**UpdateExpenseRes**](UpdateExpenseRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

