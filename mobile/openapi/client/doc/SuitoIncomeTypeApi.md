# openapi.api.SuitoIncomeTypeApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**deleteIncomeType**](SuitoIncomeTypeApi.md#deleteincometype) | **DELETE** /income/types | Delete expense incomeType
[**registerIncomeType**](SuitoIncomeTypeApi.md#registerincometype) | **POST** /income/types | Register income incomeType
[**updateIncomeType**](SuitoIncomeTypeApi.md#updateincometype) | **PUT** /income/types | Update expense incomeType


# **deleteIncomeType**
> JsonObject deleteIncomeType(request)

Delete expense incomeType

支出場所情報を削除します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoIncomeTypeApi();
final DeleteIncomeTypeReq request = ; // DeleteIncomeTypeReq | delete IncomeType req

try {
    final response = api.deleteIncomeType(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoIncomeTypeApi->deleteIncomeType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**DeleteIncomeTypeReq**](DeleteIncomeTypeReq.md)| delete IncomeType req | 

### Return type

[**JsonObject**](JsonObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

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

# **updateIncomeType**
> UpdateIncomeTypeRes updateIncomeType(request)

Update expense incomeType

収入種別情報を更新します

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoIncomeTypeApi();
final UpdateIncomeTypeReq request = ; // UpdateIncomeTypeReq | update incomeType req

try {
    final response = api.updateIncomeType(request);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoIncomeTypeApi->updateIncomeType: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**UpdateIncomeTypeReq**](UpdateIncomeTypeReq.md)| update incomeType req | 

### Return type

[**UpdateIncomeTypeRes**](UpdateIncomeTypeRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

