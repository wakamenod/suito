import 'package:openapi/openapi.dart';

abstract class AttributeEntry {
  String get name;
  String? get id;
}

class ExpenseCategoryAsAttributeEntry implements AttributeEntry {
  final ModelExpenseCategory category;

  ExpenseCategoryAsAttributeEntry(this.category);

  @override
  String get name => category.name;

  @override
  String? get id => category.id;
}

class ExpenseLocationAsAttributeEntry implements AttributeEntry {
  final ModelExpenseLocation location;

  ExpenseLocationAsAttributeEntry(this.location);

  @override
  String get name => location.name;

  @override
  String? get id => location.id;
}

class IncomeTypeAsAttributeEntry implements AttributeEntry {
  final ModelIncomeType incomeType;

  IncomeTypeAsAttributeEntry(this.incomeType);

  @override
  String get name => incomeType.name;

  @override
  String? get id => incomeType.id;
}
