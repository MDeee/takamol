import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/validator.dart';
import 'package:takamol_app/providers/survey.dart';

import '/models/survey_freight.dart';
import '/providers/survey_frieght.dart';

import '/widgets/common/toggle_buttons_form_input.dart';
import '/widgets/common/dropdown_form_input.dart';

class FreightLoadingInfo extends StatelessWidget {
  const FreightLoadingInfo({
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
                      "جافة/سائلة/إلخ.",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    label: const Text("الحمولة :"),
                    onChange: (LoadType t) {
                      survey.loadInfoType = t;
                    },
                    options: const <LoadType, Widget>{
                      LoadType.dry: Text("جافة"),
                      LoadType.liquid: Text("سائبة سائلة"),
                      LoadType.container: Text("حاوية"),
                      LoadType.generalLoadOnClosedTruck:
                          Text("بضائع عامة على شاحنة مغلقة"),
                      LoadType.generalLoadOnOpenTruck:
                          Text("بضائع عامة على شاحنة مفتوحة"),
                      LoadType.cars: Text("سيارات"),
                      LoadType.animals: Text("حيوانات"),
                      LoadType.other: Text("أخرى"),
                    },
                    validator: (LoadType? value) => Validator.validateChoice(
                      value: value,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  ...survey.loadInfoType == LoadType.other
                      ? [
                          const SizedBox(height: 10),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              label: Text("أخرى (نوع الحمولة)"),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                            ),
                            validator: (String? value) =>
                                Validator.validateEmpty(
                              value: value,
                              message: "يجب اعطاء اجابة",
                            ),
                            onSaved: (String? s) {
                              survey.loadInfoOther = s!;
                            },
                          ),
                        ]
                      : [],
                  const SizedBox(height: 10),
                  buildDetailedType(survey),
                  const SizedBox(height: 10),
                  ToggleButtonsFormInput(
                    label: const Text("هل لديك سند شحن (فاتورة) "),
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
                      survey.loadHasInvoice = i == 0;
                    },
                    validator: (int? i) => Validator.validateChoice(
                      value: i,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...survey.loadHasInvoice
                      ? [
                          TextFormField(
                            decoration: const InputDecoration(
                              label: Text("وزن الحمولة بالطن"),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9]+\.?\d*'),
                              ),
                            ],
                            onSaved: (String? t) {
                              survey.invoiceInfoNetWeight =
                                  double.tryParse(t!) ?? 0;
                            },
                            validator: (String? i) => Validator.validateEmpty(
                              value: i,
                              message: "يجب اعطاء اجابة",
                            ),
                          ),
                          const SizedBox(height: 10),
                          DropDownFormInput(
                            hint: const Text(
                              "سائبة سائلة/مبردة/إلخ.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            label: const Text("نوع الحمولة :"),
                            options: const <InvoiceType, Widget>{
                              InvoiceType.looseLiquid: Text("سائبة سائلة"),
                              InvoiceType.looseDry: Text("سائبة جافة"),
                              InvoiceType.cooled: Text("مبردة"),
                              InvoiceType.agricaltural: Text("زراعية"),
                              InvoiceType.industrial: Text("صناعية"),
                              InvoiceType.mining: Text("تعدين"),
                              InvoiceType.equipment: Text("معدات"),
                              InvoiceType.machines: Text("آلات"),
                              InvoiceType.cars: Text("سيارات"),
                              InvoiceType.dangrous: Text("مواد خطرة"),
                              InvoiceType.alive: Text("حيوانات حية"),
                              InvoiceType.other: Text("أخرى"),
                            },
                            onChange: (InvoiceType? p) {
                              survey.invoiceInfoType = p!;
                            },
                            validator: (InvoiceType? value) =>
                                Validator.validateChoice(
                              value: value,
                              refused: null,
                              message: "يجب اعطاء اجابة",
                            ),
                          ),
                          ...survey.invoiceInfoType == InvoiceType.other
                              ? [
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: const InputDecoration(
                                      label: Text("أخرى (نوع الحمولة)"),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    validator: (String? value) =>
                                        Validator.validateEmpty(
                                      value: value,
                                      message: "يجب اعطاء اجابة",
                                    ),
                                    onSaved: (String? s) {
                                      survey.invoiceOther = s!;
                                    },
                                  ),
                                ]
                              : [],
                        ]
                      : []
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailedType(SurveyFreightProvider survey) {
    return survey.loadInfoType == LoadType.dry
        ? Column(
            children: [
              DropDownFormInput(
                hint: const Text(
                  "أسمنت/قمح/إلخ.",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                label: const Text("الحمولة الجافة :"),
                options: const <DryLoad, Widget>{
                  DryLoad.cement: Text("أسمنت"),
                  DryLoad.steel: Text("فولاذ"),
                  DryLoad.wheat: Text("حبوب"),
                  DryLoad.various: Text("حصى"),
                  DryLoad.metals: Text("معادن"),
                  DryLoad.agricaltural: Text("منتجات زراعية"),
                  DryLoad.remnants: Text("مخلفات"),
                  DryLoad.other: Text("أخرى"),
                  DryLoad.unkown: Text("لا يعرف"),
                },
                onChange: (DryLoad? p) {
                  survey.dryLoadInfoType = p!;
                },
                validator: (DryLoad? value) => Validator.validateChoice(
                  value: value,
                  refused: null,
                  message: "يجب اعطاء اجابة",
                ),
              ),
              ...survey.dryLoadInfoType == DryLoad.other
                  ? [
                      const SizedBox(height: 10),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                          label: Text("أخرى (نوع الحمولة الجافة)"),
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        ),
                        validator: (String? value) => Validator.validateEmpty(
                          value: value,
                          message: "يجب اعطاء اجابة",
                        ),
                        onSaved: (String? s) {
                          survey.loadInfoOther = s!;
                        },
                      ),
                    ]
                  : [],
            ],
          )
        : survey.loadInfoType == LoadType.liquid
            ? Column(
                children: [
                  DropDownFormInput(
                    hint: const Text(
                      "اسفلت/ماء/إلخ.",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    label: const Text("الحمولة السائلة :"),
                    options: const <LiquidLoad, Widget>{
                      LiquidLoad.fuelOrOil: Text("وقود او نفط"),
                      LiquidLoad.asphalt: Text("اسفلت"),
                      LiquidLoad.water: Text("ماء"),
                      LiquidLoad.agricaltural: Text("منتجات زراعية"),
                      LiquidLoad.other: Text("أخرى"),
                      LiquidLoad.unkown: Text("لا يعرف"),
                    },
                    onChange: (LiquidLoad? p) {
                      survey.liquidLoadInfoType = p!;
                    },
                    validator: (LiquidLoad? value) => Validator.validateChoice(
                      value: value,
                      refused: null,
                      message: "يجب اعطاء اجابة",
                    ),
                  ),
                  ...survey.liquidLoadInfoType == LiquidLoad.other
                      ? [
                          const SizedBox(height: 10),
                          TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                              label: Text("أخرى (نوع الحمولة السائلة)"),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                            ),
                            validator: (String? value) =>
                                Validator.validateEmpty(
                              value: value,
                              message: "يجب اعطاء اجابة",
                            ),
                            onSaved: (String? s) {
                              survey.loadInfoOther = s!;
                            },
                          ),
                        ]
                      : [],
                ],
              )
            : survey.loadInfoType == LoadType.container
                ? Column(
                    children: [
                      DropDownFormInput(
                        hint: const Text(
                          "سلع صناعية/آلات/إلخ.",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        label: const Text("الحاوية :"),
                        options: const <ContainerLoad, Widget>{
                          ContainerLoad.industrial: Text("سلع صناعية"),
                          ContainerLoad.machines: Text("آلات"),
                          ContainerLoad.tools: Text("أدوات"),
                          ContainerLoad.consumerProducts:
                              Text("بضائع المستهلكين"),
                          ContainerLoad.petroChemical: Text("بتروكيماويات"),
                          ContainerLoad.remnants: Text("مخلفات"),
                          ContainerLoad.undefinedLoad:
                              Text("لا يعرف محمله او غير محمله"),
                          ContainerLoad.unknownLoad:
                              Text("محمله ولا يعرف ما بداخله"),
                          ContainerLoad.empty: Text("فارغة"),
                          ContainerLoad.other: Text("أخرى"),
                        },
                        onChange: (ContainerLoad? p) {
                          survey.containerLoadInfoType = p!;
                        },
                        validator: (ContainerLoad? value) =>
                            Validator.validateChoice(
                          value: value,
                          refused: null,
                          message: "يجب اعطاء اجابة",
                        ),
                      ),
                      ...survey.containerLoadInfoType == ContainerLoad.other
                          ? [
                              const SizedBox(height: 10),
                              TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                  label: Text("أخرى (نوع حمولة الحاوية)"),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8),
                                ),
                                validator: (String? value) =>
                                    Validator.validateEmpty(
                                  value: value,
                                  message: "يجب اعطاء اجابة",
                                ),
                                onSaved: (String? s) {
                                  survey.loadInfoOther = s!;
                                },
                              ),
                            ]
                          : [],
                    ],
                  )
                : survey.loadInfoType == LoadType.generalLoadOnClosedTruck ||
                        survey.loadInfoType == LoadType.generalLoadOnOpenTruck
                    ? Column(
                        children: [
                          DropDownFormInput(
                            hint: const Text(
                              "سلع البناء/ادوات/إلخ.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            label: const Text("الحمولة العامة :"),
                            options: const <GeneralLoad, Widget>{
                              GeneralLoad.industrial: Text("سلع صناعية"),
                              GeneralLoad.machines: Text("آلات"),
                              GeneralLoad.tools: Text("أدوات"),
                              GeneralLoad.building: Text("مواد البناء"),
                              GeneralLoad.consumerProducts:
                                  Text("بضائع المستهلكين"),
                              GeneralLoad.other: Text("أخرى"),
                              GeneralLoad.unkown: Text("لا يعرف"),
                            },
                            onChange: (GeneralLoad? p) {
                              survey.generalLoadInfoType = p!;
                            },
                            validator: (GeneralLoad? value) =>
                                Validator.validateChoice(
                              value: value,
                              refused: null,
                              message: "يجب اعطاء اجابة",
                            ),
                          ),
                          ...survey.generalLoadInfoType == GeneralLoad.other
                              ? [
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    decoration: const InputDecoration(
                                      label: Text("أخرى (نوع الحمولة العامة)"),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                    validator: (String? value) =>
                                        Validator.validateEmpty(
                                      value: value,
                                      message: "يجب اعطاء اجابة",
                                    ),
                                    onSaved: (String? s) {
                                      survey.loadInfoOther = s!;
                                    },
                                  ),
                                ]
                              : [],
                        ],
                      )
                    : const SizedBox.shrink();
  }
}
