import 'package:suito/i18n/translations.g.dart';

abstract class TransactionAttributeWords {
  String appBar();
  String bottomSheetTitle();
  String bottomSheetTextInputLabel();
  String settingsAddTile();
  String settingsListLabel();
  String deleteConfirmTitle();
  String deleteConfirmContent();
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

  @override
  String settingsAddTile() {
    return t.transactionAttributes.category.settingsAdd;
  }

  @override
  String settingsListLabel() {
    return t.transactionAttributes.category.settingsListLabel;
  }

  @override
  String deleteConfirmTitle() {
    return t.transactionAttributes.category.deleteConfirmTitle;
  }

  @override
  String deleteConfirmContent() {
    return t.transactionAttributes.category.deleteConfirmContent;
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

  @override
  String settingsAddTile() {
    return t.transactionAttributes.location.settingsAdd;
  }

  @override
  String settingsListLabel() {
    return t.transactionAttributes.location.settingsListLabel;
  }

  @override
  String deleteConfirmTitle() {
    return t.transactionAttributes.location.deleteConfirmTitle;
  }

  @override
  String deleteConfirmContent() {
    return t.transactionAttributes.location.deleteConfirmContent;
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

  @override
  String settingsAddTile() {
    return t.transactionAttributes.incomeType.settingsAdd;
  }

  @override
  String settingsListLabel() {
    return t.transactionAttributes.incomeType.settingsListLabel;
  }

  @override
  String deleteConfirmTitle() {
    return t.transactionAttributes.incomeType.deleteConfirmTitle;
  }

  @override
  String deleteConfirmContent() {
    return t.transactionAttributes.incomeType.deleteConfirmContent;
  }
}
