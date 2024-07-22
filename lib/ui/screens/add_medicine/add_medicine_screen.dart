import 'package:flutter/material.dart';
import 'package:scheduled_health/ui/theme/app_spacings.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

class AddMedicineScreen extends StatefulWidget {
  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  String _pillName = 'Oxycodone';
  int _pillAmount = 2;
  int _days = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.gray100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacings.lg_40,
            horizontal: AppSpacings.sm_24,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pills name', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  focusColor: context.colors.gray600,
                  filled: true,
                  fillColor: context.colors.gray200,
                  hintText: 'Pill name',
                  suffixIcon: Icon(Icons.qr_code),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFF8F8F6),
                    ),
                    borderRadius: BorderRadius.circular(16.0),
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
        ),
      ),
    );
  }
}
