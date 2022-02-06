import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/validator.dart';
import 'package:takamol_app/providers/survey.dart';
import '/models/survey.dart';
import '/widgets/common/dropdown_form_input.dart';
import '/widgets/common/toggle_buttons_form_input.dart';

class JobStatusWidget extends StatelessWidget {
  const JobStatusWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveyProvider survey = Provider.of<SurveyProvider>(context, listen: false);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropDownFormInput(
              hint: const Text(
                "ابتدائي/اعدادي/ثانوي/الخ.",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              label: const Text("المستوي التعليمي:"),
              options: const <Education, Widget>{
                Education.primary: Text("ابتدائي"),
                Education.preparatory: Text("متوسط"),
                Education.secondary: Text("ثانوي"),
                Education.university: Text("جامعي"),
                Education.postGraduate: Text("دراسات عليا"),
              },
              onSaved: (Education? p) {
                survey.jobStatusEducation = p!;
              },
              validator: (Education? value) => Validator.validateChoice(
                value: value,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
            ),
            const SizedBox(height: 10),
            ToggleButtonsFormInput(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              label: const Text("الجنسية"),
              choices: [
                ToggleButtonsFormInput.createChoice(
                  text: "سعودي",
                ),
                ToggleButtonsFormInput.createChoice(
                  text: "غير سعودي",
                ),
              ],
              onSaved: (int? i) {
                survey.jobStatusIsCitizen = i == 0;
              },
              validator: (int? i) => Validator.validateChoice(
                value: i,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
            ),
            const SizedBox(height: 10),
            DropDownFormInput(
              hint: const Text(
                "موظف/طالب/الخ.",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              label: const Text("الحالة الوظيفية:"),
              options: const <Employment, Widget>{
                Employment.employee: Text("موظف"),
                Employment.unemployed: Text("عاطل عن العمل"),
                Employment.freeBusiness: Text("أعمال حرة"),
                Employment.retired: Text("متقاعد"),
                Employment.student: Text("طالب"),
                Employment.specialNeeds: Text("احتياجات خاصة"),
                Employment.houseWife: Text("ربة منزل"),
              },
              onSaved: (Employment? p) {
                survey.jobStatusEmployment = p!;
              },
              validator: (Employment? value) => Validator.validateChoice(
                value: value,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
            ),
            const SizedBox(height: 10),
            DropDownFormInput(
              hint: const Text(
                "مثلا 2,500-6,500",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              label: const Text("دخل الأسرة الشهري بالريال:"),
              options: const <IncomeRange, Widget>{
                IncomeRange.private: Text("لا أرغب"),
                IncomeRange.l2500: Text("أقل من 2,500"),
                IncomeRange.f2500T6500: Text("من 2,501 إلى 6,500"),
                IncomeRange.f6501T13000: Text("من 6,501 إلى 13,000"),
                IncomeRange.f13001T25000: Text("من 13,001 إلى 25,000"),
                IncomeRange.f25001T41000: Text("من 25,001 إلى 41,000"),
                IncomeRange.m41000: Text("أكثر من 41,001"),
              },
              onSaved: (IncomeRange? p) {
                survey.jobStatusIncomeRange = p!;
              },
              validator: (IncomeRange? value) => Validator.validateChoice(
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
