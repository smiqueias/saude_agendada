import 'package:flutter/material.dart';
import 'package:scheduled_health/ui/theme/app_spacings.dart';
import 'package:scheduled_health/ui/widgets/form_add_medicine.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

import '../../widgets/notification_saved.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  TimeOfDay selectedTimeNow = TimeOfDay.now();
  final List<TimeOfDay> _listNotificationSaved = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        appBar: AppBar(
          backgroundColor: context.colors.gray100,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: context.colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: AppSpacings.xxxs_8,
              left: AppSpacings.sm_24,
              right: AppSpacings.sm_24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adicionar Medicamento',
                  style: context.typography.textLarge,
                ),
                const SizedBox(height: AppSpacings.xs_16),
                const Text('Medicamento'),
                FormAddMedicine(
                  hintText: 'Digite o nome do medicamento',
                  iconForm: Icon(
                    Icons.assignment,
                    color: context.colors.greenSplash,
                  ),
                ),
                const SizedBox(height: AppSpacings.xxs_8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Quantidade'),
                          FormAddMedicine(
                            hintText: 'Quantidade',
                            keyboardType: TextInputType.number,
                            iconForm: Icon(Icons.medication,
                                color: context.colors.greenSplash),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppSpacings.xxs_8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Período'),
                          FormAddMedicine(
                            keyboardType: TextInputType.number,
                            hintText: 'Período',
                            iconForm: Icon(
                              Icons.schedule,
                              color: context.colors.greenSplash,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacings.xs_16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Notificações',
                      style: context.typography.button,
                    ),
                    TextButton(
                      onPressed: () async {
                        final TimeOfDay? savedTime = await showTimePicker(
                          context: context,
                          initialTime: selectedTimeNow,
                          builder: (BuildContext context, Widget? child) {
                            return MediaQuery(
                              data: MediaQuery.of(context)
                                  .copyWith(alwaysUse24HourFormat: true),
                              child: child ?? Container(),
                            );
                          },
                        );
                        if (savedTime != null) {
                          setState(() {
                            selectedTimeNow = savedTime;
                            _listNotificationSaved.add(selectedTimeNow);
                          });
                        }
                      },
                      child: Text(
                        '+',
                        style: context.typography.textMd
                            .copyWith(color: context.colors.greenSplash),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: _listNotificationSaved.length,
                    itemBuilder: (context, index) {
                      return NotificationSaved(
                        notificationTime: _listNotificationSaved[index],
                        onDelete: () {
                          setState(
                            () {
                              _listNotificationSaved.removeAt(index);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacings.xs_16),
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: WidgetStateProperty.all<double>(2.0),
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text('Adicionar'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
