import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class JapaneseCupertinoLocalizations implements CupertinoLocalizations {
  final _materialDelegate = GlobalMaterialLocalizations.delegate;

  late MaterialLocalizations materialLocalizations;

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _JapaneseDelegate();

  static Future<CupertinoLocalizations> load(Locale locale) async {
    var localizations = JapaneseCupertinoLocalizations();
    await localizations._init();
    return SynchronousFuture<CupertinoLocalizations>(localizations);
  }

  Future _init() async {
    materialLocalizations = await _materialDelegate.load(const Locale('ja'));
  }

  @override
  String get alertDialogLabel => materialLocalizations.alertDialogLabel;

  @override
  String get anteMeridiemAbbreviation =>
      materialLocalizations.anteMeridiemAbbreviation;

  @override
  String get copyButtonLabel => materialLocalizations.copyButtonLabel;

  @override
  String get cutButtonLabel => materialLocalizations.cutButtonLabel;

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.ymd;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_time_dayPeriod;

  @override
  String datePickerHour(int hour) => hour.toString().padLeft(2, "0");

  @override
  String datePickerHourSemanticsLabel(int hour) => "$hour時";

  @override
  String datePickerMediumDate(DateTime date) =>
      materialLocalizations.formatMediumDate(date);

  @override
  String datePickerMinute(int minute) => minute.toString().padLeft(2, '0');

  @override
  String datePickerMinuteSemanticsLabel(int minute) => "$minute分";

  @override
  String datePickerMonth(int monthIndex) => "$monthIndex月";

  @override
  String datePickerYear(int yearIndex) => "${yearIndex.toString()}年";

  @override
  String get pasteButtonLabel => materialLocalizations.pasteButtonLabel;

  @override
  String get postMeridiemAbbreviation =>
      materialLocalizations.postMeridiemAbbreviation;

  @override
  String get selectAllButtonLabel => materialLocalizations.selectAllButtonLabel;

  @override
  String timerPickerHour(int hour) => hour.toString().padLeft(2, "0");

  @override
  String timerPickerHourLabel(int hour) =>
      "${hour.toString().padLeft(2, '0')}時";

  @override
  String timerPickerMinute(int minute) => minute.toString().padLeft(2, "0");

  @override
  String timerPickerMinuteLabel(int minute) =>
      "${minute.toString().padLeft(2, '0')}分";

  @override
  String timerPickerSecond(int second) => second.toString().padLeft(2, "0");

  @override
  String timerPickerSecondLabel(int second) =>
      "${second.toString().padLeft(2, '0')}秒";

  @override
  // TODO: implement modalBarrierDismissLabel
  String get modalBarrierDismissLabel => throw UnimplementedError();

  @override
  // TODO: implement noSpellCheckReplacementsLabel
  String get noSpellCheckReplacementsLabel => throw UnimplementedError();

  @override
  // TODO: implement searchTextFieldPlaceholderLabel
  String get searchTextFieldPlaceholderLabel => throw UnimplementedError();

  @override
  String tabSemanticsLabel({required int tabIndex, required int tabCount}) {
    // TODO: implement tabSemanticsLabel
    throw UnimplementedError();
  }

  @override
  // TODO: implement timerPickerHourLabels
  List<String> get timerPickerHourLabels => throw UnimplementedError();

  @override
  // TODO: implement timerPickerMinuteLabels
  List<String> get timerPickerMinuteLabels => throw UnimplementedError();

  @override
  // TODO: implement timerPickerSecondLabels
  List<String> get timerPickerSecondLabels => throw UnimplementedError();

  @override
  // TODO: implement todayLabel
  String get todayLabel => throw UnimplementedError();

  @override
  String datePickerDayOfMonth(int dayIndex, [int? weekDay]) {
    if (weekDay != null) {
      return '$dayIndex (${shortWeekdays[weekDay - DateTime.monday]})';
    }

    return dayIndex.toString();
  }
}

const shortWeekdays = <String>[
  '月',
  '火',
  '水',
  '木',
  '金',
  '土',
  '日',
];

class _JapaneseDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const _JapaneseDelegate();

  @override
  bool isSupported(Locale locale) {
    return locale.languageCode == 'ja';
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return JapaneseCupertinoLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<CupertinoLocalizations> old) {
    return false;
  }
}
