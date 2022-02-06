import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/validator.dart';
import 'package:takamol_app/providers/survey.dart';
import 'package:takamol_app/providers/survey_frieght.dart';

import '/models/survey_freight.dart';
import '/widgets/common/dropdown_form_input.dart';

class FreightVehicleInfo extends StatelessWidget {
  const FreightVehicleInfo({
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
                  DropDownFormInput(
                    hint: const Text(
                      "شاحنة/حراثة/إلخ.",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    label: const Text("وسيلة النقل :"),
                    options: const <CarType, Widget>{
                      CarType.truck: Text("شاحنة"),
                      CarType.trailerTruck: Text("شاحنة بمقطورة"),
                      CarType.trailer: Text("تريلة"),
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
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("عدد المحاور"),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]+'),
                      ),
                    ],
                    validator: (String? value) => Validator.validateEmpty(
                      value: value,
                      message: "يجب اعطاء اجابة",
                    ),
                    onSaved: (String? s) {
                      survey.headerAxisCount = int.tryParse(s!) ?? 0;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 10),
                  DropDownFormInput(
                    hint: const Text(
                      "ملكي/ملك العمل/إلخ.",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    label: const Text("ملكية المركبة :"),
                    options: const <PropertyType, Widget>{
                      PropertyType.mine: Text("ملكي"),
                      PropertyType.shippingCompanyProperty:
                          Text("ملك شركة نقليات"),
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
