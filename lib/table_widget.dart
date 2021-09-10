import 'package:boardroom_analytic/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BoardRoomViewModel>(context);
    final protocolsDataSource = provider.protocolsDataSource;
    if (protocolsDataSource == null) {
      return Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircularProgressIndicator()),
          Text("Loading Protocols")
        ],
      ));
    } else {
      return SfDataGrid(
        source: protocolsDataSource,
        allowSorting: true,
        defaultColumnWidth: 80,
        frozenColumnsCount: 1,
        allowPullToRefresh: true,
        allowSwiping: true,
        columns: <GridColumn>[
          GridColumn(
              visible: true,
              columnName: 'LOGO',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerRight,
                  child: Text(
                    'LOGO',
                  ))),
          GridColumn(
              columnName: 'NAME',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerLeft,
                  child: Text('NAME'))),
          GridColumn(
              columnName: 'PRICE',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerRight,
                  child: Text('PRICE'))),
          GridColumn(
              columnName: 'VOTES',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerRight,
                  child: Text('VOTES'))),
          GridColumn(
              columnName: 'PROPOSALS',
              width: 120,
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerLeft,
                  child: Text('PROPOSALS'))),
        ],
      );
    }
  }
}
