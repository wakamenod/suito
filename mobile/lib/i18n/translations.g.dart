/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 140 (70 per locale)
///
/// Built on 2023-07-18 at 06:39 UTC

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
  late final _TranslationsGeneralEn general = _TranslationsGeneralEn._(_root);
  late final _TranslationsSchedulesEn schedules =
      _TranslationsSchedulesEn._(_root);
  late final _TranslationsChartsEn charts = _TranslationsChartsEn._(_root);
  late final _TranslationsTransactionsEn transactions =
      _TranslationsTransactionsEn._(_root);
  late final _TranslationsTransactionAttributesEn transactionAttributes =
      _TranslationsTransactionAttributesEn._(_root);
  late final _TranslationsFormsEn forms = _TranslationsFormsEn._(_root);
}

// Path: general
class _TranslationsGeneralEn {
  _TranslationsGeneralEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  late final _TranslationsGeneralVersionEn version =
      _TranslationsGeneralVersionEn._(_root);
  late final _TranslationsGeneralDismissibleEn dismissible =
      _TranslationsGeneralDismissibleEn._(_root);
}

// Path: schedules
class _TranslationsSchedulesEn {
  _TranslationsSchedulesEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get abbBar => 'Schedules';
  String get description =>
      'The expenses/incomes registered on this screen will be automatically recorded at the beginning of each month.';
  late final _TranslationsSchedulesExpansionTileEn expansionTile =
      _TranslationsSchedulesExpansionTileEn._(_root);
}

// Path: charts
class _TranslationsChartsEn {
  _TranslationsChartsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get abbBar => 'Reports';
  late final _TranslationsChartsToggleEn toggle =
      _TranslationsChartsToggleEn._(_root);
}

// Path: transactions
class _TranslationsTransactionsEn {
  _TranslationsTransactionsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get abbBar => 'Transactions';
  late final _TranslationsTransactionsIncomeTypeEn incomeType =
      _TranslationsTransactionsIncomeTypeEn._(_root);
  late final _TranslationsTransactionsCategoryEn category =
      _TranslationsTransactionsCategoryEn._(_root);
  late final _TranslationsTransactionsLocationEn location =
      _TranslationsTransactionsLocationEn._(_root);
  late final _TranslationsTransactionsMemoEn memo =
      _TranslationsTransactionsMemoEn._(_root);
  late final _TranslationsTransactionsDetailEn detail =
      _TranslationsTransactionsDetailEn._(_root);
  late final _TranslationsTransactionsMonthsEn months =
      _TranslationsTransactionsMonthsEn._(_root);
  late final _TranslationsTransactionsTotalAmountsEn totalAmounts =
      _TranslationsTransactionsTotalAmountsEn._(_root);
  late final _TranslationsTransactionsButtonsEn buttons =
      _TranslationsTransactionsButtonsEn._(_root);
}

// Path: transactionAttributes
class _TranslationsTransactionAttributesEn {
  _TranslationsTransactionAttributesEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  late final _TranslationsTransactionAttributesAddTileEn addTile =
      _TranslationsTransactionAttributesAddTileEn._(_root);
  String get searchInputHint => 'Type to search and add';
  String get floatingButton => 'ADD NEW';
  late final _TranslationsTransactionAttributesCategoryEn category =
      _TranslationsTransactionAttributesCategoryEn._(_root);
  late final _TranslationsTransactionAttributesLocationEn location =
      _TranslationsTransactionAttributesLocationEn._(_root);
  late final _TranslationsTransactionAttributesIncomeTypeEn incomeType =
      _TranslationsTransactionAttributesIncomeTypeEn._(_root);
  String appBarSettings({required Object title}) => '${title} Settings';
  String get settingsRename => 'Rename';
  String get settingsDelete => 'Delete';
  String get settingsCancel => 'Cancel';
  String get deleteConfirmation => 'Are you sure? this can\'t be undone';
}

// Path: forms
class _TranslationsFormsEn {
  _TranslationsFormsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  late final _TranslationsFormsErrorsEn errors =
      _TranslationsFormsErrorsEn._(_root);
}

// Path: general.version
class _TranslationsGeneralVersionEn {
  _TranslationsGeneralVersionEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get updateAlertTitle => 'Update Required';
  String updateAlertContent(
          {required Object appVersion, required Object serverVersion}) =>
      'Please update the app\n App version: ${appVersion}\n Server version: ${serverVersion}';
}

// Path: general.dismissible
class _TranslationsGeneralDismissibleEn {
  _TranslationsGeneralDismissibleEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get snackBar => 'removed';
  String get confirmTitle => 'Confirmation';
  String get confirmContent => 'Are you sure you want to delete this item?';
  String get buttonDelete => 'DELETE';
  String get buttonCancel => 'CANCEL';
  String get backgroundText => 'Delete';
}

// Path: schedules.expansionTile
class _TranslationsSchedulesExpansionTileEn {
  _TranslationsSchedulesExpansionTileEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get expenseHeader => 'Expense';
  String get incomeHeader => 'Income';
}

// Path: charts.toggle
class _TranslationsChartsToggleEn {
  _TranslationsChartsToggleEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get category => 'Category';
  String get location => 'Location';
}

// Path: transactions.incomeType
class _TranslationsTransactionsIncomeTypeEn {
  _TranslationsTransactionsIncomeTypeEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Income Type';
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

// Path: transactionAttributes.addTile
class _TranslationsTransactionAttributesAddTileEn {
  _TranslationsTransactionAttributesAddTileEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String title({required Object input}) => 'Add ${input}';
  String get subtitle => 'Tap to add this as new item';
}

// Path: transactionAttributes.category
class _TranslationsTransactionAttributesCategoryEn {
  _TranslationsTransactionAttributesCategoryEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get appBar => 'Category';
  String get noEntry => 'NO CATEGORY';
  String get bottomSheetTitle => 'Add category';
  String get bottomSheetInputLabel => 'Category Name';
  String get settingsAdd => 'Add New Category';
  String get settingsListLabel => 'Registered Categories';
  String get deleteConfirmTitle => 'Delete Category?';
  String get deleteConfirmContent =>
      'When you delete a category, it will also be removed from the expenses where this category is registered.';
}

// Path: transactionAttributes.location
class _TranslationsTransactionAttributesLocationEn {
  _TranslationsTransactionAttributesLocationEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get appBar => 'Location';
  String get noEntry => 'NO LOCATION';
  String get bottomSheetTitle => 'Add location';
  String get bottomSheetInputLabel => 'Location Name';
  String get settingsAdd => 'Add New Location';
  String get settingsListLabel => 'Registered Locations';
  String get deleteConfirmTitle => 'Delete Location?';
  String get deleteConfirmContent =>
      'When you delete a location, it will also be removed from the expenses where this location is registered.';
}

// Path: transactionAttributes.incomeType
class _TranslationsTransactionAttributesIncomeTypeEn {
  _TranslationsTransactionAttributesIncomeTypeEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get appBar => 'Income Type';
  String get noEntry => 'NO INCOME TYPE';
  String get bottomSheetTitle => 'Add income type';
  String get bottomSheetInputLabel => 'Income Type Name';
  String get settingsAdd => 'Add New Income Type';
  String get settingsListLabel => 'Registered Income Types';
  String get deleteConfirmTitle => 'Delete Income Type?';
  String get deleteConfirmContent =>
      'The income type will be deleted. (Income types that are in use within income data cannot be deleted.)';
}

// Path: forms.errors
class _TranslationsFormsErrorsEn {
  _TranslationsFormsErrorsEn._(this._root);

  final _TranslationsEn _root; // ignore: unused_field

  // Translations
  String get emptyTitle => 'Empty title';
  String get emptyAmount => 'Empty amount';
  String get emptyAttributeName => 'Empty Name';
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
  late final _TranslationsGeneralJa general = _TranslationsGeneralJa._(_root);
  @override
  late final _TranslationsSchedulesJa schedules =
      _TranslationsSchedulesJa._(_root);
  @override
  late final _TranslationsTransactionsJa transactions =
      _TranslationsTransactionsJa._(_root);
  @override
  late final _TranslationsChartsJa charts = _TranslationsChartsJa._(_root);
  @override
  late final _TranslationsTransactionAttributesJa transactionAttributes =
      _TranslationsTransactionAttributesJa._(_root);
  @override
  late final _TranslationsFormsJa forms = _TranslationsFormsJa._(_root);
}

// Path: general
class _TranslationsGeneralJa implements _TranslationsGeneralEn {
  _TranslationsGeneralJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsGeneralVersionJa version =
      _TranslationsGeneralVersionJa._(_root);
  @override
  late final _TranslationsGeneralDismissibleJa dismissible =
      _TranslationsGeneralDismissibleJa._(_root);
}

// Path: schedules
class _TranslationsSchedulesJa implements _TranslationsSchedulesEn {
  _TranslationsSchedulesJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get abbBar => 'スケジュール一覧';
  @override
  String get description => 'この画面で登録した支出・出費は、月初に自動登録されます';
  @override
  late final _TranslationsSchedulesExpansionTileJa expansionTile =
      _TranslationsSchedulesExpansionTileJa._(_root);
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
  late final _TranslationsTransactionsIncomeTypeJa incomeType =
      _TranslationsTransactionsIncomeTypeJa._(_root);
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
  late final _TranslationsTransactionsMonthsJa months =
      _TranslationsTransactionsMonthsJa._(_root);
  @override
  late final _TranslationsTransactionsTotalAmountsJa totalAmounts =
      _TranslationsTransactionsTotalAmountsJa._(_root);
  @override
  late final _TranslationsTransactionsButtonsJa buttons =
      _TranslationsTransactionsButtonsJa._(_root);
}

// Path: charts
class _TranslationsChartsJa implements _TranslationsChartsEn {
  _TranslationsChartsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get abbBar => 'レポート';
  @override
  late final _TranslationsChartsToggleJa toggle =
      _TranslationsChartsToggleJa._(_root);
}

// Path: transactionAttributes
class _TranslationsTransactionAttributesJa
    implements _TranslationsTransactionAttributesEn {
  _TranslationsTransactionAttributesJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  late final _TranslationsTransactionAttributesAddTileJa addTile =
      _TranslationsTransactionAttributesAddTileJa._(_root);
  @override
  String get searchInputHint => '入力して検索、追加';
  @override
  String get floatingButton => '新規追加';
  @override
  late final _TranslationsTransactionAttributesCategoryJa category =
      _TranslationsTransactionAttributesCategoryJa._(_root);
  @override
  late final _TranslationsTransactionAttributesLocationJa location =
      _TranslationsTransactionAttributesLocationJa._(_root);
  @override
  late final _TranslationsTransactionAttributesIncomeTypeJa incomeType =
      _TranslationsTransactionAttributesIncomeTypeJa._(_root);
  @override
  String appBarSettings({required Object title}) => '${title}設定';
  @override
  String get settingsRename => 'リネーム';
  @override
  String get settingsDelete => '削除';
  @override
  String get settingsCancel => 'キャンセル';
  @override
  String get deleteConfirmation => '本当に宜しいですか？この操作は取り消せません';
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

// Path: general.version
class _TranslationsGeneralVersionJa implements _TranslationsGeneralVersionEn {
  _TranslationsGeneralVersionJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get updateAlertTitle => 'アップデートがあります';
  @override
  String updateAlertContent(
          {required Object appVersion, required Object serverVersion}) =>
      'アプリのアップデートをお願いします\n AppVersion: ${appVersion}\n ServerVersion: ${serverVersion}';
}

// Path: general.dismissible
class _TranslationsGeneralDismissibleJa
    implements _TranslationsGeneralDismissibleEn {
  _TranslationsGeneralDismissibleJa._(this._root);

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

// Path: schedules.expansionTile
class _TranslationsSchedulesExpansionTileJa
    implements _TranslationsSchedulesExpansionTileEn {
  _TranslationsSchedulesExpansionTileJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get expenseHeader => '支出';
  @override
  String get incomeHeader => '収入';
}

// Path: transactions.incomeType
class _TranslationsTransactionsIncomeTypeJa
    implements _TranslationsTransactionsIncomeTypeEn {
  _TranslationsTransactionsIncomeTypeJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '収入種別';
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

// Path: charts.toggle
class _TranslationsChartsToggleJa implements _TranslationsChartsToggleEn {
  _TranslationsChartsToggleJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get category => 'カテゴリ';
  @override
  String get location => '購入場所';
}

// Path: transactionAttributes.addTile
class _TranslationsTransactionAttributesAddTileJa
    implements _TranslationsTransactionAttributesAddTileEn {
  _TranslationsTransactionAttributesAddTileJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String title({required Object input}) => '\'${input}\' を追加';
  @override
  String get subtitle => 'タップして追加';
}

// Path: transactionAttributes.category
class _TranslationsTransactionAttributesCategoryJa
    implements _TranslationsTransactionAttributesCategoryEn {
  _TranslationsTransactionAttributesCategoryJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get appBar => 'カテゴリー';
  @override
  String get noEntry => 'カテゴリー無し';
  @override
  String get bottomSheetTitle => 'カテゴリー追加';
  @override
  String get bottomSheetInputLabel => 'カテゴリー名';
  @override
  String get settingsAdd => '新規カテゴリー追加';
  @override
  String get settingsListLabel => '登録済みカテゴリー一覧';
  @override
  String get deleteConfirmTitle => 'カテゴリーを削除しますか？';
  @override
  String get deleteConfirmContent =>
      'カテゴリーを削除すると、同時にこのカテゴリーが登録されている支出からもカテゴリーが削除されます。';
}

// Path: transactionAttributes.location
class _TranslationsTransactionAttributesLocationJa
    implements _TranslationsTransactionAttributesLocationEn {
  _TranslationsTransactionAttributesLocationJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get appBar => '購入場所';
  @override
  String get noEntry => '購入場所なし';
  @override
  String get bottomSheetTitle => '購入場所追加';
  @override
  String get bottomSheetInputLabel => '購入場所名';
  @override
  String get settingsAdd => '新規購入場所追加';
  @override
  String get settingsListLabel => '登録済み購入場所一覧';
  @override
  String get deleteConfirmTitle => '購入場所を削除しますか？';
  @override
  String get deleteConfirmContent =>
      '購入場所を削除すると、同時にこの購入場所が登録されている支出からも購入場所が削除されます。';
}

// Path: transactionAttributes.incomeType
class _TranslationsTransactionAttributesIncomeTypeJa
    implements _TranslationsTransactionAttributesIncomeTypeEn {
  _TranslationsTransactionAttributesIncomeTypeJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get appBar => '収入種別';
  @override
  String get noEntry => 'NO INCOME TYPE';
  @override
  String get bottomSheetTitle => '収入種別追加';
  @override
  String get bottomSheetInputLabel => '収入種別名';
  @override
  String get settingsAdd => '新規収入種別追加';
  @override
  String get settingsListLabel => '登録済み収入種別一覧';
  @override
  String get deleteConfirmTitle => '収入種別削除を削除しますか？';
  @override
  String get deleteConfirmContent => '収入種別を削除します。(収入データで使用中の収入種別は削除できません)';
}

// Path: forms.errors
class _TranslationsFormsErrorsJa implements _TranslationsFormsErrorsEn {
  _TranslationsFormsErrorsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get emptyTitle => '品目が未入力です';
  @override
  String get emptyAmount => '金額が未入力です';
  @override
  String get emptyAttributeName => '名称が未入力です';
}

// Path: transactions.detail.inputLabels
class _TranslationsTransactionsDetailInputLabelsJa
    implements _TranslationsTransactionsDetailInputLabelsEn {
  _TranslationsTransactionsDetailInputLabelsJa._(this._root);

  @override
  final _TranslationsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '品目';
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
      case 'general.version.updateAlertTitle':
        return 'Update Required';
      case 'general.version.updateAlertContent':
        return ({required Object appVersion, required Object serverVersion}) =>
            'Please update the app\n App version: ${appVersion}\n Server version: ${serverVersion}';
      case 'general.dismissible.snackBar':
        return 'removed';
      case 'general.dismissible.confirmTitle':
        return 'Confirmation';
      case 'general.dismissible.confirmContent':
        return 'Are you sure you want to delete this item?';
      case 'general.dismissible.buttonDelete':
        return 'DELETE';
      case 'general.dismissible.buttonCancel':
        return 'CANCEL';
      case 'general.dismissible.backgroundText':
        return 'Delete';
      case 'schedules.abbBar':
        return 'Schedules';
      case 'schedules.description':
        return 'The expenses/incomes registered on this screen will be automatically recorded at the beginning of each month.';
      case 'schedules.expansionTile.expenseHeader':
        return 'Expense';
      case 'schedules.expansionTile.incomeHeader':
        return 'Income';
      case 'charts.abbBar':
        return 'Reports';
      case 'charts.toggle.category':
        return 'Category';
      case 'charts.toggle.location':
        return 'Location';
      case 'transactions.abbBar':
        return 'Transactions';
      case 'transactions.incomeType.title':
        return 'Income Type';
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
      case 'transactionAttributes.addTile.title':
        return ({required Object input}) => 'Add ${input}';
      case 'transactionAttributes.addTile.subtitle':
        return 'Tap to add this as new item';
      case 'transactionAttributes.searchInputHint':
        return 'Type to search and add';
      case 'transactionAttributes.floatingButton':
        return 'ADD NEW';
      case 'transactionAttributes.category.appBar':
        return 'Category';
      case 'transactionAttributes.category.noEntry':
        return 'NO CATEGORY';
      case 'transactionAttributes.category.bottomSheetTitle':
        return 'Add category';
      case 'transactionAttributes.category.bottomSheetInputLabel':
        return 'Category Name';
      case 'transactionAttributes.category.settingsAdd':
        return 'Add New Category';
      case 'transactionAttributes.category.settingsListLabel':
        return 'Registered Categories';
      case 'transactionAttributes.category.deleteConfirmTitle':
        return 'Delete Category?';
      case 'transactionAttributes.category.deleteConfirmContent':
        return 'When you delete a category, it will also be removed from the expenses where this category is registered.';
      case 'transactionAttributes.location.appBar':
        return 'Location';
      case 'transactionAttributes.location.noEntry':
        return 'NO LOCATION';
      case 'transactionAttributes.location.bottomSheetTitle':
        return 'Add location';
      case 'transactionAttributes.location.bottomSheetInputLabel':
        return 'Location Name';
      case 'transactionAttributes.location.settingsAdd':
        return 'Add New Location';
      case 'transactionAttributes.location.settingsListLabel':
        return 'Registered Locations';
      case 'transactionAttributes.location.deleteConfirmTitle':
        return 'Delete Location?';
      case 'transactionAttributes.location.deleteConfirmContent':
        return 'When you delete a location, it will also be removed from the expenses where this location is registered.';
      case 'transactionAttributes.incomeType.appBar':
        return 'Income Type';
      case 'transactionAttributes.incomeType.noEntry':
        return 'NO INCOME TYPE';
      case 'transactionAttributes.incomeType.bottomSheetTitle':
        return 'Add income type';
      case 'transactionAttributes.incomeType.bottomSheetInputLabel':
        return 'Income Type Name';
      case 'transactionAttributes.incomeType.settingsAdd':
        return 'Add New Income Type';
      case 'transactionAttributes.incomeType.settingsListLabel':
        return 'Registered Income Types';
      case 'transactionAttributes.incomeType.deleteConfirmTitle':
        return 'Delete Income Type?';
      case 'transactionAttributes.incomeType.deleteConfirmContent':
        return 'The income type will be deleted. (Income types that are in use within income data cannot be deleted.)';
      case 'transactionAttributes.appBarSettings':
        return ({required Object title}) => '${title} Settings';
      case 'transactionAttributes.settingsRename':
        return 'Rename';
      case 'transactionAttributes.settingsDelete':
        return 'Delete';
      case 'transactionAttributes.settingsCancel':
        return 'Cancel';
      case 'transactionAttributes.deleteConfirmation':
        return 'Are you sure? this can\'t be undone';
      case 'forms.errors.emptyTitle':
        return 'Empty title';
      case 'forms.errors.emptyAmount':
        return 'Empty amount';
      case 'forms.errors.emptyAttributeName':
        return 'Empty Name';
      default:
        return null;
    }
  }
}

extension on _TranslationsJa {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'general.version.updateAlertTitle':
        return 'アップデートがあります';
      case 'general.version.updateAlertContent':
        return ({required Object appVersion, required Object serverVersion}) =>
            'アプリのアップデートをお願いします\n AppVersion: ${appVersion}\n ServerVersion: ${serverVersion}';
      case 'general.dismissible.snackBar':
        return '削除しました';
      case 'general.dismissible.confirmTitle':
        return '確認';
      case 'general.dismissible.confirmContent':
        return 'このアイテムを削除しますか?';
      case 'general.dismissible.buttonDelete':
        return '削除';
      case 'general.dismissible.buttonCancel':
        return 'キャンセル';
      case 'general.dismissible.backgroundText':
        return '削除';
      case 'schedules.abbBar':
        return 'スケジュール一覧';
      case 'schedules.description':
        return 'この画面で登録した支出・出費は、月初に自動登録されます';
      case 'schedules.expansionTile.expenseHeader':
        return '支出';
      case 'schedules.expansionTile.incomeHeader':
        return '収入';
      case 'transactions.abbBar':
        return '決済一覧';
      case 'transactions.incomeType.title':
        return '収入種別';
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
        return '品目';
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
      case 'charts.abbBar':
        return 'レポート';
      case 'charts.toggle.category':
        return 'カテゴリ';
      case 'charts.toggle.location':
        return '購入場所';
      case 'transactionAttributes.addTile.title':
        return ({required Object input}) => '\'${input}\' を追加';
      case 'transactionAttributes.addTile.subtitle':
        return 'タップして追加';
      case 'transactionAttributes.searchInputHint':
        return '入力して検索、追加';
      case 'transactionAttributes.floatingButton':
        return '新規追加';
      case 'transactionAttributes.category.appBar':
        return 'カテゴリー';
      case 'transactionAttributes.category.noEntry':
        return 'カテゴリー無し';
      case 'transactionAttributes.category.bottomSheetTitle':
        return 'カテゴリー追加';
      case 'transactionAttributes.category.bottomSheetInputLabel':
        return 'カテゴリー名';
      case 'transactionAttributes.category.settingsAdd':
        return '新規カテゴリー追加';
      case 'transactionAttributes.category.settingsListLabel':
        return '登録済みカテゴリー一覧';
      case 'transactionAttributes.category.deleteConfirmTitle':
        return 'カテゴリーを削除しますか？';
      case 'transactionAttributes.category.deleteConfirmContent':
        return 'カテゴリーを削除すると、同時にこのカテゴリーが登録されている支出からもカテゴリーが削除されます。';
      case 'transactionAttributes.location.appBar':
        return '購入場所';
      case 'transactionAttributes.location.noEntry':
        return '購入場所なし';
      case 'transactionAttributes.location.bottomSheetTitle':
        return '購入場所追加';
      case 'transactionAttributes.location.bottomSheetInputLabel':
        return '購入場所名';
      case 'transactionAttributes.location.settingsAdd':
        return '新規購入場所追加';
      case 'transactionAttributes.location.settingsListLabel':
        return '登録済み購入場所一覧';
      case 'transactionAttributes.location.deleteConfirmTitle':
        return '購入場所を削除しますか？';
      case 'transactionAttributes.location.deleteConfirmContent':
        return '購入場所を削除すると、同時にこの購入場所が登録されている支出からも購入場所が削除されます。';
      case 'transactionAttributes.incomeType.appBar':
        return '収入種別';
      case 'transactionAttributes.incomeType.noEntry':
        return 'NO INCOME TYPE';
      case 'transactionAttributes.incomeType.bottomSheetTitle':
        return '収入種別追加';
      case 'transactionAttributes.incomeType.bottomSheetInputLabel':
        return '収入種別名';
      case 'transactionAttributes.incomeType.settingsAdd':
        return '新規収入種別追加';
      case 'transactionAttributes.incomeType.settingsListLabel':
        return '登録済み収入種別一覧';
      case 'transactionAttributes.incomeType.deleteConfirmTitle':
        return '収入種別削除を削除しますか？';
      case 'transactionAttributes.incomeType.deleteConfirmContent':
        return '収入種別を削除します。(収入データで使用中の収入種別は削除できません)';
      case 'transactionAttributes.appBarSettings':
        return ({required Object title}) => '${title}設定';
      case 'transactionAttributes.settingsRename':
        return 'リネーム';
      case 'transactionAttributes.settingsDelete':
        return '削除';
      case 'transactionAttributes.settingsCancel':
        return 'キャンセル';
      case 'transactionAttributes.deleteConfirmation':
        return '本当に宜しいですか？この操作は取り消せません';
      case 'forms.errors.emptyTitle':
        return '品目が未入力です';
      case 'forms.errors.emptyAmount':
        return '金額が未入力です';
      case 'forms.errors.emptyAttributeName':
        return '名称が未入力です';
      default:
        return null;
    }
  }
}
