# openapi.api.SuitoExpenseApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listExpenseCategories**](SuitoExpenseApi.md#listexpensecategories) | **GET** /expense/categories | List expense categories
[**listExpenseLocations**](SuitoExpenseApi.md#listexpenselocations) | **GET** /expense/locations | List expense locations


# **listExpenseCategories**
> ListExpenseCategoriesRes listExpenseCategories()

List expense categories

購入カテゴリー一覧を返却します.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoExpenseApi();

try {
    final response = api.listExpenseCategories();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoExpenseApi->listExpenseCategories: $e\n');
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

