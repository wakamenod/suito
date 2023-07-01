# openapi.api.SuitoExpenseCategoryApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteExpenseCategory**](SuitoExpenseCategoryApi.md#deleteexpensecategory) | **DELETE** /expense/categories | Delete expense category
[**listExpenseCategories**](SuitoExpenseCategoryApi.md#listexpensecategories) | **GET** /expense/categories | List expense categories
[**registerExpenseCategory**](SuitoExpenseCategoryApi.md#registerexpensecategory) | **POST** /expense/categories | Register expense category
[**updateExpenseCategory**](SuitoExpenseCategoryApi.md#updateexpensecategory) | **PUT** /expense/categories | Update expense category


# **deleteExpenseCategory**
> JsonObject deleteExpenseCategory(request)

Delete expense category

支出カテゴリー情報を削除します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseCategoryApi();
final DeleteExpenseCategoryReq request = ; // DeleteExpenseCategoryReq | delete expenseCategory req

try {
    final response = api.deleteExpenseCategory(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseCategoryApi->deleteExpenseCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**DeleteExpenseCategoryReq**](DeleteExpenseCategoryReq.md)| delete expenseCategory req | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listExpenseCategories**
> ListExpenseCategoriesRes listExpenseCategories()

List expense categories

購入カテゴリー一覧を返却します.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseCategoryApi();

try {
    final response = api.listExpenseCategories();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseCategoryApi->listExpenseCategories: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListExpenseCategoriesRes**](ListExpenseCategoriesRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **registerExpenseCategory**
> RegisterExpenseCategoryRes registerExpenseCategory(request)

Register expense category

支出カテゴリー情報を登録します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseCategoryApi();
final RegisterExpenseCategoryReq request = ; // RegisterExpenseCategoryReq | register expenseCategory req

try {
    final response = api.registerExpenseCategory(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseCategoryApi->registerExpenseCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**RegisterExpenseCategoryReq**](RegisterExpenseCategoryReq.md)| register expenseCategory req | 

### Return type

[**RegisterExpenseCategoryRes**](RegisterExpenseCategoryRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateExpenseCategory**
> UpdateExpenseCategoryRes updateExpenseCategory(request)

Update expense category

支出カテゴリー情報を更新します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseCategoryApi();
final UpdateExpenseCategoryReq request = ; // UpdateExpenseCategoryReq | update expenseCategory req

try {
    final response = api.updateExpenseCategory(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseCategoryApi->updateExpenseCategory: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateExpenseCategoryReq**](UpdateExpenseCategoryReq.md)| update expenseCategory req | 

### Return type

[**UpdateExpenseCategoryRes**](UpdateExpenseCategoryRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

