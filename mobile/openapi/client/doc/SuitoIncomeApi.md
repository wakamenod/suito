# openapi.api.SuitoIncomeApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**registerIncome**](SuitoIncomeApi.md#registerincome) | **POST** /income | Register income


# **registerIncome**
> RegisterIncomeRes registerIncome(request)

Register income

収入情報を登録します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoIncomeApi();
final RegisterIncomeReq request = ; // RegisterIncomeReq | register income req

try {
    final response = api.registerIncome(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoIncomeApi->registerIncome: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**RegisterIncomeReq**](RegisterIncomeReq.md)| register income req | 

### Return type

[**RegisterIncomeRes**](RegisterIncomeRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

