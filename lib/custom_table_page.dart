import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import 'models/protocols.dart';

class ProtocolsDataSource extends DataGridSource {
  ProtocolsDataSource({required List<Data>? protocols}) {
    _protocols = protocols!
        .map<DataGridRow>((p) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'LOGO', value: p.icons?[0].url),
              DataGridCell<String>(
                  columnName: 'NAME', value: p.name.toString()),
              DataGridCell<num>(
                  columnName: 'TOKEN PRICE',
                  value: p.tokens?[0].marketPrices?[0].price),
              DataGridCell<num>(columnName: 'VOTES', value: p.totalVotes),
              DataGridCell<num>(
                  columnName: 'PROPOSAL', value: p.totalProposals),
            ]))
        .toList();
  }

  List<DataGridRow> _protocols = [];

  @override
  List<DataGridRow> get rows => _protocols;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      if (dataGridCell.columnName == "LOGO") {
        return buildIdIcon(dataGridCell.value);
      }
      return Container(
        alignment: (dataGridCell.columnName == 'LOGO' ||
                dataGridCell.columnName == 'NAME')
            ? Alignment.centerRight
            : Alignment.centerLeft,
        padding: EdgeInsets.all(16.0),
        child: Text(dataGridCell.value.toString()),
      );
    }).toList());
  }

  Widget buildIdIcon(String? logo) => Container(
        padding: EdgeInsets.all(12.0),
        child: Image.network(
          logo ?? "",
          height: 100,
          width: 100,
        ),
      );
}
