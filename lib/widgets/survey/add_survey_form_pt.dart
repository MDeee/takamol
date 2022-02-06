import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/distance_helper.dart';
import 'package:takamol_app/models/survey.dart';
import 'package:takamol_app/widgets/survey/widgets/suggestions/suggestions.dart';

import '/providers/survey.dart';
import '/providers/survey_pt.dart';

import 'widgets/common/case_info.dart';
import 'widgets/common/job_status.dart';
import 'widgets/common/personal_info.dart';
import 'widgets/pt/header.dart';
import 'widgets/common/journey_destination_info.dart';
import 'widgets/common/journey_origin_info.dart';

class AddSurveyFormPt extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ManualLocations? initManualLocation;
  const AddSurveyFormPt(
      {required this.formKey, Key? key, this.initManualLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveyPTProvider survey =
        Provider.of<SurveyProvider>(context) as SurveyPTProvider;

    print(initManualLocation);

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              HeaderData(initManualLocation: initManualLocation),
              ...(survey.headerAge >= 14 && survey.headerCrossCities)
                  ? [
                      const JourneyOriginInfoWidget(),
                      const JourneyDestinationInfoWidget(),
                      const CaseInfoWidget(),
                      const JobStatusWidget(),
                      const PersonalInfoWidget(),
                    ]
                  : [],
              Distance.city_exists(survey.journeyStartLocationName ?? "") &&
                      Distance.city_exists(
                          survey.journeyEndLocationName ?? "") &&
                      survey.journeyEndLocationName != null &&
                      survey.journeyEndLocationName != null &&
                      (survey.journeyPurpose == "Work owner" ||
                          survey.journeyPurpose == "Work" ||
                          survey.journeyPurpose == "Social" ||
                          survey.journeyPurpose == "Omra" ||
                          survey.journeyPurpose == "Hajj")
                  ? Suggestions()
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
