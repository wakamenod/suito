import 'package:suito/i18n/translations.g.dart';

abstract class TransactionAttributeWords {
  String appBar();
  String bottomSheetTitle();
  String bottomSheetTextInputLabel();
}

class CategoryAttributesWords implements TransactionAttributeWords {
  @override
  String bottomSheetTextInputLabel() {
    return t.transactionAttributes.category.bottomSheetInputLabel;
  }

  @override
  String bottomSheetTitle() {
    return t.transactionAttributes.category.bottomSheetTitle;
  }

  @override
  String appBar() {
    return t.transactionAttributes.category.appBar;
  }
}

class LocationAttributesWords implements TransactionAttributeWords {
  @override
  String bottomSheetTextInputLabel() {
    return t.transactionAttributes.location.bottomSheetInputLabel;
  }

  @override
  String bottomSheetTitle() {
    return t.transactionAttributes.location.bottomSheetTitle;
  }

  @override
  String appBar() {
    return t.transactionAttributes.location.appBar;
  }
}

class IncomeTypeAttributesWords implements TransactionAttributeWords {
  @override
  String bottomSheetTextInputLabel() {
    return t.transactionAttributes.incomeType.bottomSheetInputLabel;
  }

  @override
  String bottomSheetTitle() {
    return t.transactionAttributes.incomeType.bottomSheetTitle;
  }

  @override
  String appBar() {
    return t.transactionAttributes.incomeType.appBar;
  }
}
