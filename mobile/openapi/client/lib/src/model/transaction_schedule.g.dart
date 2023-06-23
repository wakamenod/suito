// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_schedule.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TransactionSchedule extends TransactionSchedule {
  @override
  final int amount;
  @override
  final String id;
  @override
  final String title;

  factory _$TransactionSchedule(
          [void Function(TransactionScheduleBuilder)? updates]) =>
      (new TransactionScheduleBuilder()..update(updates))._build();

  _$TransactionSchedule._(
      {required this.amount, required this.id, required this.title})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        amount, r'TransactionSchedule', 'amount');
    BuiltValueNullFieldError.checkNotNull(id, r'TransactionSchedule', 'id');
    BuiltValueNullFieldError.checkNotNull(
        title, r'TransactionSchedule', 'title');
  }

  @override
  TransactionSchedule rebuild(
          void Function(TransactionScheduleBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionScheduleBuilder toBuilder() =>
      new TransactionScheduleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionSchedule &&
        amount == other.amount &&
        id == other.id &&
        title == other.title;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionSchedule')
          ..add('amount', amount)
          ..add('id', id)
          ..add('title', title))
        .toString();
  }
}

class TransactionScheduleBuilder
    implements Builder<TransactionSchedule, TransactionScheduleBuilder> {
  _$TransactionSchedule? _$v;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  TransactionScheduleBuilder() {
    TransactionSchedule._defaults(this);
  }

  TransactionScheduleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _id = $v.id;
      _title = $v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionSchedule other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionSchedule;
  }

  @override
  void update(void Function(TransactionScheduleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionSchedule build() => _build();

  _$TransactionSchedule _build() {
    final _$result = _$v ??
        new _$TransactionSchedule._(
            amount: BuiltValueNullFieldError.checkNotNull(
                amount, r'TransactionSchedule', 'amount'),
            id: BuiltValueNullFieldError.checkNotNull(
                id, r'TransactionSchedule', 'id'),
            title: BuiltValueNullFieldError.checkNotNull(
                title, r'TransactionSchedule', 'title'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
