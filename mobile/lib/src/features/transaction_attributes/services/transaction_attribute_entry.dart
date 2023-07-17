import 'package:openapi/openapi.dart';

class AttributeEntry {
  final String? id;
  final String name;

  AttributeEntry(this.id, this.name);

  @override
  String toString() {
    return name;
  }
}

class ExpenseCategoryAsAttributeEntry implements AttributeEntry {
  final ModelExpenseCategory category;

  ExpenseCategoryAsAttributeEntry(this.category);

  @override
  String get name => category.name;

  @override
  String? get id => category.id;

  @override
  String toString() {
    return name;
  }
}

class ExpenseLocationAsAttributeEntry implements AttributeEntry {
  final ModelExpenseLocation location;

  ExpenseLocationAsAttributeEntry(this.location);

  @override
  String get name => location.name;

  @override
  String? get id => location.id;

  @override
  String toString() {
    return name;
  }
}

class IncomeTypeAsAttributeEntry implements AttributeEntry {
  final ModelIncomeType incomeType;

  IncomeTypeAsAttributeEntry(this.incomeType);

  @override
  String get name => incomeType.name;

  @override
  String? get id => incomeType.id;

  @override
  String toString() {
    return name;
  }
}
