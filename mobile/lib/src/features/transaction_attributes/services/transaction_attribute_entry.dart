import 'package:suito/src/models/transaction_attribute.dart';

class AttributeEntry {
  final String? id;
  final String name;

  AttributeEntry(this.id, this.name);

  factory AttributeEntry.fromCategory(ExpenseCategory c) =>
      AttributeEntry(c.id, c.name);

  factory AttributeEntry.fromLocation(ExpenseLocation l) =>
      AttributeEntry(l.id, l.name);

  factory AttributeEntry.fromIncomeType(IncomeType t) =>
      AttributeEntry(t.id, t.name);

  @override
  String toString() {
    return name;
  }
}
