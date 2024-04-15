import 'package:flutter/material.dart';
import 'general_request.dart';

class AddRequest extends StatefulWidget {
  final Map<String, String>? initialValues;
  final Function(Map<String, String>) onAddRequest;
  final List<Map<String, String>> filteredRows;

  const AddRequest({
    super.key, // Corrected super.key to Key? key
    this.initialValues,
    required this.onAddRequest,
    required this.filteredRows,
  }); // Moved super call here

  @override
  State<AddRequest> createState() => _AddRequestState();
}

class _AddRequestState extends State<AddRequest> {
  final TextEditingController _textEditingController = TextEditingController();
  String? _selectedOptionRequestTo = '-1';
  String? _selectedOptionRequestType = '-1';

  int _calculateSerialNumber() {
    return widget.filteredRows.length + 1;
  }

  List<Map<String, String>> tableData = []; // New list to hold table data

  @override
  Widget build(BuildContext context) {
    int serial = _calculateSerialNumber();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          '+General Request',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Name: Fortius Infocom',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Request To:',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60,
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: _selectedOptionRequestTo,
                  items: const [
                    DropdownMenuItem(value: '-1', child: Text('-Select-')),
                    DropdownMenuItem(value: '1', child: Text('Account Department')),
                    DropdownMenuItem(value: '2', child: Text('IT Department')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionRequestTo = value.toString();
                    });
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Request Type:',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 60,
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  value: _selectedOptionRequestType,
                  items: const [
                    DropdownMenuItem(value: '-1', child: Text('-Request Type-')),
                    DropdownMenuItem(value: '1', child: Text('Courier')),
                    DropdownMenuItem(value: '2', child: Text('Route Change')),
                    DropdownMenuItem(value: '3', child: Text('Cheque Deposit')),
                    DropdownMenuItem(value: '4', child: Text('Local Cash Collection')),
                    DropdownMenuItem(value: '5', child: Text('Other')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedOptionRequestType = value!;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 5,),
            if (_selectedOptionRequestType != '-1' && _selectedOptionRequestType != '1' && _selectedOptionRequestType != '2' && _selectedOptionRequestType != '3' && _selectedOptionRequestType != '4')
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 55,
                  child: TextFormField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Other',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Request Details',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'Type Somethings.....',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                onPressed: () {
                  // Add data to the table when button is clicked
                  setState(() {
                    tableData.add({
                      'selectedOptionRequestTo': _selectedOptionRequestTo!,
                      'selectedOptionRequestType': _selectedOptionRequestType!,
                      'details': _textEditingController.text,
                    });
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Contact Us',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            // Display the table here using the tableData list
            // You can use ListView.builder or DataTable widgets to display the table
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
