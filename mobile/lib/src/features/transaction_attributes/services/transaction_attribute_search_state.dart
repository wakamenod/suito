import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_attribute_search_state.freezed.dart';

@freezed
class TransactionAttributeSearchState with _$TransactionAttributeSearchState {
  const factory TransactionAttributeSearchState({
    required bool searchStarted,
    required String searchInput,
  }) = _TransactionAttributeSearchState;
}
