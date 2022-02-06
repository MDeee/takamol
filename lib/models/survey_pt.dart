import 'package:enum_to_string/enum_to_string.dart';
import 'package:takamol_app/models/suggestion_card.dart';

import 'survey.dart';

import '/providers/survey_pt.dart';

class SurveyPT extends Survey {
  Journy journy = Journy();
  CaseInfo caseInfo = CaseInfo();
  List<JourneyExample> examples = [];
  List<SuggestionCard> suggestions = [];
  JobStatus jobStatus = JobStatus();
  late int familyCount;
  late String phoneNumber;
  String name = "";
  String suggestionName = "";

  SurveyPT() : super(SurveyType.pt) {
    super.provider = SurveyPTProvider(this);
    super.header = HeaderBase();
  }
  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = EnumToString.convertToString(type, camelCase: true);
    data['suggestionName'] = suggestionName;
    data['synced'] = synced;
    data['headerLat'] = header.locationLat;
    data['headerLong'] = header.locationLong;
    data['manualLocation'] =
        EnumToString.convertToString(header.manualLocation, camelCase: true);
    data['headerDate'] = header.date.toString();
    data['headerStartTime'] = header.startTime.toString();
    data['headerEndTime'] = header.endTime.toString();
    data['headerFormNumber'] = header.formNumber;
    data['headerCity'] = header.city;
    data['headerEmpNumber'] = header.empNumber;
    data['headerCrossCities'] = header.crossCities;
    data['headerAge'] = header.age;
    data['headerIsMale'] = header.isMale;
    data['headerHaveDrivingLicense'] = header.haveDrivingLicense;
    data['headerHaveCrossCitiesCar'] = header.haveCrossCitiesCar;
    data['journeyStartLocationTravelTarget'] = EnumToString.convertToString(
        journy.startLocation.travelTarget,
        camelCase: true);
    data['journeyStartLocationName'] = journy.startLocation.name;
    data['journeyEndLocationTravelTarget'] = EnumToString.convertToString(
        journy.endLocation.travelTarget,
        camelCase: true);
    data['journeyEndLocationName'] = journy.endLocation.name;
    data['journeyPurpose'] = journy.purpose;
    data['journeyGoType'] = journy.goType;
    data['journeyBackType'] = journy.backType;
    data['distance'] = journy.distance;
    data['journeyRepeatablitiy'] =
        EnumToString.convertToString(journy.repeatablity, camelCase: true);
    data['journeyStartDate'] = journy.journyStart.toString();
    data['journeyArrivalDate'] = journy.journyArrival.toString();
    data['returnStartDate'] = journy.returnStart.toString();
    data['returnArrivalDate'] = journy.returnArrival.toString();
    data['caseInfoIsAlone'] = caseInfo.isAlone;
    data['caseInfoUsuallyAlone'] = caseInfo.usuallyAlone;
    data['caseInfoUsuallyNumberOfCrossCityJournies'] =
        caseInfo.numberOfCrossCityJournies;
    data['caseInfoNumberOfFamilyCompanions'] =
        caseInfo.numberOfFamilyCompanions;
    data['caseInfoNumberOfStrangerCompanions'] =
        caseInfo.numberOfStrangerCompanions;
    data['caseInfoRepeatablity'] =
        EnumToString.convertToString(caseInfo.repeatablity, camelCase: true);
    data['caseInfoSponser'] =
        EnumToString.convertToString(caseInfo.sponser, camelCase: true);
    data['jobStatusEducation'] =
        EnumToString.convertToString(jobStatus.education, camelCase: true);
    data['jobStatusIsCitizen'] = jobStatus.isCitizen;
    data['jobStatusEmployment'] =
        EnumToString.convertToString(jobStatus.employment, camelCase: true);
    data['jobStatusIncomeRange'] =
        EnumToString.convertToString(jobStatus.incomeRange, camelCase: true);
    data['name'] = name;
    data['familyCount'] = familyCount;
    data['phone'] = phoneNumber;
    data['journeyExamples'] = examples.map((e) => e.toJson()).toList();
    data['suggestions'] = suggestions.map((e) => e.toJson()).toList();
    return data;
  }

  SurveyPT.fromJson(Map<String, dynamic> json)
      : super(EnumToString.fromString(SurveyType.values, json['type'],
            camelCase: true)!) {
    provider = SurveyPTProvider(this);
    id = json['id'];
    synced = json['synced'];
    suggestionName = json['suggestionName'];
    header = HeaderBase();
    header.locationLat = json['headerLat'];
    header.locationLong = json['headerLong'];
    header.manualLocation = EnumToString.fromString(
        ManualLocations.values, json['manualLocation'],
        camelCase: true)!;
    header.date = DateTime.parse(json['headerDate']);
    header.startTime = DateTime.parse(json['headerStartTime']);
    header.endTime = DateTime.parse(json['headerEndTime']);
    header.formNumber = json['headerFormNumber'];
    header.city = json['headerCity'];
    header.empNumber = json['headerEmpNumber'];
    header.crossCities = json['headerCrossCities'];
    header.age = json['headerAge'];
    header.isMale = json['headerIsMale'];
    header.haveDrivingLicense = json['headerHaveDrivingLicense'];
    header.haveCrossCitiesCar = json['headerHaveCrossCitiesCar'];
    journy = Journy();
    journy.startLocation.travelTarget = EnumToString.fromString(
        TravelTarget.values, json['journeyStartLocationTravelTarget'],
        camelCase: true)!;
    journy.startLocation.name = json['journeyStartLocationName'];
    journy.endLocation.travelTarget = EnumToString.fromString(
        TravelTarget.values, json['journeyEndLocationTravelTarget'],
        camelCase: true)!;
    journy.endLocation.name = json['journeyEndLocationName'];
    journy.distance = json['distance'];
    journy.purpose = json['journeyPurpose'];
    journy.goType = json['journeyGoType'];
    journy.backType = json['journeyBackType'];
    journy.repeatablity = EnumToString.fromString(
        Repeatablity.values, json['journeyRepeatablitiy'],
        camelCase: true)!;
    journy.journyStart = DateTime.parse(json['journeyStartDate']);
    journy.journyArrival = DateTime.parse(json['journeyArrivalDate']);
    journy.returnStart = DateTime.parse(json['returnStartDate']);
    journy.returnArrival = DateTime.parse(json['returnArrivalDate']);
    caseInfo = CaseInfo();
    caseInfo.isAlone = json['caseInfoIsAlone'];
    caseInfo.usuallyAlone = json['caseInfoUsuallyAlone'];
    caseInfo.numberOfCrossCityJournies =
        json['caseInfoUsuallyNumberOfCrossCityJournies'];
    caseInfo.numberOfFamilyCompanions =
        json['caseInfoNumberOfFamilyCompanions'];
    caseInfo.numberOfStrangerCompanions =
        json['caseInfoNumberOfStrangerCompanions'];
    caseInfo.repeatablity = EnumToString.fromString(
        Repeatablity.values, json['caseInfoRepeatablity'],
        camelCase: true)!;
    caseInfo.sponser = EnumToString.fromString(
        Sponser.values, json['caseInfoSponser'],
        camelCase: true)!;
    jobStatus = JobStatus();
    jobStatus.education = EnumToString.fromString(
        Education.values, json['jobStatusEducation'],
        camelCase: true)!;
    jobStatus.isCitizen = json['jobStatusIsCitizen'];
    jobStatus.employment = EnumToString.fromString(
        Employment.values, json['jobStatusEmployment'],
        camelCase: true)!;
    jobStatus.incomeRange = EnumToString.fromString(
        IncomeRange.values, json['jobStatusIncomeRange'],
        camelCase: true)!;
    name = json['name'];
    familyCount = json['familyCount'];
    phoneNumber = json['phone'];
    examples = json['journeyExamples']
        .map<JourneyExample>(
            (e) => JourneyExample.fromJson(e as Map<String, dynamic>))
        .toList();
    suggestions = json['suggestions']
        .map<SuggestionCard>(
            (e) => SuggestionCard.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
