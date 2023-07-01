# openapi.api.SuitoIncomeTypeApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**registerIncomeType**](SuitoIncomeTypeApi.md#registerincometype) | **POST** /income/types | Register income incomeType


# **registerIncomeType**
> RegisterIncomeTypeRes registerIncomeType(request)

Register income incomeType

収入種別を登録します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoIncomeTypeApi();
final RegisterIncomeTypeReq request = ; // RegisterIncomeTypeReq | register incomeType req

try {
    final response = api.registerIncomeType(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoIncomeTypeApi->registerIncomeType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**RegisterIncomeTypeReq**](RegisterIncomeTypeReq.md)| register incomeType req | 

### Return type

[**RegisterIncomeTypeRes**](RegisterIncomeTypeRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

