import 'package:flutter/material.dart';

class PillsInputForm extends StatefulWidget {
  @override
  _PillsInputFormState createState() => _PillsInputFormState();
}

class _PillsInputFormState extends State<PillsInputForm> {
  String _pillName = 'Oxycodone';
  int _pillAmount = 2;
  int _days = 30;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pills name', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Pill name',
              suffixIcon: Icon(Icons.qr_code),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            controller: TextEditingController(text: _pillName),
          ),
          SizedBox(height: 24),
          Text('Amount & How long?', style: TextStyle(fontSize: 16)),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<int>(
                  value: _pillAmount,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: List.generate(10, (index) => index + 1)
                      .map((e) => DropdownMenuItem<int>(
                            value: e,
                            child: Text('$e pills'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _pillAmount = value!;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField<int>(
                  value: _days,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  items: List.generate(60, (index) => index + 1)
                      .map((e) => DropdownMenuItem<int>(
                            value: e,
                            child: Text('$e days'),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _days = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
