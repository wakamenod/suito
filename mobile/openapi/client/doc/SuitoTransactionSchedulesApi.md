# openapi.api.SuitoTransactionSchedulesApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listTransactionSchedules**](SuitoTransactionSchedulesApi.md#listtransactionschedules) | **GET** /schedules | List transaction schedules


# **listTransactionSchedules**
> ListTransactionSchedulesRes listTransactionSchedules()

List transaction schedules

List transactions schedules.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoTransactionSchedulesApi();

try {
    final response = api.listTransactionSchedules();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoTransactionSchedulesApi->listTransactionSchedules: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ListTransactionSchedulesRes**](ListTransactionSchedulesRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

