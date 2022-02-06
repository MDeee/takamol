import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:takamol_app/helpers/validator.dart';

import '/models/survey.dart';
import '/widgets/common/dropdown_form_input.dart';
import '/widgets/common/toggle_buttons_form_input.dart';

class JourneyExampleInfoWidget extends StatefulWidget {
  final JourneyExample initExample;
  final Widget title;
  final bool start;
  final bool end;
  const JourneyExampleInfoWidget({
    required this.initExample,
    required this.title,
    this.start = false,
    this.end = false,
    Key? key,
  }) : super(key: key);

  @override
  State<JourneyExampleInfoWidget> createState() =>
      _JourneyExampleInfoWidgetState();
}

class _JourneyExampleInfoWidgetState extends State<JourneyExampleInfoWidget> {
  late JourneyExample example;
  @override
  void initState() {
    example = widget.initExample;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final format = DateFormat("يوم dd MMM yyyy الساعة hh:mm a");
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.title,
            ...!widget.start && !widget.end
                ? [
                    const SizedBox(height: 10),
                    DropDownFormInput(
                      hint: const Text(
                        "اجرة/طائرة/قطار/إلخ.",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      label: const Text("وسيلة النقل في هذه الرحلة:"),
                      options: const <TransportType, Widget>{
                        TransportType.carDriver: Text("سيارة كسائق"),
                        TransportType.carPassanger: Text("سيارة كراكب"),
                        TransportType.taxi: Text("أجرة"),
                        TransportType.plane: Text("طائرة"),
                        TransportType.crossCityVan: Text("حافلة بين المدن"),
                        TransportType.train: Text("قطار"),
                        TransportType.other: Text("أخرى"),
                      },
                      onChange: (TransportType? p) {
                        setState(() {
                          example.transportType =
                              EnumToString.convertToString(p, camelCase: true);
                        });
                      },
                      validator: (TransportType? value) =>
                          Validator.validateChoice(
                        value: value,
                        refused: null,
                        message: "يجب اعطاء اجابة",
                      ),
                    ),
                    ...example.transportType ==
                            EnumToString.convertToString(
                              TransportType.other,
                              camelCase: true,
                            )
                        ? [
                            const SizedBox(height: 10),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              decoration: const InputDecoration(
                                label: Text("أخرى (وسيلة النقل)"),
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                              ),
                              validator: (String? value) =>
                                  Validator.validateEmpty(
                                value: value,
                                message: "يجب اعطاء اجابة",
                              ),
                              onSaved: (String? s) {
                                setState(() {
                                  example.transportType =
                                      "${example.transportType} - $s";
                                });
                              },
                            ),
                          ]
                        : [],
                  ]
                : [],
            ...!widget.start
                ? [
                    Row(
                      children: [
                        const Text("المنشأ: "),
                        Expanded(
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              label: Text("اسم المدينة/القريبة"),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                            ),
                            onSaved: (String? i) {
                              example.startPose.name = i!;
                            },
                            validator: (String? i) => Validator.validateEmpty(
                              value: i,
                              message: "يجب اعطاء اجابة",
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...createLocationInfoWidget(example, true),
                  ]
                : [],
            ...!widget.end
                ? [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text("المقصد: "),
                        Expanded(
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              label: Text("اسم المدينة/القريبة"),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                            ),
                            onSaved: (String? i) {
                              example.endPose.name = i!;
                            },
                            validator: (String? i) => Validator.validateEmpty(
                              value: i,
                              message: "يجب اعطاء اجابة",
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...createLocationInfoWidget(example, false),
                  ]
                : [],
            const SizedBox(height: 10),
            DateTimeField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              format: format,
              decoration: const InputDecoration(
                label: Text("بداية الرحلة"),
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
              validator: (DateTime? d) => Validator.validateChoice(
                value: d,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
              onSaved: (DateTime? d) {
                example.start = d!;
              },
            ),
            const SizedBox(height: 10),
            DateTimeField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              format: format,
              decoration: const InputDecoration(
                label: Text("نهاية الرحلة"),
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
              validator: (DateTime? d) => Validator.validateChoice(
                value: d,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
              onSaved: (DateTime? d) {
                example.end = d!;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: const InputDecoration(
                label: Text("تكلفة الرحلة"),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]+.?[0-9]?[0-9]?'),
                ),
              ],
              validator: (String? d) => Validator.validateChoice(
                value: d,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
              onSaved: (String? d) {
                example.budget = double.tryParse(d!) ?? 0.0;
              },
            ),
            const SizedBox(height: 10),
            ToggleButtonsFormInput(
              label: const Text("هل تكلفة السفر بين المدن تشمل رحلة العودة؟"),
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
                  rotation: 0.785398,
                ),
              ],
              onSaved: (int? i) {
                example.isTotalBudget = i == 0;
              },
              validator: (int? i) => Validator.validateChoice(
                value: i,
                refused: null,
                message: "يجب اعطاء اجابة",
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> createLocationInfoWidget(JourneyExample example, bool start) {
    TransportType? t = EnumToString.fromString(
        TransportType.values, example.transportType ?? "",
        camelCase: true);
    print(t);
    return t == TransportType.crossCityVan ||
            t == TransportType.train ||
            t == TransportType.plane
        // ||
        // example.transportType == TransportType.other
        ? [
            // const SizedBox(height: 10),
            TextFormField(
              decoration: InputDecoration(
                label: Text(
                  t == TransportType.crossCityVan
                      ? "محطة باصات"
                      : t == TransportType.train
                          ? "محطة قطار"
                          : t == TransportType.plane
                              ? "مطار"
                              : "مكان",
                ),
              ),
              onSaved: (String? i) {
                if (start) {
                  example.startPose.type = i!;
                } else {
                  example.endPose.type = i!;
                }
              },
              validator: (String? i) => Validator.validateEmpty(
                value: i,
                message: "يجب اعطاء اجابة",
              ),
            ),
          ]
        : [];
  }
}
