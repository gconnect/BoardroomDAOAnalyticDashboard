import 'package:boardroom_analytic/custom_table_page.dart';
import 'package:boardroom_analytic/viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'models/protocols.dart';

class TableWidget extends StatefulWidget {
  @override
  _TableWidgetState createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  var viewModel = BoardRoomViewModel();
  List<Data> protocolData = [];
  late final ProtocolsDataSource protocolsDataSource;

  @override
  void initState() {
    super.initState();
    viewModel.loadProtocols();
    protocolsDataSource = ProtocolsDataSource(protocols: protocolData);
  }

  @override
  Widget build(BuildContext context) {
    print("data ${viewModel.protocols?.data?.length}");

    if (protocolsDataSource == null) {
      return CircularProgressIndicator();
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
              columnName: 'PROPOSALS',
              width: 120,
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerLeft,
                  child: Text('PROPOSALS'))),
          GridColumn(
              columnName: 'VOTES',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerRight,
                  child: Text('VOTES'))),
          GridColumn(
              columnName: 'PRICE',
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.centerRight,
                  child: Text('PRICE'))),
        ],
      );
    }
  }
}
