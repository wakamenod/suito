import 'package:flutter/material.dart';

final kFakePieChartCategoryData = [
  FakePieChartData("交通費", 12000),
  FakePieChartData("食費", 72000),
  FakePieChartData("教育費", 102000),
  FakePieChartData("通信量", 42000),
];

final kFakePieChartLocationData = [
  FakePieChartData("アマゾン", 42000),
  FakePieChartData("コンビニ", 22000),
  FakePieChartData("スーパ", 92000),
];

class FakePieChartData {
  final String name;
  final int amount;

  FakePieChartData(this.name, this.amount);
}

class GetPieChartDataRes {
  final List<FakePieChartData> categoryData;
  final List<FakePieChartData> locationData;

  GetPieChartDataRes(this.categoryData, this.locationData);
}

class FakePieChartDataRepository {
  Future<GetPieChartDataRes> fetchFakePieChartData(
      DateTimeRange dateRange) async {
    return Future.value(GetPieChartDataRes(
        kFakePieChartCategoryData, kFakePieChartLocationData));
  }
}
