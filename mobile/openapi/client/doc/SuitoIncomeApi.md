# openapi.api.SuitoIncomeApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**incomeDetail**](SuitoIncomeApi.md#incomedetail) | **POST** /income/detail | Get income detail
[**listIncomeTypes**](SuitoIncomeApi.md#listincometypes) | **GET** /income/types | List income types
[**registerIncome**](SuitoIncomeApi.md#registerincome) | **POST** /income | Register income


# **incomeDetail**
> IncomeDetailRes incomeDetail(request)

Get income detail

収入詳細情報を取得します.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoIncomeApi();
final IncomeDetailReq request = ; // IncomeDetailReq | income detail req

try {
    final response = api.incomeDetail(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoIncomeApi->incomeDetail: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**IncomeDetailReq**](IncomeDetailReq.md)| income detail req | 

### Return type

[**IncomeDetailRes**](IncomeDetailRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listIncomeTypes**
> ListIncomeTypesRes listIncomeTypes()

List income types

収入種別一覧を返却します.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoIncomeApi();

try {
    final response = api.listIncomeTypes();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoIncomeApi->listIncomeTypes: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListIncomeTypesRes**](ListIncomeTypesRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

