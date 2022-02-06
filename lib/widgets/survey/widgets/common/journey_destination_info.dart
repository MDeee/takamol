import 'package:enum_to_string/enum_to_string.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/distance_helper.dart';
import 'package:takamol_app/helpers/validator.dart';
import 'package:takamol_app/providers/survey.dart';

import '/models/survey.dart';
import '/widgets/common/dropdown_form_input.dart';
import '/widgets/common/toggle_buttons_form_input.dart';

class JourneyDestinationInfoWidget extends StatelessWidget {
  const JourneyDestinationInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveyProvider survey = Provider.of<SurveyProvider>(context, listen: false);

    final format = DateFormat("يوم dd MMM yyyy الساعة hh:mm a");
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "مقصد الرحلة",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Consumer<SurveyProvider>(builder: (ctx, s, c) {
              print(s.journeyStartLocationTravelTarget);
              return ToggleButtonsFormInput(
                autovalidateMode: s.journeyEndLocationTravelTarget == null
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.always,
                label: const Text("هل ذاهب الي "),
                choices: [
                  ToggleButtonsFormInput.createChoice(
                    text: "المنزل",
                  ),
                  ToggleButtonsFormInput.createChoice(
                    text: "عودة إلي المنزل",
                  ),
                  ToggleButtonsFormInput.createChoice(
                    text: "أخري",
                  ),
                ],
                onChange: (int? i) {
                  s.journeyEndLocationTravelTarget = TravelTarget.values[i!];
                },
                validator: (int? i) => Validator.validateChoices(
                  value: i,
                  refused: s.journeyStartLocationTravelTarget == null ||
                          s.journeyStartLocationTravelTarget ==
                              TravelTarget.other
                      ? [null]
                      : [null, s.journeyStartLocationTravelTarget!.index],
                  message: "يجب اعطاء اجابة صحيحة",
                ),
              );
            }),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("اسم المدينة/القريبة"),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) => Validator.validateEmpty(
                value: value,
                message: "يجب اعطاء اجابة",
              ),
              onChanged: (String? s) {
                survey.journeyEndLocationName = s!;
              },
              onEditingComplete: () {
                if (!Distance.city_exists(survey.journeyEndLocationName ?? ""))
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("لا يوجد معلومات عن هذه المدينة"),
                      duration: Duration(seconds: 3),
                      elevation: 1,
                    ),
                  );
              },
            ),
            const SizedBox(height: 10),
            DropDownFormInput(
              hint: const Text(
                "اجرة/طائرة/قطار/إلخ.",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              label: const Text("وسيلة النقل في العودة:"),
              options: const <TransportType, Widget>{
                TransportType.carDriver: Text("سيارة كسائق"),
                TransportType.carPassanger: Text("سيارة كراكب"),
                TransportType.taxi: Text("أجرة"),
                TransportType.plane: Text("طائرة"),
                TransportType.crossCityVan: Text("حافلة بين المدن"),
                TransportType.train: Text("قطار"),
                TransportType.other: Text("أخرى"),
              },
              onChange: (TransportType? p) {
                survey.journeyBackType =
                    EnumToString.convertToString(p, camelCase: true);
              },
              validator: (TransportType? value) => Validator.validateChoice(
                value: value,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
            ),
            Consumer<SurveyProvider>(
              builder: (ctx, s, c) {
                return s.journeyBackType ==
                        EnumToString.convertToString(
                          TransportType.other,
                          camelCase: true,
                        )
                    ? Column(children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            label: Text("أخرى (وسيلة النقل)"),
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          validator: (String? value) => Validator.validateEmpty(
                            value: value,
                            message: "يجب اعطاء اجابة",
                          ),
                          onSaved: (String? s) {
                            survey.journeyBackType += " - $s";
                          },
                        ),
                      ])
                    : SizedBox.shrink();
              },
            ),
            const SizedBox(height: 10),
            DateTimeField(
              format: format,
              decoration: const InputDecoration(
                label: Text("العودة المتوقعة"),
                icon: Icon(Icons.timelapse),
              ),
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (DateTime? d) => Validator.validateChoice(
                value: d,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
              onSaved: (DateTime? d) {
                survey.returnStartDate = d!;
              },
            ),
            const SizedBox(height: 10),
            DateTimeField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              format: format,
              decoration: const InputDecoration(
                label: Text("الوصول المتوقع"),
                icon: Icon(Icons.timelapse),
              ),
              onShowPicker: (context, currentValue) async {
                final date = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
                if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date, time);
                } else {
                  return currentValue;
                }
              },
              validator: (DateTime? d) => Validator.validateChoice(
                value: d,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
              onSaved: (DateTime? d) {
                survey.returnArrivalDate = d!;
              },
            ),
            const SizedBox(height: 10),
            DropDownFormInput(
              hint: const Text(
                "يومي/اسبوعي/شهري/إلخ.",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              label: const Text("تكرار هذه الرحلة:"),
              options: const <Repeatablity, Widget>{
                Repeatablity.dialy: Text("يومياً"),
                Repeatablity.weekly: Text("إسبوعياً"),
                Repeatablity.fortnight: Text("كل إسبوعين"),
                Repeatablity.monthly: Text("شهرياً"),
                Repeatablity.halfOrQuarterYear: Text("ربع أو نصف سنوياً"),
                Repeatablity.yearly: Text("سنوياً"),
                Repeatablity.onlyOnce: Text("مرة واحدة"),
              },
              onSaved: (Repeatablity? p) {
                survey.journeyRepeatablitiy = p!;
              },
              validator: (Repeatablity? value) => Validator.validateChoice(
                value: value,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
