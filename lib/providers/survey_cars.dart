import '/models/survey.dart';
import '/models/survey_cars.dart';

import 'survey.dart';

class SurveyCarsProvider extends SurveyProvider {
  @override
  String push_url = "rentData";

  late final SurveyCars _data;
  SurveyCarsProvider(data) : super(data) {
    _data = super.data as SurveyCars;
  }

  @override
  String get id => _data.id;
  @override
  set id(String id) {
    _data.id = id;
    // notifyListeners();
  }

  @override
  SurveyType get type => _data.type;

  @override
  bool get synced => _data.synced;
  // @override
  // set synced(bool s) {
  //   _data.synced = s;
  //   // notifyListeners();
  // }

  @override
  double get headerAge => _data.header.age;
  @override
  set headerAge(double l) {
    _data.header.age = l;
    notifyListeners();
  }

  @override
  double get headerLat => _data.header.locationLat;
  @override
  set headerLat(double l) {
    _data.header.locationLat = l;
    // notifyListeners();
  }

  @override
  double get headerLong => _data.header.locationLong;
  @override
  set headerLong(double l) {
    _data.header.locationLong = l;
    // notifyListeners();
  }

  @override
  ManualLocations get manualLocation => _data.header.manualLocation;
  @override
  set manualLocation(ManualLocations l) {
    _data.header.manualLocation = l;
    // notifyListeners();
  }

  @override
  DateTime get headerDate => _data.header.date;
  @override
  set headerDate(DateTime date) {
    _data.header.date = date;
    // notifyListeners();
  }

  @override
  DateTime get headerStartTime => _data.header.startTime;
  @override
  set headerStartTime(DateTime startTime) {
    _data.header.startTime = startTime;
    // notifyListeners();
  }

  @override
  DateTime get headerEndTime => _data.header.endTime;
  @override
  set headerEndTime(DateTime endTime) {
    _data.header.endTime = endTime;
    // notifyListeners();
  }

  @override
  int get headerFormNumber => _data.header.formNumber;
  @override
  set headerFormNumber(int i) {
    _data.header.formNumber = i;
    // notifyListeners();
  }

  @override
  String get headerCity => _data.header.city;
  @override
  set headerCity(String c) {
    _data.header.city = c;
    // notifyListeners();
  }

  @override
  int get headerEmpNumber => _data.header.empNumber;
  @override
  set headerEmpNumber(int i) {
    _data.header.empNumber = i;
    // notifyListeners();
  }

  @override
  bool get headerCrossCities => _data.header.crossCities;
  @override
  set headerCrossCities(bool b) {
    _data.header.crossCities = b;
    notifyListeners();
  }

  @override
  bool get headerIsMale => _data.header.isMale;
  @override
  set headerIsMale(bool b) {
    _data.header.isMale = b;
    // notifyListeners();
  }

  @override
  bool get headerHaveDrivingLicense => _data.header.haveDrivingLicense;
  @override
  set headerHaveDrivingLicense(bool b) {
    _data.header.haveDrivingLicense = b;
    notifyListeners();
  }

  @override
  bool get headerHaveCrossCitiesCar => _data.header.haveCrossCitiesCar;
  @override
  set headerHaveCrossCitiesCar(bool b) {
    _data.header.haveCrossCitiesCar = b;
    // notifyListeners();
  }

  @override
  TravelTarget? get journeyStartLocationTravelTarget =>
      _data.journy.startLocation.travelTarget;
  @override
  set journeyStartLocationTravelTarget(TravelTarget? t) {
    _data.journy.startLocation.travelTarget = t;
    notifyListeners();
  }

  @override
  String? get journeyStartLocationName => _data.journy.startLocation.name ?? "";
  @override
  set journeyStartLocationName(String? s) {
    _data.journy.startLocation.name = s;

    notifyListeners();
  }

  @override
  TravelTarget? get journeyEndLocationTravelTarget =>
      _data.journy.endLocation.travelTarget;
  @override
  set journeyEndLocationTravelTarget(TravelTarget? t) {
    _data.journy.endLocation.travelTarget = t;
    notifyListeners();
  }

  @override
  String? get journeyEndLocationName => _data.journy.endLocation.name;
  @override
  set journeyEndLocationName(String? s) {
    _data.journy.endLocation.name = s;
    // notifyListeners();
  }

  @override
  String get journeyPurpose => _data.journy.purpose ?? "";
  @override
  set journeyPurpose(String p) {
    _data.journy.purpose = p;
    notifyListeners();
  }

  @override
  String get journeyGoType => _data.journy.goType ?? "";
  @override
  set journeyGoType(String t) {
    _data.journy.goType = t;
    notifyListeners();
  }

  @override
  String get journeyBackType => _data.journy.backType ?? "";
  @override
  set journeyBackType(String t) {
    _data.journy.backType = t;
    notifyListeners();
  }

  @override
  int? get distance => _data.journy.distance;
  @override
  set distance(int? t) {
    _data.journy.distance = t;
    notifyListeners();
  }

  @override
  Repeatablity get journeyRepeatablitiy => _data.journy.repeatablity;
  @override
  set journeyRepeatablitiy(Repeatablity r) {
    _data.journy.repeatablity = r;
    // notifyListeners();
  }

  @override
  DateTime get journeyStartDate => _data.journy.journyStart;
  @override
  set journeyStartDate(DateTime d) {
    _data.journy.journyStart = d;
    // notifyListeners();
  }

  @override
  DateTime get journeyArrivalDate => _data.journy.journyArrival;
  @override
  set journeyArrivalDate(DateTime d) {
    _data.journy.journyArrival = d;
    // notifyListeners();
  }

  @override
  DateTime get returnStartDate => _data.journy.returnStart;
  @override
  set returnStartDate(DateTime d) {
    _data.journy.returnStart = d;
    // notifyListeners();
  }

  @override
  DateTime get returnArrivalDate => _data.journy.returnArrival;
  @override
  set returnArrivalDate(DateTime d) {
    _data.journy.returnArrival = d;
    // notifyListeners();
  }

  @override
  bool? get caseInfoIsAlone => _data.caseInfo.isAlone;
  @override
  set caseInfoIsAlone(bool? b) {
    _data.caseInfo.isAlone = b;
    notifyListeners();
  }

  @override
  bool get caseInfoUsuallyAlone => _data.caseInfo.usuallyAlone;
  @override
  set caseInfoUsuallyAlone(bool b) {
    _data.caseInfo.usuallyAlone = b;
    // notifyListeners();
  }

  @override
  int get caseInfoNumberOfFamilyCompanions =>
      _data.caseInfo.numberOfFamilyCompanions;
  @override
  set caseInfoNumberOfFamilyCompanions(int i) {
    _data.caseInfo.numberOfFamilyCompanions = i;
    // notifyListeners();
  }

  @override
  int get caseInfoUsuallyNumberOfCrossCityJournies =>
      _data.caseInfo.numberOfCrossCityJournies;
  @override
  set caseInfoUsuallyNumberOfCrossCityJournies(int i) {
    _data.caseInfo.numberOfCrossCityJournies = i;
    // notifyListeners();
  }

  @override
  int get caseInfoNumberOfStrangerCompanions =>
      _data.caseInfo.numberOfStrangerCompanions;
  @override
  set caseInfoNumberOfStrangerCompanions(int i) {
    _data.caseInfo.numberOfStrangerCompanions = i;
    // notifyListeners();
  }

  @override
  Repeatablity get caseInfoRepeatablity => _data.caseInfo.repeatablity;
  @override
  set caseInfoRepeatablity(Repeatablity r) {
    _data.caseInfo.repeatablity = r;
    // notifyListeners();
  }

  @override
  Sponser get caseInfoSponser => _data.caseInfo.sponser;
  @override
  set caseInfoSponser(Sponser s) {
    _data.caseInfo.sponser = s;
    // notifyListeners();
  }

  @override
  Education get jobStatusEducation => _data.jobStatus.education;
  @override
  set jobStatusEducation(Education e) {
    _data.jobStatus.education = e;
    // notifyListeners();
  }

  @override
  bool get jobStatusIsCitizen => _data.jobStatus.isCitizen;
  @override
  set jobStatusIsCitizen(bool b) {
    _data.jobStatus.isCitizen = b;
    // notifyListeners();
  }

  @override
  Employment get jobStatusEmployment => _data.jobStatus.employment;
  @override
  set jobStatusEmployment(Employment e) {
    _data.jobStatus.employment = e;
    // notifyListeners();
  }

  @override
  IncomeRange get jobStatusIncomeRange => _data.jobStatus.incomeRange;

  @override
  set jobStatusIncomeRange(IncomeRange r) {
    _data.jobStatus.incomeRange = r;
    // notifyListeners();
  }

  @override
  int get familyCount => _data.familyCount;
  @override
  set familyCount(int i) {
    _data.familyCount = i;
    // notifyListeners();
  }

  @override
  String get name => _data.name;
  @override
  set name(String i) {
    _data.name = i;
    // notifyListeners();
  }

  @override
  String get phone => _data.phoneNumber;
  @override
  set phone(String i) {
    _data.phoneNumber = i;
    // notifyListeners();
  }

  @override
  set journeyExamples(List<JourneyExample> e) => _data.examples = e;
  @override
  List<JourneyExample> get journeyExamples => [..._data.examples];

  set headerCarType(CarType e) => (_data.header as Header).carType = e;
  CarType get headerCarType => (_data.header as Header).carType;

  set headerPropertyType(PropertyType e) =>
      (_data.header as Header).propertyType = e;
  PropertyType get headerPropertyType => (_data.header as Header).propertyType;

  set headerFrom(String e) => (_data.header as Header).from = e;
  String get headerFrom => (_data.header as Header).from;

  set headerTo(String e) => (_data.header as Header).to = e;
  String get headerTo => (_data.header as Header).to;
}
