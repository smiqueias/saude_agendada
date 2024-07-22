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
  final List<NotificationSaved> _listNotificationSaved = [];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: context.colors.gray100,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: AppSpacings.lg_40,
                horizontal: AppSpacings.sm_24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Adicionar Medicamento',
                    style: context.typography.textLarge,
                  ),
                  const SizedBox(height: AppSpacings.xs_16),
                  FormAddMedicine(
                    hintText: 'Nome do medicamento',
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
                        child: FormAddMedicine(
                          hintText: 'Quantidade',
                          keyboardType: TextInputType.number,
                          iconForm: Icon(Icons.medication,
                              color: context.colors.greenSplash),
                        ),
                      ),
                      const SizedBox(width: AppSpacings.xxs_8),
                      Expanded(
                        child: FormAddMedicine(
                          keyboardType: TextInputType.number,
                          hintText: 'Período',
                          iconForm: Icon(
                            Icons.schedule,
                            color: context.colors.greenSplash,
                          ),
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
                          final TimeOfDay? timeOfDay = await showTimePicker(
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
                          if (timeOfDay != null) {
                            setState(() {
                              selectedTimeNow = timeOfDay;
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
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: AppSpacings.xs_16,
                      top: AppSpacings.xxxs_8,
                    ),
                    child: Divider(
                      color: context.colors.black,
                      height: 1,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _listNotificationSaved.length,
                    itemBuilder: (context, index) {
                      return NotificationSaved();
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('text'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
