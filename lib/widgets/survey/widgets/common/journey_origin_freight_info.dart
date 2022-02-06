import 'package:flutter/material.dart';
import '/models/survey.dart';
import '/widgets/common/dropdown_form_input.dart';
import '/widgets/common/toggle_buttons_form_input.dart';

class JourneyOriginInfoWidget extends StatelessWidget {
  const JourneyOriginInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            ToggleButtonsFormInput(
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
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("اسم المدينة/القريبة"),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
            ),
            const SizedBox(height: 10),
            const DropDownFormInput(
              hint: Text(
                "حج/عمرة/طبي/إلخ.",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              label: Text("غرض الرحلة:"),
              options: <Purpose, Widget>{
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
            ),
          ],
        ),
      ),
    );
  }
}
