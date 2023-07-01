# openapi.api.SuitoExpenseLocationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteExpenseLocation**](SuitoExpenseLocationApi.md#deleteexpenselocation) | **DELETE** /expense/locations | Delete expense location
[**registerExpenseLocation**](SuitoExpenseLocationApi.md#registerexpenselocation) | **POST** /expense/locations | Register expense location
[**updateExpenseLocation**](SuitoExpenseLocationApi.md#updateexpenselocation) | **PUT** /expense/locations | Update expense location


# **deleteExpenseLocation**
> JsonObject deleteExpenseLocation(request)

Delete expense location

支出場所情報を削除します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseLocationApi();
final DeleteExpenseLocationReq request = ; // DeleteExpenseLocationReq | delete expenseLocation req

try {
    final response = api.deleteExpenseLocation(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseLocationApi->deleteExpenseLocation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**DeleteExpenseLocationReq**](DeleteExpenseLocationReq.md)| delete expenseLocation req | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerExpenseLocation**
> RegisterExpenseLocationRes registerExpenseLocation(request)

Register expense location

支出場所情報を登録します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseLocationApi();
final RegisterExpenseLocationReq request = ; // RegisterExpenseLocationReq | register expenseLocation req

try {
    final response = api.registerExpenseLocation(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseLocationApi->registerExpenseLocation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**RegisterExpenseLocationReq**](RegisterExpenseLocationReq.md)| register expenseLocation req | 

### Return type

[**RegisterExpenseLocationRes**](RegisterExpenseLocationRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExpenseLocation**
> UpdateExpenseLocationRes updateExpenseLocation(request)

Update expense location

支出場所情報を更新します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseLocationApi();
final UpdateExpenseLocationReq request = ; // UpdateExpenseLocationReq | update expenseLocation req

try {
    final response = api.updateExpenseLocation(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseLocationApi->updateExpenseLocation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateExpenseLocationReq**](UpdateExpenseLocationReq.md)| update expenseLocation req | 

### Return type

[**UpdateExpenseLocationRes**](UpdateExpenseLocationRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

