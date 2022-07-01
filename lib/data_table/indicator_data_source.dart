import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'indicator_model.dart';

enum DashBordColumnName { id, name, designation, salary }

class IndicatorDataSource extends DataGridSource {
  late List<DataGridRow> _indicators;

  @override
  List<DataGridRow> get rows => _indicators;

  IndicatorDataSource({required List<IndicatorModel> indicators}){
    buildDataGrid(indicators);
  }

  void buildDataGrid(List<IndicatorModel> indicators) {
    _indicators = indicators.map<DataGridRow>((indicator) => DataGridRow(
      cells: DashBordColumnName.values.map(
              (column) => DataGridCell<IndicatorModel>(
                  columnName: column.toString(),
                  value: indicator
              )).toList(),
    )).toList();
  }

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>(
                (dataGridCell) {
                  final IndicatorModel indicatorModel = dataGridCell.value;
                  final column = DashBordColumnName.values.firstWhere(
                          (value) => value.toString()==dataGridCell.columnName);
                  switch(column){
                    case DashBordColumnName.id:
                      return buildIdRow(indicatorModel);
                    default :
                      return Container(
                          color: !indicatorModel.id.isOdd ? Color(0xEFFEDCCA):null,
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.all(16.0),
                          child: const Text("Hello",)
                      );
                  }
                }
        ).toList()
    );
  }

  Widget buildIdRow(IndicatorModel indicator){
    return Container(
      color: !indicator.id.isOdd ? Color(0xEFFEDCCA):null,
      padding: EdgeInsets.all(16),
      child: Row(
        children:[
          const CircleAvatar(
              backgroundColor: Colors.yellow,
              child: FlutterLogo()
          ),
          Text("${indicator.id}",overflow: TextOverflow.ellipsis,),
        ],
      ),
    );
  }
}
