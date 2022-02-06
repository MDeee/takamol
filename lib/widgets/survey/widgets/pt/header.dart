import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/validator.dart';
import 'package:takamol_app/models/survey.dart';
import 'package:takamol_app/widgets/common/dropdown_form_input.dart';

import '/providers/survey.dart';
import '/widgets/common/toggle_buttons_form_input.dart';

class HeaderData extends StatelessWidget {
  final ManualLocations? initManualLocation;
  const HeaderData({
    this.initManualLocation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveyProvider survey = Provider.of<SurveyProvider>(context, listen: false);
    print(survey.type);
    return Card(
      child: Row(
        children: [
          Flexible(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DropDownFormInput(
                    hint: const Text(
                      "مطار جدة",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    label: const Text("الموقع:"),
                    initial: initManualLocation,
                    options: const <ManualLocations, Widget>{
                      ManualLocations.RiyadhAirport: Text("مطار الرياض"),
                      ManualLocations.DamamAirport: Text("مطار الدمام"),
                      ManualLocations.GaddahAirport: Text("مطار جدة"),
                      ManualLocations.MadinahAirport: Text("مطار المدينة"),
                      ManualLocations.TaboukAirport: Text("مطار تبوك"),
                      ManualLocations.AbhahAirport: Text("مطار ابها"),
                      ManualLocations.RiyadhSabtko: Text("سابتكو الرياض"),
                      ManualLocations.DamamSabtko: Text("سابتكو الدمام"),
                      ManualLocations.GaddahSabtko: Text("سابتكو جدة"),
                      ManualLocations.MadinahSabtko: Text("سابتكو المدينة"),
                      ManualLocations.MakkahSabtko: Text("سابتكو مكة"),
                      ManualLocations.TaboukSabtko: Text("سابتكو تبوك"),
                      ManualLocations.KhamesMshetSabtko:
                          Text("سابتكو خميس مشيط"),
                      ManualLocations.RiyadhTrain: Text("قطار الرياض"),
                      ManualLocations.RiyadhSarTrain: Text("قطار الرياض سار"),
                      ManualLocations.HaylTrain: Text("قطار حايل"),
                      ManualLocations.QasemTrain: Text("قطار القصيم"),
                      ManualLocations.DmamTrain: Text("قطار الدمام"),
                      ManualLocations.MakkahHaramTrain:
                          Text("قطار الحرمين مكة"),
                      ManualLocations.MadinahHaramTrain:
                          Text("قطار الحرمين المدينة"),
                      ManualLocations.GaddahHaramTrain:
                          Text("قطار الحرمين جدة"),
                    },
                    onSaved: (ManualLocations? p) {
                      survey.manualLocation = p!;
                    },
                    validator: (ManualLocations? value) =>
                        Validator.validateChoice(
                      value: value,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  const SizedBox(height: 10),
                  ToggleButtonsFormInput(
                    label: const Text("هل أنت مسافر إلي مدينة أخري"),
                    initial: 1,
                    choices: [
                      ToggleButtonsFormInput.createChoice(
                        text: "نعم",
                        icon: Icons.check,
                        iconColor: Colors.green,
                      ),
                      ToggleButtonsFormInput.createChoice(
                          text: "لا",
                          icon: Icons.add,
                          iconColor: Colors.red,
                          rotation: 0.785398),
                    ],
                    onChange: (int i) {
                      survey.headerCrossCities = i == 0;
                    },
                    validator: (int? i) => Validator.validateChoice(
                      value: i,
                      refused: 1,
                      message: "الاستبيان على المسافرين عبر المدن فقط",
                    ),
                    autovalidateMode: AutovalidateMode.always,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (String s) {
                      survey.headerAge = double.tryParse(s) ?? 0;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("العمر"),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]'),
                      ),
                    ],
                    validator: survey.type == SurveyType.pt
                        ? (String? s) => Validator.validateAge(
                              value: s,
                              message: "يجب ألا يقل العمر عن 15 سنة",
                            )
                        : (String? s) => Validator.validateEmpty(
                              value: s,
                              message: "يجب اعطاء اجابة",
                            ),
                  ),
                  const SizedBox(height: 10),
                  ToggleButtonsFormInput(
                    label: const Text("الجنس"),
                    choices: [
                      ToggleButtonsFormInput.createChoice(
                        text: "ذكر",
                        icon: Icons.male,
                      ),
                      ToggleButtonsFormInput.createChoice(
                        text: "أنثى",
                        icon: Icons.female,
                      ),
                    ],
                    onSaved: (int? i) {
                      survey.headerIsMale = i == 0;
                    },
                    validator: (int? i) => Validator.validateChoice(
                      value: i,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  const SizedBox(height: 10),
                  ToggleButtonsFormInput(
                    label: const Text("هل لديك رخصة قيادة سعودية"),
                    choices: [
                      ToggleButtonsFormInput.createChoice(
                        text: "نعم",
                        icon: Icons.check,
                        iconColor: Colors.green,
                      ),
                      ToggleButtonsFormInput.createChoice(
                          text: "لا",
                          icon: Icons.add,
                          iconColor: Colors.red,
                          rotation: 0.785398),
                    ],
                    onSaved: (int? i) {
                      survey.headerHaveDrivingLicense = i == 0;
                    },
                    validator: (int? i) => Validator.validateChoice(
                      value: i,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  const SizedBox(height: 10),
                  ToggleButtonsFormInput(
                    label: const Text(
                      "هل لديك سيارة تستطيع السفر بها بين المدن",
                    ),
                    choices: [
                      ToggleButtonsFormInput.createChoice(
                        text: "نعم",
                        icon: Icons.check,
                        iconColor: Colors.green,
                      ),
                      ToggleButtonsFormInput.createChoice(
                          text: "لا",
                          icon: Icons.add,
                          iconColor: Colors.red,
                          rotation: 0.785398),
                    ],
                    validator: (int? i) => Validator.validateChoice(
                      value: i,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                    onSaved: (int? i) {
                      survey.headerHaveCrossCitiesCar = i == 0;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
