import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomListView extends StatefulWidget {
  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List<Map<String, dynamic>> _earthquakeData = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
        Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json'));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      setState(() {
        _earthquakeData =
            List<Map<String, dynamic>>.from(decodedData['Infogempa']['gempa']);
      });
    } else {
      throw Exception('Failed to load earthquake data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMKG Earthquake Data'),
      ),
      body: _earthquakeData.isNotEmpty
          ? ListView.builder(
              itemCount: _earthquakeData.length,
              itemBuilder: (context, index) {
                final earthquake = _earthquakeData[index];
                return ListTile(
                  title: Text('Magnitude: ${earthquake['Magnitude']}'),
                  subtitle: Text('Location: ${earthquake['Wilayah']}'),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
