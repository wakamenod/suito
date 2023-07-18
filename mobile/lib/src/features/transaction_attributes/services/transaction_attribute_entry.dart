import 'package:openapi/openapi.dart';

class AttributeEntry {
  final String? id;
  final String name;

  AttributeEntry(this.id, this.name);

  factory AttributeEntry.fromCategory(ModelExpenseCategory c) =>
      AttributeEntry(c.id, c.name);

  factory AttributeEntry.fromLocation(ModelExpenseLocation l) =>
      AttributeEntry(l.id, l.name);

  factory AttributeEntry.fromIncomeType(ModelIncomeType t) =>
      AttributeEntry(t.id, t.name);

  @override
  String toString() {
    return name;
  }
}
