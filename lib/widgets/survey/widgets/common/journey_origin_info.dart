import 'package:enum_to_string/enum_to_string.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/distance_helper.dart';
import 'package:takamol_app/helpers/validator.dart';

import '/providers/survey.dart';
import '/models/survey.dart';
import '/widgets/common/dropdown_form_input.dart';
import '/widgets/common/toggle_buttons_form_input.dart';

class JourneyOriginInfoWidget extends StatelessWidget {
  final ManualLocations? initManualLocation;
  const JourneyOriginInfoWidget({
    Key? key,
    this.initManualLocation,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final format = DateFormat("يوم dd MMM yyyy الساعة hh:mm a");
    SurveyProvider survey = Provider.of<SurveyProvider>(context, listen: false);
    late DateTime startDate = DateTime.now();
    // late String surveyCity = survey.headerCity;

    // print("debug servey");
    // print(survey.journeyStartLocationName);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "منشأ الرحلة",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Consumer<SurveyProvider>(builder: (ctx, s, c) {
              return ToggleButtonsFormInput(
                autovalidateMode: s.journeyStartLocationTravelTarget == null
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.always,
                label: const Text("هل أتيت من "),
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
                  s.journeyStartLocationTravelTarget = TravelTarget.values[i!];
                },
                validator: (int? i) => Validator.validateChoices(
                  value: i,
                  refused: s.journeyEndLocationTravelTarget == null ||
                          s.journeyEndLocationTravelTarget == TravelTarget.other
                      ? [null]
                      : [null, s.journeyEndLocationTravelTarget!.index],
                  message: "يجب اعطاء اجابة صحيحة",
                ),
              );
            }),
            const SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                label: Text("اسم المدينة/القريبة"),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              validator: (String? value) => Validator.validateEmpty(
                value: value,
                message: "يجب اعطاء اجابة",
              ),
              onChanged: (String? s) {
                survey.journeyStartLocationName = s!;
              },
              onEditingComplete: () {
                if (!Distance.city_exists(
                    survey.journeyStartLocationName ?? ""))
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("لا يوجد معلومات عن هذه المدينة"),
                      duration: Duration(seconds: 3),
                      elevation: 1,
                    ),
                  );
              },
            ),
            // const SizedBox(height: 10),
            // TextFormField(
            //   autovalidateMode: AutovalidateMode.onUserInteraction,
            //   decoration: const InputDecoration(
            //     label: Text("اسم الحي"),
            //     contentPadding: EdgeInsets.symmetric(horizontal: 8),
            //   ),
            //   validator: (String? value) => Validator.validateEmpty(
            //     value: value,
            //     message: "يجب اعطاء اجابة",
            //   ),
            //   onChanged: (String? s) {
            //     survey.journeyStarDistrictName = s!;
            //   },
            // ),
            const SizedBox(height: 10),
            DropDownFormInput(
              hint: const Text(
                "اجرة/طائرة/قطار/إلخ.",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              label: const Text("وسيلة النقل في الذهاب:"),
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
                survey.journeyGoType =
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
                return s.journeyGoType ==
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
                            survey.journeyGoType += " - $s";
                          },
                        ),
                      ])
                    : SizedBox.shrink();
              },
            ),
            const SizedBox(height: 10),
            DateTimeField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              format: format,
              decoration: const InputDecoration(
                label: Text("بداية رحلتك"),
                icon: Icon(Icons.timelapse),
              ),
              onShowPicker: (context, currentValue) async {
                startDate = (await showDatePicker(
                    context: context,
                    firstDate: DateTime(2010),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100)))!;
                if (startDate != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(startDate, time);
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
                survey.journeyStartDate = d!;
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
              validator: (DateTime? d) => Validator.validateDateTime(
                value: d,
                message:
                    "يجب ان يكون تاريخ نهاية الرحلة اكبر من تاريخ بداية الرحلة",
                otherValue: startDate,
              ),
              onSaved: (DateTime? d) {
                survey.journeyArrivalDate = d!;
              },
            ),
            const SizedBox(height: 10),
            DropDownFormInput(
              hint: const Text(
                "حج/عمرة/طبي/إلخ.",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              label: const Text("الغرض من الرحلة:"),
              options: const <Purpose, Widget>{
                Purpose.companion: Text("مرافق"),
                Purpose.hajj: Text("حج"),
                Purpose.omra: Text("عمرة"),
                Purpose.work: Text("العمل"),
                Purpose.workOwner: Text("صاحب عمل"),
                Purpose.midical: Text("طبى"),
                Purpose.shopping: Text("تسوق"),
                Purpose.social: Text("اجتماعى"),
                Purpose.university: Text("الجامعة"),
                Purpose.tourism: Text("سياحة/ترفيه"),
                Purpose.other: Text("أخرى"),
              },
              onChange: (Purpose p) {
                survey.journeyPurpose =
                    EnumToString.convertToString(p, camelCase: true);
                survey.caseInfoIsAlone = false;
              },
              validator: (Purpose? value) => Validator.validateChoice(
                value: value,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
            ),
            Consumer<SurveyProvider>(
              builder: (ctx, s, c) {
                return s.journeyPurpose ==
                        EnumToString.convertToString(
                          Purpose.other,
                          camelCase: true,
                        )
                    ? Column(children: [
                        const SizedBox(height: 10),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: const InputDecoration(
                            label: Text("أخرى (الغرض من الرحلة)"),
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          validator: (String? value) => Validator.validateEmpty(
                            value: value,
                            message: "يجب اعطاء اجابة",
                          ),
                          onSaved: (String? s) {
                            survey.journeyPurpose += " - $s";
                          },
                        ),
                      ])
                    : SizedBox.shrink();
              },
            )
          ],
        ),
      ),
    );
  }
}
