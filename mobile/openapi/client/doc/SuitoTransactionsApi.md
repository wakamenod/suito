# openapi.api.SuitoTransactionsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost:8009/api/v1*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listTransactions**](SuitoTransactionsApi.md#listtransactions) | **GET** /transactions | List transactions
[**transactionMonths**](SuitoTransactionsApi.md#transactionmonths) | **GET** /transactions/months | List transaction months


# **listTransactions**
> ListTransactionsRes listTransactions(yearMonth)

List transactions

List transactions.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoTransactionsApi();
final String yearMonth = yearMonth_example; // String | yearMonth

try {
    final response = api.listTransactions(yearMonth);
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoTransactionsApi->listTransactions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **yearMonth** | **String**| yearMonth | 

### Return type

[**ListTransactionsRes**](ListTransactionsRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **transactionMonths**
> TransactionMonthsRes transactionMonths()

List transaction months

トランザクションが発生した月(YYYY-MM)の一覧を取得します.

### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSuitoTransactionsApi();

try {
    final response = api.transactionMonths();
    print(response);
} catch on DioError (e) {
    print('Exception when calling SuitoTransactionsApi->transactionMonths: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**TransactionMonthsRes**](TransactionMonthsRes.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

