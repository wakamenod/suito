# openapi.api.SuitoDefaultApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ping**](SuitoDefaultApi.md#ping) | **GET** /ping | Ping
[**version**](SuitoDefaultApi.md#version) | **GET** /version | Version


# **ping**
> String ping()

Ping

Ping

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoDefaultApi();

try {
    final response = api.ping();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoDefaultApi->ping: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **version**
> String version()

Version

Version

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoDefaultApi();

try {
    final response = api.version();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoDefaultApi->version: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

