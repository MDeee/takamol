import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/validator.dart';
import 'package:takamol_app/providers/survey.dart';

import '/models/survey_freight.dart';

import '/providers/survey_frieght.dart';

import '/widgets/common/dropdown_form_input.dart';
import '/widgets/common/toggle_buttons_form_input.dart';

class GeneralInfo extends StatefulWidget {
  const GeneralInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<GeneralInfo> createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
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
                  DropDownFormInput(
                    hint: const Text(
                      "البقاء/العودة للمنشأ/إلخ.",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    label:
                        const Text("بعد وصولك الى وجهتك ماذا يحدث للشاحنة :"),
                    options: const <PostArrival, Widget>{
                      PostArrival.returnToOrigin:
                          Text("العودة الى منشأ الرحلة"),
                      PostArrival.stay: Text("البقاء في مقصد الرحلة"),
                      PostArrival.otherPlace: Text("الذهاب إلى مكان اخر"),
                      PostArrival.unkown: Text("لا أعرف"),
                    },
                    onChange: (PostArrival p) {
                      survey.generalInfoPostArival = p;
                    },
                    validator: (PostArrival? value) => Validator.validateChoice(
                      value: value,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...survey.generalInfoPostArival != PostArrival.unkown
                      ? [
                          DropDownFormInput(
                            hint: const Text(
                              "نعم/لا/لا أعرف",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            label: const Text(
                                "هل سيتم تحميل الشاحنة فى الرحلة القادمة؟ :"),
                            options: const <TriState, Widget>{
                              TriState.yes: Text("نعم"),
                              TriState.no: Text("لا"),
                              TriState.unkown: Text("لا أعرف"),
                            },
                            onChange: (TriState p) {
                              survey.generalInfoNextLoading = p;
                            },
                            validator: (TriState? value) =>
                                Validator.validateChoice(
                              value: value,
                              refused: null,
                              message: "يجب اعطاء اجابة",
                            ),
                          ),
                          const SizedBox(height: 10),
                          DropDownFormInput(
                            hint: const Text(
                              "نعم/لا/لا أعرف",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            label: const Text("هل أنت قائد الرحلة القادمة؟ :"),
                            options: const <TriState, Widget>{
                              TriState.yes: Text("نعم"),
                              TriState.no: Text("لا"),
                              TriState.unkown: Text("لا أعرف"),
                            },
                            onChange: (TriState p) {
                              survey.generalInfoNextLeader = p;
                            },
                            validator: (TriState? value) =>
                                Validator.validateChoice(
                              value: value,
                              refused: null,
                              message: "يجب اعطاء اجابة",
                            ),
                          ),
                          const SizedBox(height: 10),
                        ]
                      : [],
                  ToggleButtonsFormInput(
                    label: const Text("جنسية السائق"),
                    choices: [
                      ToggleButtonsFormInput.createChoice(
                        text: "سعودى",
                      ),
                      ToggleButtonsFormInput.createChoice(
                        text: "جنسية أخرى",
                      ),
                    ],
                    onSaved: (int? i) {
                      survey.generalInfoIsCitizen = i == 0;
                    },
                    validator: (int? i) => Validator.validateChoice(
                      value: i,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  const SizedBox(height: 10),
                  ToggleButtonsFormInput(
                    label: const Text("هل معك سائق اضافى في الرحلة؟"),
                    onChange: (int i) {
                      survey.generalInfoCoDriverExists = i == 0;
                    },
                    validator: (int? i) => Validator.validateChoice(
                      value: i,
                      refused: null,
                      message: "يجب اعطاء اجابة",
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
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      ToggleButtonsFormInput(
                        label: const Text("جنسية السائق الثاني"),
                        choices: [
                          ToggleButtonsFormInput.createChoice(
                            text: "سعودى",
                          ),
                          ToggleButtonsFormInput.createChoice(
                            text: "جنسية أخرى",
                          ),
                        ],
                        onSaved: (int? i) {
                          survey.generalInfoCoDriverIsCitizen = i == 0;
                        },
                        validator: (int? i) => Validator.validateChoice(
                          value: i,
                          refused: null,
                          message: "يجب اعطاء اجابة",
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text("رقم الجوال"),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9]'),
                          ),
                        ],
                        onSaved: (String? i) {
                          survey.generalInfoCoDriverPhone = i!;
                        },
                        validator: (String? i) => Validator.validateEmpty(
                          value: i,
                          message: "يجب اعطاء اجابة",
                        ),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text("الإسم"),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        onSaved: (String? i) {
                          survey.generalInfoCoDriverName = i!;
                        },
                        validator: (String? i) => Validator.validateEmpty(
                          value: i,
                          message: "يجب اعطاء اجابة",
                        ),
                      ),
                    ],
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
