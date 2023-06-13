/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 52 (26 per locale)
///
/// Built on 2023-06-12 at 00:35 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _TranslationsEn> {
  en(languageCode: 'en', build: _TranslationsEn.build),
  ja(languageCode: 'ja', build: _TranslationsJa.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, _TranslationsEn> build;

  /// Gets current instance managed by [LocaleSettings].
  _TranslationsEn get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_TranslationsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
  Translations._(); // no constructor

  static _TranslationsEn of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _TranslationsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, _TranslationsEn> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, _TranslationsEn> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _TranslationsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  _TranslationsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, _TranslationsEn> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _TranslationsEn> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _TranslationsEn implements BaseTranslations<AppLocale, _TranslationsEn> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsEn.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final _TranslationsEn _root = this; // ignore: unused_field

  // Translations
  late final _TranslationsTransactionsEn transactions =
      _TranslationsTransactionsEn._(_root);
  late final _TranslationsFormsEn forms = _TranslationsFormsEn._(_root);
}

// Path: transactions
class _TranslationsTransactionsEn {
  _TranslationsTransactionsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get abbBar => 'Transactions';
  late final _TranslationsTransactionsCategoryEn category =
      _TranslationsTransactionsCategoryEn._(_root);
  late final _TranslationsTransactionsLocationEn location =
      _TranslationsTransactionsLocationEn._(_root);
  late final _TranslationsTransactionsMemoEn memo =
      _TranslationsTransactionsMemoEn._(_root);
  late final _TranslationsTransactionsDetailEn detail =
      _TranslationsTransactionsDetailEn._(_root);
  late final _TranslationsTransactionsDismissibleEn dismissible =
      _TranslationsTransactionsDismissibleEn._(_root);
  late final _TranslationsTransactionsMonthsEn months =
      _TranslationsTransactionsMonthsEn._(_root);
  late final _TranslationsTransactionsTotalAmountsEn totalAmounts =
      _TranslationsTransactionsTotalAmountsEn._(_root);
  late final _TranslationsTransactionsButtonsEn buttons =
      _TranslationsTransactionsButtonsEn._(_root);
}

// Path: forms
class _TranslationsFormsEn {
  _TranslationsFormsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  late final _TranslationsFormsErrorsEn errors =
      _TranslationsFormsErrorsEn._(_root);
}

// Path: transactions.category
class _TranslationsTransactionsCategoryEn {
  _TranslationsTransactionsCategoryEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Expense Category';
}

// Path: transactions.location
class _TranslationsTransactionsLocationEn {
  _TranslationsTransactionsLocationEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Expense Location';
}

// Path: transactions.memo
class _TranslationsTransactionsMemoEn {
  _TranslationsTransactionsMemoEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Expense Memo';
  String get hintText => 'Please enter your note here...';
}

// Path: transactions.detail
class _TranslationsTransactionsDetailEn {
  _TranslationsTransactionsDetailEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Detail';
  late final _TranslationsTransactionsDetailInputLabelsEn inputLabels =
      _TranslationsTransactionsDetailInputLabelsEn._(_root);
}

// Path: transactions.dismissible
class _TranslationsTransactionsDismissibleEn {
  _TranslationsTransactionsDismissibleEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get snackBar => 'removed';
  String get confirmTitle => 'Confirmation';
  String get confirmContent => 'Are you sure you want to delete this item?';
  String get buttonDelete => 'DELETE';
  String get buttonCancel => 'CANCEL';
  String get backgroundText => 'Delete';
}

// Path: transactions.months
class _TranslationsTransactionsMonthsEn {
  _TranslationsTransactionsMonthsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get hintText => 'Select Month';
}

// Path: transactions.totalAmounts
class _TranslationsTransactionsTotalAmountsEn {
  _TranslationsTransactionsTotalAmountsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get balance => 'Balance';
  String get income => 'Income';
  String get expense => 'Expense';
}

// Path: transactions.buttons
class _TranslationsTransactionsButtonsEn {
  _TranslationsTransactionsButtonsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get close => 'Close';
  String get post => 'Post';
}

// Path: forms.errors
class _TranslationsFormsErrorsEn {
  _TranslationsFormsErrorsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get emptyTitle => 'Empty title';
  String get emptyAmount => 'Empty amount';
}

// Path: transactions.detail.inputLabels
class _TranslationsTransactionsDetailInputLabelsEn {
  _TranslationsTransactionsDetailInputLabelsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Title';
  String get amount => 'Amount';
  String get date => 'Date';
  String get category => 'Category';
  String get location => 'Location';
  String get memo => 'Memo';
}

// Path: <root>
class _TranslationsJa implements _TranslationsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _TranslationsJa.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ja,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ja>.
  @override
  final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _TranslationsJa _root = this; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsTransactionsJa transactions =
      _TranslationsTransactionsJa._(_root);
  @override
  late final _TranslationsFormsJa forms = _TranslationsFormsJa._(_root);
}

// Path: transactions
class _TranslationsTransactionsJa implements _TranslationsTransactionsEn {
  _TranslationsTransactionsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get abbBar => '決済一覧';
  @override
  late final _TranslationsTransactionsCategoryJa category =
      _TranslationsTransactionsCategoryJa._(_root);
  @override
  late final _TranslationsTransactionsLocationJa location =
      _TranslationsTransactionsLocationJa._(_root);
  @override
  late final _TranslationsTransactionsMemoJa memo =
      _TranslationsTransactionsMemoJa._(_root);
  @override
  late final _TranslationsTransactionsDetailJa detail =
      _TranslationsTransactionsDetailJa._(_root);
  @override
  late final _TranslationsTransactionsDismissibleJa dismissible =
      _TranslationsTransactionsDismissibleJa._(_root);
  @override
  late final _TranslationsTransactionsMonthsJa months =
      _TranslationsTransactionsMonthsJa._(_root);
  @override
  late final _TranslationsTransactionsTotalAmountsJa totalAmounts =
      _TranslationsTransactionsTotalAmountsJa._(_root);
  @override
  late final _TranslationsTransactionsButtonsJa buttons =
      _TranslationsTransactionsButtonsJa._(_root);
}

// Path: forms
class _TranslationsFormsJa implements _TranslationsFormsEn {
  _TranslationsFormsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsFormsErrorsJa errors =
      _TranslationsFormsErrorsJa._(_root);
}

// Path: transactions.category
class _TranslationsTransactionsCategoryJa
    implements _TranslationsTransactionsCategoryEn {
  _TranslationsTransactionsCategoryJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '支出カテゴリー';
}

// Path: transactions.location
class _TranslationsTransactionsLocationJa
    implements _TranslationsTransactionsLocationEn {
  _TranslationsTransactionsLocationJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '購入場所';
}

// Path: transactions.memo
class _TranslationsTransactionsMemoJa
    implements _TranslationsTransactionsMemoEn {
  _TranslationsTransactionsMemoJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'メモ';
  @override
  String get hintText => 'ここにメモを入力してください...';
}

// Path: transactions.detail
class _TranslationsTransactionsDetailJa
    implements _TranslationsTransactionsDetailEn {
  _TranslationsTransactionsDetailJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '詳細';
  @override
  late final _TranslationsTransactionsDetailInputLabelsJa inputLabels =
      _TranslationsTransactionsDetailInputLabelsJa._(_root);
}

// Path: transactions.dismissible
class _TranslationsTransactionsDismissibleJa
    implements _TranslationsTransactionsDismissibleEn {
  _TranslationsTransactionsDismissibleJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get snackBar => '削除しました';
  @override
  String get confirmTitle => '確認';
  @override
  String get confirmContent => 'このアイテムを削除しますか?';
  @override
  String get buttonDelete => '削除';
  @override
  String get buttonCancel => 'キャンセル';
  @override
  String get backgroundText => '削除';
}

// Path: transactions.months
class _TranslationsTransactionsMonthsJa
    implements _TranslationsTransactionsMonthsEn {
  _TranslationsTransactionsMonthsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get hintText => '月選択';
}

// Path: transactions.totalAmounts
class _TranslationsTransactionsTotalAmountsJa
    implements _TranslationsTransactionsTotalAmountsEn {
  _TranslationsTransactionsTotalAmountsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get balance => '収支';
  @override
  String get income => '収入';
  @override
  String get expense => '支出';
}

// Path: transactions.buttons
class _TranslationsTransactionsButtonsJa
    implements _TranslationsTransactionsButtonsEn {
  _TranslationsTransactionsButtonsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get close => '閉じる';
  @override
  String get post => '登録';
}

// Path: forms.errors
class _TranslationsFormsErrorsJa implements _TranslationsFormsErrorsEn {
  _TranslationsFormsErrorsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get emptyTitle => 'タイトルが未入力です';
  @override
  String get emptyAmount => '金額が未入力です';
}

// Path: transactions.detail.inputLabels
class _TranslationsTransactionsDetailInputLabelsJa
    implements _TranslationsTransactionsDetailInputLabelsEn {
  _TranslationsTransactionsDetailInputLabelsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'タイトル';
  @override
  String get amount => '金額';
  @override
  String get date => '日付';
  @override
  String get category => 'カテゴリー';
  @override
  String get location => '購入場所';
  @override
  String get memo => 'メモ';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEn {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'transactions.abbBar':
        return 'Transactions';
      case 'transactions.category.title':
        return 'Expense Category';
      case 'transactions.location.title':
        return 'Expense Location';
      case 'transactions.memo.title':
        return 'Expense Memo';
      case 'transactions.memo.hintText':
        return 'Please enter your note here...';
      case 'transactions.detail.title':
        return 'Detail';
      case 'transactions.detail.inputLabels.title':
        return 'Title';
      case 'transactions.detail.inputLabels.amount':
        return 'Amount';
      case 'transactions.detail.inputLabels.date':
        return 'Date';
      case 'transactions.detail.inputLabels.category':
        return 'Category';
      case 'transactions.detail.inputLabels.location':
        return 'Location';
      case 'transactions.detail.inputLabels.memo':
        return 'Memo';
      case 'transactions.dismissible.snackBar':
        return 'removed';
      case 'transactions.dismissible.confirmTitle':
        return 'Confirmation';
      case 'transactions.dismissible.confirmContent':
        return 'Are you sure you want to delete this item?';
      case 'transactions.dismissible.buttonDelete':
        return 'DELETE';
      case 'transactions.dismissible.buttonCancel':
        return 'CANCEL';
      case 'transactions.dismissible.backgroundText':
        return 'Delete';
      case 'transactions.months.hintText':
        return 'Select Month';
      case 'transactions.totalAmounts.balance':
        return 'Balance';
      case 'transactions.totalAmounts.income':
        return 'Income';
      case 'transactions.totalAmounts.expense':
        return 'Expense';
      case 'transactions.buttons.close':
        return 'Close';
      case 'transactions.buttons.post':
        return 'Post';
      case 'forms.errors.emptyTitle':
        return 'Empty title';
      case 'forms.errors.emptyAmount':
        return 'Empty amount';
      default:
        return null;
    }
  }
}

extension on _TranslationsJa {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'transactions.abbBar':
        return '決済一覧';
      case 'transactions.category.title':
        return '支出カテゴリー';
      case 'transactions.location.title':
        return '購入場所';
      case 'transactions.memo.title':
        return 'メモ';
      case 'transactions.memo.hintText':
        return 'ここにメモを入力してください...';
      case 'transactions.detail.title':
        return '詳細';
      case 'transactions.detail.inputLabels.title':
        return 'タイトル';
      case 'transactions.detail.inputLabels.amount':
        return '金額';
      case 'transactions.detail.inputLabels.date':
        return '日付';
      case 'transactions.detail.inputLabels.category':
        return 'カテゴリー';
      case 'transactions.detail.inputLabels.location':
        return '購入場所';
      case 'transactions.detail.inputLabels.memo':
        return 'メモ';
      case 'transactions.dismissible.snackBar':
        return '削除しました';
      case 'transactions.dismissible.confirmTitle':
        return '確認';
      case 'transactions.dismissible.confirmContent':
        return 'このアイテムを削除しますか?';
      case 'transactions.dismissible.buttonDelete':
        return '削除';
      case 'transactions.dismissible.buttonCancel':
        return 'キャンセル';
      case 'transactions.dismissible.backgroundText':
        return '削除';
      case 'transactions.months.hintText':
        return '月選択';
      case 'transactions.totalAmounts.balance':
        return '収支';
      case 'transactions.totalAmounts.income':
        return '収入';
      case 'transactions.totalAmounts.expense':
        return '支出';
      case 'transactions.buttons.close':
        return '閉じる';
      case 'transactions.buttons.post':
        return '登録';
      case 'forms.errors.emptyTitle':
        return 'タイトルが未入力です';
      case 'forms.errors.emptyAmount':
        return '金額が未入力です';
      default:
        return null;
    }
  }
}