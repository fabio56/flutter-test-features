import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'indicator_controller.dart';
import 'indicator_data_source.dart';

class DashBoardWidget extends StatefulWidget {
  const DashBoardWidget({Key? key}) : super(key: key);

  @override
  State<DashBoardWidget> createState() => _DashBoardWidgetState();
}

class _DashBoardWidgetState extends State<DashBoardWidget> {
  late final dashBoardDataSource;
  final IndicatorController indicatorController = Get.put(IndicatorController());
  final DataGridController _dataGridController = DataGridController();

  @override
  void initState() {
    dashBoardDataSource = indicatorController.indicatorDataSource;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (dashBoardDataSource == null ){
      return Center(child: CircularProgressIndicator(),);
    }else{
      return SfDataGrid(
          navigationMode: GridNavigationMode.cell,
          isScrollbarAlwaysShown: true,
          controller: _dataGridController,
          shrinkWrapColumns: true,
          shrinkWrapRows: true,
          selectionMode: SelectionMode.singleDeselect,
          columnResizeMode: ColumnResizeMode.onResizeEnd,
          columnWidthMode: ColumnWidthMode.lastColumnFill,
          gridLinesVisibility: GridLinesVisibility.horizontal,
          source: dashBoardDataSource,
          columns: buildGridColumns()
      );
    }
  }

  List<GridColumn> buildGridColumns() {
    return [
      GridColumn(
          columnName: DashBordColumnName.id.toString(),
          width: 150,
          visible: true,
          label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: buildLabel("ID"))),
      GridColumn(
          columnName: DashBordColumnName.name.toString(),
          label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: buildLabel('Name'))),
      GridColumn(
          columnName: DashBordColumnName.designation.toString(),
          width: 120,
          label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: buildLabel('Designation'))),
      GridColumn(
          columnName: DashBordColumnName.salary.toString(),
          columnWidthMode: ColumnWidthMode.auto,
          label: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: buildLabel('Salary')))
    ];
  }

  Widget buildLabel(String text){
    return Text(text);
  }
}
