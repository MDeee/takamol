import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/validator.dart';
import 'package:takamol_app/providers/survey.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({
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
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                label: Text("عدد افراد الأسرة"),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]'),
                ),
              ],
              validator: (String? value) => Validator.validateEmpty(
                value: value,
                message: "يجب اعطاء اجابة",
              ),
              onSaved: (String? s) {
                survey.familyCount = int.tryParse(s!) ?? 0;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
              validator: (String? value) => Validator.validateEmpty(
                value: value,
                message: "يجب اعطاء اجابة",
              ),
              onSaved: (String? s) {
                survey.phone = s!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                label: Text("الاسم"),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              validator: (String? value) => Validator.validateEmpty(
                value: value,
                message: "يجب اعطاء اجابة",
              ),
              onSaved: (String? s) {
                survey.name = s!;
              },
            ),
          ],
        ),
      ),
    );
  }
}
