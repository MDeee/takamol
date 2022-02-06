import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:takamol_app/models/survey.dart';

import '/models/survey_cars.dart';
import '/models/survey_freight.dart';
import '/models/survey_pt.dart';

import '/providers/auth.dart';
import '/providers/survey.dart';
import '/providers/surveys.dart';

import '/widgets/survey/add_survey_form_cars.dart';
import '/widgets/survey/add_survey_form_freight.dart';
import '/widgets/survey/add_survey_form_pt.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({Key? key}) : super(key: key);
  static const routeName = "survey-screen";

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  ManualLocations? initManualLocation;
  late bool clicked;
  @override
  void initState() {
    super.initState();
    clicked = false;
  }

  Future<LocationData> getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return Future.error(0);
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return Future.error(1);
      }
    }

    return await location.getLocation();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey();

    String type =
        ModalRoute.of(context)!.settings.arguments as String? ?? "Personal";

    return ChangeNotifierProvider<SurveyProvider>.value(
      value: type == "Personal"
          ? SurveyPT().provider
          : type == "Rental"
              ? SurveyCars().provider
              : SurveyFreight().provider,
      child: Builder(
        builder: (ctx) {
          SurveyProvider survey =
              Provider.of<SurveyProvider>(ctx, listen: true);
          survey.headerStartTime = DateTime.now();
          Auth auth = Provider.of<Auth>(ctx, listen: false);
          SurveysProvider surveys =
              Provider.of<SurveysProvider>(ctx, listen: false);
          return Scaffold(
            appBar: AppBar(
              title: const Text("تطوير أنظمة تخطيط النقل"),
              actions: [
                IconButton(
                  icon: const Icon(Icons.save),
                  onPressed: clicked
                      ? null
                      : () {
                          if (_key.currentState!.validate()) {
                            setState(() {
                              clicked = true;
                            });
                            _key.currentState!.save();
                            getLocation().then(
                              (value) {
                                survey.id = auth.uid.toString();
                                survey.headerLat = value.latitude ?? 0;
                                survey.headerDate = DateTime.now();
                                survey.headerLong = value.longitude ?? 0;
                                survey.headerEndTime = DateTime.now();
                                survey.headerFormNumber = 0;
                                survey.headerEmpNumber = auth.uid;
                                survey.headerCity = "";
                                if (survey.type != SurveyType.freight) {
                                  if (survey.journeyExamples.isNotEmpty) {
                                    survey.journeyExamples.first.transportType =
                                        survey.journeyGoType;
                                    survey.journeyExamples.first.startPose
                                            .name =
                                        survey.journeyStartLocationName ?? "";

                                    survey.journeyExamples.last.transportType =
                                        survey.journeyBackType;
                                    survey.journeyExamples.last.endPose.name =
                                        survey.journeyEndLocationName ?? "";
                                  }
                                }
                                surveys.addSurvey(survey.data);
                                setState(() {
                                  initManualLocation = survey.manualLocation;
                                  clicked = false;
                                });
                              },
                            ).onError(
                              (error, stackTrace) {
                                print(error);
                                log(stackTrace.toString());
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text("يجب تشغيل خدمة تحديد الموقع"),
                                    duration: Duration(seconds: 3),
                                    elevation: 1,
                                  ),
                                );
                                setState(() {
                                  clicked = false;
                                });
                              },
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("يوجد خطأ بالبيانات"),
                                duration: Duration(seconds: 3),
                                elevation: 1,
                              ),
                            );
                          }
                        },
                )
              ],
            ),
            body: type == "Personal"
                ? AddSurveyFormPt(
                    formKey: _key,
                    initManualLocation: initManualLocation,
                  )
                : type == "Rental"
                    ? AddSurveyFormCars(
                        formKey: _key,
                        initManualLocation: initManualLocation,
                      )
                    : AddSurveyFormFreight(
                        formKey: _key,
                        initManualLocation: initManualLocation,
                      ),
          );
        },
      ),
    );
  }
}
