import 'package:flutter/material.dart';
import 'add_general_request.dart';

class GeneralRequest extends StatefulWidget {
  const GeneralRequest({super.key});

  @override
  State<GeneralRequest> createState() => _GeneralRequestState();
}

class _GeneralRequestState extends State<GeneralRequest> {
  final List<Map<String, String>> _tableRows = [];

  List<Map<String, String>> _filteredRows = [];

  @override
  void initState() {
    _filteredRows = _tableRows;
    super.initState();
  }

  void _filterRows(String query) {
    setState(() {
      _filteredRows = _tableRows.where((row) {
        final serial = row['S.No.']!.toLowerCase();
        final requestBy = row['Request By']!.toLowerCase();
        final requestType = row['Request type']!.toLowerCase();
        final request = row['Request']!.toLowerCase();
        return requestBy.contains(query.toLowerCase()) ||
            requestType.contains(query.toLowerCase()) ||
            request.contains(query.toLowerCase()) ||
            serial.contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('General Request'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(left: 220),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddRequest(
                        onAddRequest: (Map<String, String> newRow) {
                          setState(() {
                            _tableRows.add(newRow);
                            _filteredRows = _tableRows;
                          });
                        },
                        filteredRows: const [],
                      ),
                    ),
                  );
                },
                child: const Text(
                  '+General Request',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: TextFormField(
                onChanged: _filterRows,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Search here',
                  suffixIcon: IconButton(
                    onPressed: () {
                      _filterRows('');
                    },
                    icon: const Icon(Icons.search),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: Scrollbar(
                thumbVisibility: true,
                radius: const Radius.circular(4),
                thickness: 8,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Table(
                      border: TableBorder.all(),
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      columnWidths: const {
                        0: FixedColumnWidth(40),
                        1: FixedColumnWidth(60),
                        2: FixedColumnWidth(60),
                        3: FixedColumnWidth(80),
                        4: FixedColumnWidth(60),
                        5: FixedColumnWidth(58),
                        6: FixedColumnWidth(45),
                      },
                      children: [
                        const TableRow(
                          children: [
                            TableCell(child: Center(child: Text('S.No.', textAlign: TextAlign.center))),
                            TableCell(child: Center(child: Text('Request By', textAlign: TextAlign.center))),
                            TableCell(child: Center(child: Text('Request type', textAlign: TextAlign.center))),
                            TableCell(child: Center(child: Text('Request', textAlign: TextAlign.center))),
                            TableCell(child: Center(child: Text('Created on', textAlign: TextAlign.center))),
                            TableCell(child: Center(child: Text('Status', textAlign: TextAlign.center))),
                            TableCell(child: Center(child: Text('Action', textAlign: TextAlign.center))),
                          ],
                        ),
                        for (var row in _filteredRows)
                          TableRow(
                            children: [
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(child: Text(row['S.No.']!, textAlign: TextAlign.center)),
                              ),
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(child: Text(row['Request By']!, textAlign: TextAlign.center)),
                              ),
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(child: Text(row['Request type']!, textAlign: TextAlign.center)),
                              ),
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(child: Text(row['Request']!, textAlign: TextAlign.center)),
                              ),
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(child: Text(row['Created on']!, textAlign: TextAlign.center)),
                              ),
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Center(child: Text(row['Status']!, textAlign: TextAlign.center)),
                              ),
                              TableCell(
                                verticalAlignment: TableCellVerticalAlignment.middle,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        _editRow(row); // Edit row
                                      },
                                      icon: const Icon(Icons.edit, color: Colors.blue),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _deleteRow(row); // Delete row
                                      },
                                      icon: const Icon(Icons.delete, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to edit a row
  void _editRow(Map<String, String> row) async {
    final editedRow = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddRequest(
          initialValues: row,
          onAddRequest: (Map<String, String> newRow) {
            setState(() {
              final index = _tableRows.indexOf(row);
              _tableRows[index] = newRow; // Update the row
              _filteredRows = List.from(_tableRows); // Update filtered rows
            });
          },
          filteredRows: const [],
        ),
      ),
    );
    if (editedRow != null) {
      setState(() {
        final index = _tableRows.indexOf(row);
        _tableRows[index] = editedRow; // Update the row
        _filteredRows = List.from(_tableRows); // Update filtered rows
      });
    }
  }

  // Method to delete a row
  void _deleteRow(Map<String, String> row) {
    setState(() {
      _tableRows.remove(row); // Remove row
      _filteredRows = List.from(_tableRows); // Update filtered rows
    });
  }
}
