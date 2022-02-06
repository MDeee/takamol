import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/validator.dart';
import 'package:takamol_app/models/survey.dart';
import 'package:takamol_app/providers/survey.dart';
import 'package:takamol_app/widgets/common/dropdown_form_input.dart';

import '/providers/survey_frieght.dart';
import '/widgets/common/toggle_buttons_form_input.dart';

class HeaderFreightData extends StatelessWidget {
  final ManualLocations? initManualLocation;
  const HeaderFreightData({
    this.initManualLocation,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveyFreightProvider survey =
        Provider.of<SurveyProvider>(context) as SurveyFreightProvider;

    return Card(
      child: Row(
        children: [
          Flexible(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // TextFormField(
                  //   decoration: const InputDecoration(
                  //     label: Text("اسم المدينة"),
                  //     contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  //   ),
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   validator: (String? value) => Validator.validateEmpty(
                  //     value: value,
                  //     message: "يجب اعطاء اجابة",
                  //   ),
                  //   onSaved: (String? s) {
                  //     survey.headerCity = s!;
                  //   },
                  // ),
                  // const SizedBox(height: 10),
                  DropDownFormInput(
                    initial: initManualLocation,
                    hint: const Text(
                      "RS1/RS2/BP1/...",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    label: const Text("الموقع:"),
                    options: const <ManualLocations, Widget>{
                      ManualLocations.RS1: Text("RS1"),
                      ManualLocations.RS2: Text("RS2"),
                      ManualLocations.RS3: Text("RS3"),
                      ManualLocations.RS4: Text("RS4"),
                      ManualLocations.RS5: Text("RS5"),
                      ManualLocations.RS6: Text("RS6"),
                      ManualLocations.RS7: Text("RS7"),
                      ManualLocations.RS8: Text("RS8"),
                      ManualLocations.RS9: Text("RS9"),
                      ManualLocations.RS10: Text("RS10"),
                      ManualLocations.RS11: Text("RS11"),
                      ManualLocations.RS12: Text("RS12"),
                      ManualLocations.RS13: Text("RS13"),
                      ManualLocations.RS14: Text("RS14"),
                      ManualLocations.RS15: Text("RS15"),
                      ManualLocations.RS16: Text("RS16"),
                      ManualLocations.RS17: Text("RS17"),
                      ManualLocations.RS18: Text("RS18"),
                      ManualLocations.RS19: Text("RS19"),
                      ManualLocations.RS20: Text("RS20"),
                      ManualLocations.RS21: Text("RS21"),
                      ManualLocations.RS22: Text("RS22"),
                      ManualLocations.RS23: Text("RS23"),
                      ManualLocations.RS24: Text("RS24"),
                      ManualLocations.RS25: Text("RS25"),
                      ManualLocations.BP1: Text("BP1"),
                      ManualLocations.BP2: Text("BP2"),
                      ManualLocations.BP3: Text("BP3"),
                      ManualLocations.BP4: Text("BP4"),
                      ManualLocations.BP5: Text("BP5"),
                      ManualLocations.BP6: Text("BP6"),
                      ManualLocations.BP7: Text("BP7"),
                      ManualLocations.BP8: Text("BP8"),
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
                    label: const Text("شاحنة نقل مبرد"),
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
                      survey.headerRefrigerator = i == 0;
                    },
                    validator: (int? i) => Validator.validateChoice(
                      value: i,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  const SizedBox(height: 10),
                  ToggleButtonsFormInput(
                    label: const Text("هل أنت مسافر إلي مدينة أخري"),
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
                    initial: 1,
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
                  // const SizedBox(height: 10),
                  // TextFormField(
                  //   decoration: const InputDecoration(
                  //     label: Text("العمر"),
                  //     contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  //   ),
                  //   keyboardType: TextInputType.number,
                  //   inputFormatters: <TextInputFormatter>[
                  //     FilteringTextInputFormatter.allow(
                  //       RegExp(r'[0-9]'),
                  //     ),
                  //   ],
                  //   validator: (String? s) => Validator.validateEmpty(
                  //     value: s,
                  //     message: "يجب اعطاء اجابة",
                  //   ),
                  //   autovalidateMode: AutovalidateMode.onUserInteraction,
                  //   onChanged: (String s) {
                  //     survey.headerAge = double.tryParse(s) ?? 0;
                  //   },
                  // ),
                  // const SizedBox(height: 10),
                  // ToggleButtonsFormInput(
                  //   label: const Text("الجنس"),
                  //   choices: [
                  //     ToggleButtonsFormInput.createChoice(
                  //       text: "ذكر",
                  //       icon: Icons.male,
                  //     ),
                  //     ToggleButtonsFormInput.createChoice(
                  //       text: "أنثى",
                  //       icon: Icons.female,
                  //     ),
                  //   ],
                  //   onSaved: (int? i) {
                  //     survey.headerIsMale = i == 0;
                  //   },
                  //   validator: (int? i) => Validator.validateChoice(
                  //     value: i,
                  //     refused: null,
                  //     message: "يجب اعطاء اجابة",
                  //   ),
                  // ),
                  // const SizedBox(height: 10),
                  // ToggleButtonsFormInput(
                  //   label: const Text("هل لديك رخصة قيادة سعودية"),
                  //   choices: [
                  //     ToggleButtonsFormInput.createChoice(
                  //       text: "نعم",
                  //       icon: Icons.check,
                  //       iconColor: Colors.green,
                  //     ),
                  //     ToggleButtonsFormInput.createChoice(
                  //         text: "لا",
                  //         icon: Icons.add,
                  //         iconColor: Colors.red,
                  //         rotation: 0.785398),
                  //   ],
                  //   onSaved: (int? i) {
                  //     survey.headerHaveDrivingLicense = i == 0;
                  //   },
                  //   validator: (int? i) => Validator.validateChoice(
                  //     value: i,
                  //     refused: null,
                  //     message: "يجب اعطاء اجابة",
                  //   ),
                  // ),

                  const SizedBox(height: 10),
                  ToggleButtonsFormInput(
                    label: const Text(
                      "هل الشاحنة محملة",
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
                    onChange: (int i) {
                      survey.headerIsLoaded = i == 0;
                    },
                    validator: (int? i) => Validator.validateChoice(
                      value: i,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                    onSaved: (int? i) {
                      survey.headerIsLoaded = i == 0;
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
