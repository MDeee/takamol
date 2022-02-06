import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/models/survey.dart';

import '/providers/survey.dart';
import '/providers/survey_cars.dart';

import 'widgets/common/case_info.dart';
import 'widgets/common/job_status.dart';
import 'widgets/common/personal_info.dart';
import 'widgets/rental/header.dart';
import 'widgets/common/journey_destination_info.dart';
import 'widgets/common/journey_origin_info.dart';
import 'widgets/rental/vehicle_info.dart';

class AddSurveyFormCars extends StatelessWidget {
  final GlobalKey formKey;
  final ManualLocations? initManualLocation;
  const AddSurveyFormCars(
      {Key? key, required this.formKey, this.initManualLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveyCarsProvider survey =
        Provider.of<SurveyProvider>(context) as SurveyCarsProvider;

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              HeaderData(
                initManualLocation: initManualLocation,
              ),
              ...(survey.headerCrossCities)
                  ? [
                      const VehicleInfo(),
                      const JourneyOriginInfoWidget(),
                      const JourneyDestinationInfoWidget(),
                      const CaseInfoWidget(),
                      const JobStatusWidget(),
                      const PersonalInfoWidget(),
                    ]
                  : []
            ],
          ),
        ),
      ),
    );
  }
}
