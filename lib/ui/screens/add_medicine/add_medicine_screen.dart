import 'package:flutter/material.dart';
import 'package:scheduled_health/ui/screens/add_medicine/add_medicine_view_model.dart';
import 'package:scheduled_health/ui/theme/app_spacings.dart';
import 'package:scheduled_health/ui/widgets/form_add_medicine.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

import '../../widgets/notification_saved.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _formKey = GlobalKey<FormState>();
  late AddMedicineViewModel addMedicineViewModel;

  @override
  void initState() {
    addMedicineViewModel = AddMedicineViewModel();
    super.initState();
  }

  @override
  void dispose() {
    addMedicineViewModel.dispose();
    super.dispose();
  }

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
              top: AppSpacings.xxs_4,
              left: AppSpacings.sm_24,
              right: AppSpacings.sm_24,
            ),
            child: ListenableBuilder(
              listenable: addMedicineViewModel,
              builder: (context, child) {
                return Column(
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
                              initialTime: addMedicineViewModel.selectedTimeNow,
                              builder: (BuildContext context, Widget? child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context)
                                      .copyWith(alwaysUse24HourFormat: true),
                                  child: child ?? Container(),
                                );
                              },
                            );
                            addMedicineViewModel.addNotification(savedTime);
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
                        itemCount:
                            addMedicineViewModel.listNotificationSaved.length,
                        itemBuilder: (context, index) {
                          return NotificationSaved(
                            index: index,
                            addMedicineViewModel: addMedicineViewModel,
                            notificationTime: addMedicineViewModel
                                .listNotificationSaved[index],
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
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
