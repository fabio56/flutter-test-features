import 'package:get/get.dart';
import 'package:test_features/data_table/indicator_data_source.dart';
import 'package:test_features/data_table/indicator_model.dart';

import 'data.dart';

class IndicatorController extends GetxController{
  IndicatorDataSource? indicatorDataSource;
  List<IndicatorModel> indicators = [];

  Future loadIndicators() async{
    Future.delayed(Duration(seconds: 10));
    this.indicators = indicatorsData;
    this.indicatorDataSource = IndicatorDataSource(indicators: indicators);
  }

  @override
  onInit() async {
    loadIndicators();
    super.onInit();
  }
}