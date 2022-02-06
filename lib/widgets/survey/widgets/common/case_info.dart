import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/validator.dart';

import '/providers/survey.dart';
import '/models/survey.dart';
import '/widgets/common/dropdown_form_input.dart';
import '/widgets/common/toggle_buttons_form_input.dart';

import './journey_example.dart';

class CaseInfoWidget extends StatefulWidget {
  const CaseInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CaseInfoWidget> createState() => _CaseInfoWidgetState();
}

class _CaseInfoWidgetState extends State<CaseInfoWidget> {
  int numberOfExampels = 0;
  List<JourneyExample> journeyExamples = [];

  void setNumberOfExamples(int i) {
    setState(() {
      numberOfExampels = i - 0;
      if (numberOfExampels < 0) {
        numberOfExampels = 0;
      }
      journeyExamples = <JourneyExample>[];
      for (int i = numberOfExampels; i > 0; i--) {
        journeyExamples.add(JourneyExample());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SurveyProvider survey = Provider.of<SurveyProvider>(context, listen: false);
    survey.journeyExamples = journeyExamples;

    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Consumer<SurveyProvider>(
                  builder: (context, SurveyProvider survey, _) =>
                      survey.journeyPurpose != Purpose.companion
                          ? ToggleButtonsFormInput(
                              label: const Text("هل تسافر وحيداً؟"),
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
                              onChange: (int? i) {
                                survey.caseInfoIsAlone = i == 0;
                              },
                              validator: (int? i) => Validator.validateChoice(
                                value: i,
                                refused: null,
                                message: "يجب اعطاء اجابة",
                              ),
                            )
                          : const SizedBox.shrink(),
                ),
                const SizedBox(height: 10),
                ToggleButtonsFormInput(
                  label: Flex(
                    direction: Axis.horizontal,
                    children: const [
                      Text(" هل عادةً تسافر مفردك"),
                      Text("في الرحلات المماثلة؟"),
                    ],
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
                  onSaved: (int? i) {
                    survey.caseInfoUsuallyAlone = i == 0;
                  },
                  validator: (int? i) => Validator.validateChoice(
                    value: i,
                    refused: null,
                    message: "يجب اعطاء اجابة",
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  // autovalidateMode: AutovalidateMode.always,
                  decoration: const InputDecoration(
                    label: Text(
                        "كم عدد رحلاتك بين المدن اللتي ستقوم بها خلال رحلتك هذه؟"),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(
                      RegExp(r'[0-9]'),
                    ),
                  ],
                  onChanged: (String t) {
                    int temp = int.tryParse(t.trim()) ?? 0;
                    if (temp >= 0) {
                      setNumberOfExamples(temp);
                    }
                  },
                  onSaved: (String? i) {
                    survey.caseInfoUsuallyNumberOfCrossCityJournies =
                        int.tryParse(i!) ?? 0;
                  },
                  validator: (String? i) => Validator.validateLessThan(
                    value: i ?? "0",
                    // refValue: 1,
                    message: "يجب اعطاء عدد الرحلات و لا يقل عن رحلتين",
                    number: 2,
                  ),
                ),
                const SizedBox(height: 20),
                Consumer<SurveyProvider>(
                  builder: (ctx, p, c) {
                    print("didChange");
                    // p.caseInfoNumberOfStrangerCompanions = 0;
                    return Column(
                      children: p.caseInfoIsAlone ?? true
                          ? []
                          : [
                              const Text("عدد المرافقين"),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        label: Text("من أسرتك"),
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'),
                                        ),
                                      ],
                                      onSaved: (String? i) {
                                        p.caseInfoNumberOfFamilyCompanions =
                                            int.tryParse(i!) ?? 0;
                                      },
                                      validator: (String? i) =>
                                          Validator.validateEmpty(
                                        value: i,
                                        message: "يجب اعطاء اجابة",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        label: Text("من أسرة أخرى"),
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'[0-9]'),
                                        ),
                                      ],
                                      onSaved: (String? i) {
                                        p.caseInfoNumberOfStrangerCompanions =
                                            int.tryParse(i!) ?? 0;
                                      },
                                      validator: (String? i) =>
                                          Validator.validateEmpty(
                                        value: i,
                                        message: "يجب اعطاء اجابة",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                    );
                  },
                ),
                const SizedBox(height: 10),
                DropDownFormInput(
                  hint: const Text(
                    "بنفسى/أخرى/إلخ.",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  label: const Text("من يدفع تكاليف رحلتك الحالية:"),
                  options: const <Sponser, Widget>{
                    Sponser.me: Text("بنفسي"),
                    Sponser.relative: Text("فرد من الأسرة / قريب"),
                    Sponser.other: Text("العمل / أخرى"),
                  },
                  onChange: (Sponser p) {
                    survey.caseInfoSponser = p;
                  },
                  validator: (Sponser? value) => Validator.validateChoice(
                    value: value,
                    refused: null,
                    message: "يجب اعطاء اجابة",
                  ),
                ),
                const SizedBox(height: 10),
                DropDownFormInput(
                  hint: const Text(
                    "يومي/اسبوعي/شهري/إلخ.",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  label: const Text("كم مرة تقوم برحلات بين المدن:"),
                  options: const <Repeatablity, Widget>{
                    Repeatablity.dialy: Text("يومياً"),
                    Repeatablity.weekly: Text("إسبوعياً"),
                    Repeatablity.fortnight: Text("كل إسبوعين"),
                    Repeatablity.monthly: Text("شهرياً"),
                    Repeatablity.halfOrQuarterYear: Text("ربع أو نصف سنوياً"),
                    Repeatablity.yearly: Text("سنوياً"),
                    Repeatablity.onlyOnce: Text("مرة واحدة"),
                  },
                  onChange: (Repeatablity p) {
                    survey.caseInfoRepeatablity = p;
                  },
                  validator: (Repeatablity? value) => Validator.validateChoice(
                    value: value,
                    refused: null,
                    message: "يجب اعطاء اجابة",
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        ...journeyExamples
            .mapIndexed(
              (i, e) => JourneyExampleInfoWidget(
                initExample: e,
                start: i == 0,
                end: i == journeyExamples.length - 1,
                title: Text(
                  "رحلة رقم ${i + 1}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
