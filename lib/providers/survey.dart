import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:takamol_app/helpers/api_helper.dart';

import '/models/survey.dart';

abstract class SurveyProvider with ChangeNotifier {
  late Map _authHeader;
  final Survey data;
  bool syncing = false;
  SurveyProvider(this.data);
  abstract String push_url;
  void auth(
    Map authHeader,
  ) {
    _authHeader = authHeader;
  }

  Future<bool> fetch() async {
    // var response = await APIHelper.getData(
    //   url: "events/${_data.id}",
    //   body: _authHeader,
    // );
    // print('fetching');
    // if (response.statusCode == 200) {
    //   var data = json.decode(response.body);
    //   _members = (data['data']['familyMembers'] as List)
    //       .map((e) => MemberInfo.fromJson(e))
    //       .toList();
    //   _members.insert(0, MemberInfo(id: -1, name: "Me", image: ''));
    //   notifyListeners();
    //   return true;
    // } else {
    //   throw Future.error('Couldn\'t fetch data');
    // }
    notifyListeners();
    return true;
  }

  Future<bool> sync({callback, bool force = false}) async {
    print('trying to ${data.header.date}');
    final prefs = await SharedPreferences.getInstance();
    while (prefs.getBool('dontsync')! && !force) {
      await Future.delayed(Duration(seconds: 1));
      print("dont sync effect");
    }
    if (synced || syncing) {
      print('already trying to  $synced $syncing');
      return true;
    }

    syncing = true;

    notifyListeners();

    print('data send to server ...');
    log(json.encode(data));

    final res;
    try {
      res = await APIHelper.postData(
        url: push_url,
        body: json.encode(data.toJson()),
      );
    } catch (e) {
      syncing = false;
      // await Future.delayed(Duration(seconds: 1));
      notifyListeners();
      return Future.error("couldn't reach server");
    }
    print(res.body);
    if (res.statusCode != 200) {
      syncing = false;
      notifyListeners();
      print("server refused");
      return Future.error("server refused");
    }
    print('${data.header.date} sent request');

    final resObj = json.decode(res.body);
    data.synced = resObj['status'];
    syncing = false;
    if (callback != null) {
      callback();
    }
    print('synced');
    notifyListeners();
    return true;
  }

  String get id;
  set id(String id);

  SurveyType get type;

  bool get synced;
  // set synced(bool s);

  double get headerAge;
  set headerAge(double l);

  double get headerLat;
  set headerLat(double l);

  double get headerLong;
  set headerLong(double l);

  ManualLocations get manualLocation;
  set manualLocation(ManualLocations l);

  DateTime get headerDate;
  set headerDate(DateTime date);

  DateTime get headerStartTime;
  set headerStartTime(DateTime startTime);

  DateTime get headerEndTime;
  set headerEndTime(DateTime endTime);

  int get headerFormNumber;
  set headerFormNumber(int i);

  String get headerCity;
  set headerCity(String c);

  int get headerEmpNumber;
  set headerEmpNumber(int i);

  bool get headerCrossCities;
  set headerCrossCities(bool b);

  bool get headerIsMale;
  set headerIsMale(bool b);

  bool get headerHaveDrivingLicense;
  set headerHaveDrivingLicense(bool b);

  bool get headerHaveCrossCitiesCar;
  set headerHaveCrossCitiesCar(bool b);

  TravelTarget? get journeyStartLocationTravelTarget;
  set journeyStartLocationTravelTarget(TravelTarget? t);

  String? get journeyStartLocationName;
  set journeyStartLocationName(String? s);

  TravelTarget? get journeyEndLocationTravelTarget;
  set journeyEndLocationTravelTarget(TravelTarget? t);

  String? get journeyEndLocationName;
  set journeyEndLocationName(String? s);

  String get journeyPurpose;
  set journeyPurpose(String p);

  String get journeyGoType;
  set journeyGoType(String t);

  int? get distance;
  set distance(int? t);

  String get journeyBackType;
  set journeyBackType(String t);

  Repeatablity get journeyRepeatablitiy;
  set journeyRepeatablitiy(Repeatablity r);

  DateTime get journeyStartDate;
  set journeyStartDate(DateTime d);

  DateTime get journeyArrivalDate;
  set journeyArrivalDate(DateTime d);

  DateTime get returnStartDate;
  set returnStartDate(DateTime d);

  DateTime get returnArrivalDate;
  set returnArrivalDate(DateTime d);

  bool? get caseInfoIsAlone;
  set caseInfoIsAlone(bool? b);

  bool get caseInfoUsuallyAlone;
  set caseInfoUsuallyAlone(bool b);

  int get caseInfoNumberOfFamilyCompanions;
  set caseInfoNumberOfFamilyCompanions(int i);

  int get caseInfoUsuallyNumberOfCrossCityJournies;
  set caseInfoUsuallyNumberOfCrossCityJournies(int i);

  int get caseInfoNumberOfStrangerCompanions;
  set caseInfoNumberOfStrangerCompanions(int i);

  Repeatablity get caseInfoRepeatablity;
  set caseInfoRepeatablity(Repeatablity r);

  Sponser get caseInfoSponser;
  set caseInfoSponser(Sponser s);

  Education get jobStatusEducation;
  set jobStatusEducation(Education e);

  bool get jobStatusIsCitizen;
  set jobStatusIsCitizen(bool b);

  Employment get jobStatusEmployment;
  set jobStatusEmployment(Employment e);

  set jobStatusIncomeRange(IncomeRange r);
  IncomeRange get jobStatusIncomeRange;

  String get phone;
  set phone(String i);

  String get name;
  set name(String i);

  int get familyCount;
  set familyCount(int i);

  set journeyExamples(List<JourneyExample> e);
  List<JourneyExample> get journeyExamples;
}
