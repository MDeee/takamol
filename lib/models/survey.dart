import 'package:enum_to_string/enum_to_string.dart';

import '/providers/survey.dart';

enum SurveyType {
  pt,
  cars,
  freight,
}
enum TransportType {
  carDriver,
  carPassanger,
  taxi,
  plane,
  crossCityVan,
  train,
  other,
}
enum TravelTarget { fromHome, toHome, other }
enum Purpose {
  work,
  workOwner,
  shopping,
  midical,
  omra,
  hajj,
  university,
  social,
  companion,
  tourism,
  other,
  undefined,
}
enum Repeatablity {
  dialy,
  weekly,
  fortnight,
  monthly,
  halfOrQuarterYear,
  yearly,
  lessThanYearly,
  onlyOnce,
}
enum Sponser {
  me,
  relative,
  other,
}
enum PoseType { busStation, trainStation, airport, place }
enum Education {
  primary,
  preparatory,
  secondary,
  university,
  postGraduate,
}
enum Employment {
  employee,
  unemployed,
  freeBusiness,
  student,
  houseWife,
  retired,
  specialNeeds,
}
enum IncomeRange {
  l2500,
  f2500T6500,
  f6501T13000,
  f13001T25000,
  f25001T41000,
  m41000,
  private,
}

enum ManualLocations {
  RiyadhAirport,
  DamamAirport,
  GaddahAirport,
  MadinahAirport,
  TaboukAirport,
  AbhahAirport,
  RiyadhSabtko,
  DamamSabtko,
  GaddahSabtko,
  MadinahSabtko,
  MakkahSabtko,
  TaboukSabtko,
  KhamesMshetSabtko,
  RiyadhTrain,
  RiyadhSarTrain,
  HaylTrain,
  QasemTrain,
  DmamTrain,
  MakkahHaramTrain,
  MadinahHaramTrain,
  GaddahHaramTrain,
  RS1,
  RS2,
  RS3,
  RS4,
  RS5,
  RS6,
  RS7,
  RS8,
  RS9,
  RS10,
  RS11,
  RS12,
  RS13,
  RS14,
  RS15,
  RS16,
  RS17,
  RS18,
  RS19,
  RS20,
  RS21,
  RS22,
  RS23,
  RS24,
  RS25,
  BP1,
  BP2,
  BP3,
  BP4,
  BP5,
  BP6,
  BP7,
  BP8,
}

class HeaderBase {
  late double locationLat;
  late double locationLong;
  late ManualLocations manualLocation;
  late DateTime date;
  late DateTime startTime;
  late DateTime endTime;
  late int formNumber;
  late String city;
  late int empNumber;
  bool crossCities = false;
  double age = 0;
  bool isMale = true;
  bool haveDrivingLicense = false;
  bool haveCrossCitiesCar = true;

  HeaderBase();
}

class LocationInfo {
  TravelTarget? travelTarget;
  String? name;

  LocationInfo();
}

class Journy {
  LocationInfo startLocation = LocationInfo();
  LocationInfo endLocation = LocationInfo();
  String? purpose;
  String? goType;
  String? backType;
  late Repeatablity repeatablity;
  late DateTime journyStart;
  late DateTime journyArrival;
  late DateTime returnStart;
  late DateTime returnArrival;
  late int distance;
}

class CaseInfo {
  bool? isAlone;
  late bool usuallyAlone;
  int numberOfFamilyCompanions = 0;
  int numberOfStrangerCompanions = 0;
  late int numberOfCrossCityJournies;
  late Repeatablity repeatablity;
  late Sponser sponser;
  CaseInfo();
}

class Pose {
  String type = "";
  late String name;
  Pose();
}

class JourneyExample {
  Pose startPose = Pose();
  Pose endPose = Pose();
  late bool isTotalBudget;
  String? transportType;
  late DateTime start;
  late DateTime end;
  late double budget;
  JourneyExample();
  JourneyExample.fromJson(Map<String, dynamic> json) {
    startPose = Pose();
    startPose.name = json['startPoseName'];
    startPose.type = json['startPoseType'];
    endPose = Pose();
    endPose.name = json['endPoseName'];
    endPose.type = json['endPoseType'];
    isTotalBudget = json['isTotalBudget'];
    transportType = json['transportType'];
    start = DateTime.parse(json['start']);
    end = DateTime.parse(json['end']);
    budget = json['budget'];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['startPoseName'] = startPose.name;
    data['startPoseType'] = startPose.type;
    data['endPoseName'] = endPose.name;
    data['endPoseType'] = endPose.type;
    data['isTotalBudget'] = isTotalBudget;
    data['transportType'] = transportType;
    data['start'] = start.toString();
    data['end'] = end.toString();
    data['budget'] = budget;

    return data;
  }
}

class JobStatus {
  late Education education;
  late bool isCitizen;
  late Employment employment;
  late IncomeRange incomeRange;

  JobStatus();
}

abstract class Survey {
  String id = "";
  late HeaderBase header;
  final SurveyType type;
  bool synced = false;
  late SurveyProvider provider;
  Survey(this.type);
  Map<String, dynamic> toJson();
}
