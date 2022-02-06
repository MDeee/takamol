import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/models/survey.dart';
import 'package:takamol_app/providers/survey.dart';

import '/providers/survey_frieght.dart';

import 'widgets/freight/freight_loading_info.dart';
import 'widgets/freight/general_info.dart';
import 'widgets/freight/header_freight.dart';
import 'widgets/freight/freight_vehcile_info.dart';
import 'widgets/freight/journey_destination_freight_info.dart';
import 'widgets/freight/journey_origin_freight_info.dart';

class AddSurveyFormFreight extends StatelessWidget {
  final ManualLocations? initManualLocation;
  final GlobalKey formKey;
  const AddSurveyFormFreight({
    required this.formKey,
    Key? key,
    this.initManualLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SurveyFreightProvider survey =
        Provider.of<SurveyProvider>(context) as SurveyFreightProvider;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
          child: Column(
            children: [
              HeaderFreightData(initManualLocation: initManualLocation),
              ...(survey.headerCrossCities)
                  ? [
                      const FreightVehicleInfo(),
                      survey.headerIsLoaded
                          ? const FreightLoadingInfo()
                          : const SizedBox.shrink(),
                      const JourneyOriginFreightInfoWidget(),
                      const JourneyDestinationFreightInfoWidget(),
                      const GeneralInfo()
                    ]
                  : []
            ],
          ),
        ),
      ),
    );
  }
}
