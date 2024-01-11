import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CrudScreen extends StatefulWidget {
  @override
  _CrudScreenState createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  List<dynamic> binStorageData = [];
  TextEditingController newKeyController = TextEditingController();
  TextEditingController newNameController = TextEditingController();
  TextEditingController newDataController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse(
          'https://tubes-4245e-default-rtdb.asia-southeast1.firebasedatabase.app/tubes.json'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> dataList = data.values.toList();
      setState(() {
        binStorageData = dataList;
      });
    } else {
      print('Failed to fetch data: ${response.statusCode}');
    }
  }

  Future<void> createData(String key, String newName, String newData) async {
    final response = await http.post(
      Uri.parse(
          'https://tubes-4245e-default-rtdb.asia-southeast1.firebasedatabase.app/tubes.json'),
      body: json.encode({'key': key, 'name': newName, 'data': newData}),
    );

    if (response.statusCode == 200) {
      print('Data created successfully');
      fetchData(); // Reload data after creating
    } else {
      print('Failed to create data: ${response.statusCode}');
    }
  }

  Future<void> deleteData(int index) async {
    if (binStorageData.isNotEmpty && index < binStorageData.length) {
      bool confirmDelete = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Confirm Deletion'),
            content: Text('Are you sure you want to delete this data?'),
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // Confirm delete
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), // Cancel delete
                child: Text('No'),
              ),
            ],
          );
        },
      );

      if (confirmDelete == true) {
        final response = await http.delete(
          Uri.parse(
              'https://tubes-4245e-default-rtdb.asia-southeast1.firebasedatabase.app/tubes/${index + 1}.json'),
        );

        if (response.statusCode == 200) {
          print('Data deleted successfully');
          fetchData(); // Reload data after deleting
        } else {
          print('Failed to delete data: ${response.statusCode}');
        }
      }
    } else {
      print('Invalid index or no data to delete');
    }
  }

  Future<void> updateData(int index) async {
    if (binStorageData.isNotEmpty && index < binStorageData.length) {
      TextEditingController newKeyController =
          TextEditingController(text: binStorageData[index]['key']);
      TextEditingController newNameController =
          TextEditingController(text: binStorageData[index]['name']);
      TextEditingController newDataController =
          TextEditingController(text: binStorageData[index]['data']);

      Map<String, dynamic>? updatedData = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update Data'),
            content: Column(
              children: [
                TextField(
                  onChanged: (value) {}, // Do not use onChanged in this case
                  controller: newKeyController,
                  decoration: InputDecoration(labelText: 'New Key'),
                ),
                TextField(
                  onChanged: (value) {}, // Do not use onChanged in this case
                  controller: newNameController,
                  decoration: InputDecoration(labelText: 'New Name'),
                ),
                TextField(
                  onChanged: (value) {}, // Do not use onChanged in this case
                  controller: newDataController,
                  decoration: InputDecoration(labelText: 'New Data'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(null), // Cancel update
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop({
                  'key': newKeyController.text,
                  'name': newNameController.text,
                  'data': newDataController.text
                }),
                child: Text('Update'),
              ),
            ],
          );
        },
      );

      if (updatedData != null) {
        String documentId = binStorageData[index]
            ['key']; // Use the actual Firebase-generated key for the document
        final response = await http.patch(
          Uri.parse(
              'https://tubes-4245e-default-rtdb.asia-southeast1.firebasedatabase.app/tubes/$documentId.json'),
          body: json.encode(updatedData),
        );

        if (response.statusCode == 200) {
          print('Data updated successfully');
          fetchData(); // Reload data after updating
        } else {
          print('Failed to update data: ${response.statusCode}');
        }
      }
    } else {
      print('Invalid index or no data to update');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data from API'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: newKeyController,
              decoration: InputDecoration(
                labelText: 'New Key',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: newNameController,
              decoration: InputDecoration(
                labelText: 'New Name',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: newDataController,
              decoration: InputDecoration(
                labelText: 'New Data',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              createData(newKeyController.text, newNameController.text,
                  newDataController.text);
            },
            child: Text('Create Data'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: binStorageData.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Data ${index + 1}: ${binStorageData[index]}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteData(index);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          updateData(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
