import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/validator.dart';

import 'package:takamol_app/providers/survey.dart';
import 'package:takamol_app/providers/survey_cars.dart';

import '/models/survey_cars.dart';
import '/widgets/common/dropdown_form_input.dart';

class VehicleInfo extends StatelessWidget {
  const VehicleInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveyCarsProvider survey =
        Provider.of<SurveyProvider>(context, listen: false)
            as SurveyCarsProvider;

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
                      "سيارة ركاب/بيك أب/فان/إلخ.",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    label: const Text("وسيلة النقل :"),
                    options: const <CarType, Widget>{
                      CarType.passengerCar: Text("سيارة ركاب"),
                      CarType.miniVan: Text("سيارات الدفع الرباعي / منى فان"),
                      CarType.pickup: Text("ونيت (بيك أب)"),
                      CarType.van: Text("فان"),
                      CarType.miniBus: Text("حافلة صغيرة"),
                    },
                    onSaved: (CarType? p) {
                      survey.headerCarType = p!;
                    },
                    validator: (CarType? value) => Validator.validateChoice(
                      value: value,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropDownFormInput(
                    hint: const Text(
                      "ملكي/مستأجرة/إلخ.",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    label: const Text("ملكية المركبة :"),
                    options: const <PropertyType, Widget>{
                      PropertyType.mine: Text("ملكي"),
                      PropertyType.rented: Text("مستأجرة"),
                      PropertyType.workProperty: Text("ملك العمل أو الشركة"),
                      PropertyType.someoneElseProperty: Text("ملك لشخص آخر"),
                    },
                    onSaved: (PropertyType? p) {
                      survey.headerPropertyType = p!;
                    },
                    validator: (PropertyType? value) =>
                        Validator.validateChoice(
                      value: value,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text("من"),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    validator: (String? value) => Validator.validateEmpty(
                      value: value,
                      message: "يجب اعطاء اجابة",
                    ),
                    onSaved: (String? s) {
                      survey.headerFrom = s!;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      label: Text("إلى"),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    validator: (String? value) => Validator.validateEmpty(
                      value: value,
                      message: "يجب اعطاء اجابة",
                    ),
                    onSaved: (String? s) {
                      survey.headerTo = s!;
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
