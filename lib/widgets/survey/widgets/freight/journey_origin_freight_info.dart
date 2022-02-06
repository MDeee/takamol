import 'package:enum_to_string/enum_to_string.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/validator.dart';
import 'package:takamol_app/models/survey.dart';
import 'package:takamol_app/providers/survey.dart';
import 'package:takamol_app/providers/survey_frieght.dart';

import '/models/survey_freight.dart';

import '/widgets/common/dropdown_form_input.dart';
import '/widgets/common/toggle_buttons_form_input.dart';

class JourneyOriginFreightInfoWidget extends StatelessWidget {
  const JourneyOriginFreightInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("يوم dd MMM yyyy الساعة hh:mm a");
    SurveyFreightProvider survey =
        Provider.of<SurveyProvider>(context) as SurveyFreightProvider;

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
            // const SizedBox(height: 10),
            // ToggleButtonsFormInput(
            //   label: const Text("هل أتيت من "),
            //   choices: [
            //     ToggleButtonsFormInput.createChoice(
            //       text: "المنزل",
            //     ),
            //     ToggleButtonsFormInput.createChoice(
            //       text: "عودة إلي المنزل",
            //     ),
            //     ToggleButtonsFormInput.createChoice(
            //       text: "أخري",
            //     ),
            //   ],
            //   onChange: (int? i) {
            //     survey.originLocationType = TravelTarget.values[i!];
            //   },
            //   validator: (int? i) => Validator.validateChoices(
            //     value: i,
            //     refused: survey.destinationLocationType == null ||
            //             survey.destinationLocationType == TravelTarget.other
            //         ? [null]
            //         : [null, survey.destinationLocationType!.index],
            //     message: "يجب اعطاء اجابة صحيحة",
            //   ),
            // ),
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
              onSaved: (String? s) {
                survey.originLocationName = s!;
              },
            ),
            const SizedBox(height: 10),
            DropDownFormInput(
              hint: const Text(
                "منشأة صناعية/مستودع/ميناء/إلخ.",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              label: const Text("نوع مرفق المنشأ:"),
              options: const <IndustrialPoseType, Widget>{
                IndustrialPoseType.constructionSite: Text("موقع انشائي"),
                IndustrialPoseType.industrialBuilding: Text("منشأة صناعية"),
                IndustrialPoseType.inventory: Text("مستودع"),
                IndustrialPoseType.port: Text("ميناء"),
                IndustrialPoseType.loadingPort: Text(
                  "مرفق تحميل آخر مثل ميناء جاف أو نقطة التقاء مع شاحنة أخرى",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                IndustrialPoseType.companyGarage: Text("مواقف سيارات الشركة"),
                IndustrialPoseType.house: Text("مسكن"),
                IndustrialPoseType.other: Text("أخرى"),
              },
              onChange: (IndustrialPoseType? p) {
                survey.originType =
                    EnumToString.convertToString(p, camelCase: true);
              },
              validator: (IndustrialPoseType? value) =>
                  Validator.validateChoice(
                value: value,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
            ),
            ...survey.originType ==
                    EnumToString.convertToString(
                      IndustrialPoseType.other,
                      camelCase: true,
                    )
                ? [
                    const SizedBox(height: 10),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        label: Text("أخرى (المنشأ)"),
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      validator: (String? value) => Validator.validateEmpty(
                        value: value,
                        message: "يجب اعطاء اجابة",
                      ),
                      onSaved: (String? s) {
                        survey.originType += " - $s";
                      },
                    ),
                  ]
                : [],
            const SizedBox(height: 10),
            DateTimeField(
              format: format,
              decoration: const InputDecoration(
                label: Text("بداية رحلتك"),
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
                survey.originTimeStamp = d!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
