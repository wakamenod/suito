// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_com_wakamenod_suito_api_controllers_update_expense_category_res.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes
    extends GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes {
  @override
  final ModelExpenseCategory updatedExpenseCategory;

  factory _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes(
          [void Function(
                  GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder)?
              updates]) =>
      (new GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder()
            ..update(updates))
          ._build();

  _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes._(
      {required this.updatedExpenseCategory})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        updatedExpenseCategory,
        r'GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes',
        'updatedExpenseCategory');
  }

  @override
  GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes rebuild(
          void Function(
                  GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder)
              updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder
      toBuilder() =>
          new GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder()
            ..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other
            is GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes &&
        updatedExpenseCategory == other.updatedExpenseCategory;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, updatedExpenseCategory.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
            r'GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes')
          ..add('updatedExpenseCategory', updatedExpenseCategory))
        .toString();
  }
}

class GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder
    implements
        Builder<GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes,
            GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder> {
  _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes? _$v;

  ModelExpenseCategoryBuilder? _updatedExpenseCategory;
  ModelExpenseCategoryBuilder get updatedExpenseCategory =>
      _$this._updatedExpenseCategory ??= new ModelExpenseCategoryBuilder();
  set updatedExpenseCategory(
          ModelExpenseCategoryBuilder? updatedExpenseCategory) =>
      _$this._updatedExpenseCategory = updatedExpenseCategory;

  GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder() {
    GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes._defaults(
        this);
  }

  GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder
      get _$this {
    final $v = _$v;
    if ($v != null) {
      _updatedExpenseCategory = $v.updatedExpenseCategory.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(
      GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other
        as _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes;
  }

  @override
  void update(
      void Function(
              GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryResBuilder)?
          updates) {
    if (updates != null) updates(this);
  }

  @override
  GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes build() =>
      _build();

  _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes _build() {
    _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes _$result;
    try {
      _$result = _$v ??
          new _$GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes._(
              updatedExpenseCategory: updatedExpenseCategory.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'updatedExpenseCategory';
        updatedExpenseCategory.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'GithubComWakamenodSuitoApiControllersUpdateExpenseCategoryRes',
            _$failedField,
            e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
