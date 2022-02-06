import '/models/survey.dart';
import '/models/survey_freight.dart';

import 'survey.dart';

class SurveyFreightProvider extends SurveyProvider {
  @override
  String push_url = "transportData";

  late final SurveyFreight _data;
  SurveyFreightProvider(_data) : super(_data) {
    this._data = super.data as SurveyFreight;
  }
  bool get headerIsLoaded {
    return (_data.header as Header).isLoaded;
  }

  set headerIsLoaded(bool t) {
    (_data.header as Header).isLoaded = t;
    notifyListeners();
  }

  bool get loadHasInvoice {
    return _data.invoiceInfo.exists;
  }

  set loadHasInvoice(bool t) {
    if (!t) {
      _data.invoiceInfo = InvoiceInfo(t);
    } else {
      _data.invoiceInfo = InvoiceDetailedInfo();
    }
    notifyListeners();
  }

  PostArrival get generalInfoPostArival {
    return _data.generalInfo.postArrival;
  }

  set generalInfoPostArival(PostArrival t) {
    _data.generalInfo.postArrival = t;
    notifyListeners();
  }

  String get loadInfoOther {
    return _data.loadInfo.other ?? "";
  }

  String get invoiceOther {
    return _data.invoiceInfo.other ?? "";
  }

  void set invoiceOther(String t) {
    _data.invoiceInfo.other = t;
  }

  void set loadInfoOther(String t) {
    _data.loadInfo.other = t;
  }

  LoadType get loadInfoType {
    return _data.loadInfo.type;
  }

  set loadInfoType(LoadType t) {
    switch (t) {
      case LoadType.liquid:
        _data.loadInfo = LiquidLoadInfo();
        break;
      case LoadType.dry:
        _data.loadInfo = DryLoadInfo();
        break;
      case LoadType.container:
        _data.loadInfo = ContainerLoadInfo();
        break;
      case LoadType.generalLoadOnClosedTruck:
      case LoadType.generalLoadOnOpenTruck:
        _data.loadInfo = GeneralLoadInfo(t);
        print("test");
        break;
      default:
        _data.loadInfo = LoadInfo(t);
    }
    print(t);
    notifyListeners();
  }

  @override
  SurveyType get type => _data.type;

  CarType get headerCarType => (_data.header as Header).carType;
  set headerCarType(CarType t) {
    (_data.header as Header).carType = t;
  }

  PropertyType get headerPropertyType => (_data.header as Header).propertyType;
  set headerPropertyType(PropertyType t) {
    (_data.header as Header).propertyType = t;
  }

  String get headerFrom => (_data.header as Header).from;
  set headerFrom(String t) {
    (_data.header as Header).from = t;
  }

  String get headerTo => (_data.header as Header).to;
  set headerTo(String t) {
    (_data.header as Header).to = t;
  }

  int get headerAxisCount => (_data.header as Header).axisCount;
  set headerAxisCount(int t) {
    (_data.header as Header).axisCount = t;
  }

  bool get headerRefrigerator => (_data.header as Header).hasRefrigerator;
  set headerRefrigerator(bool t) {
    (_data.header as Header).hasRefrigerator = t;
  }

  @override
  String get id => _data.id;
  @override
  set id(String id) {
    _data.id = id;
    // notifyListeners();
  }

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

  String get originLocationName => _data.origin.location.name ?? "";
  set originLocationName(String t) {
    _data.origin.location.name = t;
  }

  TravelTarget? get originLocationType => _data.origin.location.travelTarget;
  set originLocationType(TravelTarget? t) {
    _data.origin.location.travelTarget = t;
    notifyListeners();
  }

  String get originType => _data.origin.type ?? "";
  set originType(String t) {
    _data.origin.type = t;
    notifyListeners();
  }

  DateTime get originTimeStamp => _data.origin.timestamp;
  set originTimeStamp(DateTime t) {
    _data.origin.timestamp = t;
  }

  String get destinationLocationName => _data.destination.location.name ?? "";
  set destinationLocationName(String t) {
    _data.destination.location.name = t;
  }

  TravelTarget? get destinationLocationType =>
      _data.destination.location.travelTarget;
  set destinationLocationType(TravelTarget? t) {
    _data.destination.location.travelTarget = t;
    notifyListeners();
  }

  String get destinationType => _data.destination.type ?? "";
  set destinationType(String t) {
    _data.destination.type = t;
    notifyListeners();
  }

  DateTime get destinationTimeStamp => _data.destination.timestamp;
  set destinationTimeStamp(DateTime t) {
    _data.destination.timestamp = t;
  }

  DryLoad get dryLoadInfoType =>
      (_data.loadInfo as DryLoadInfo).dryLoadType ?? DryLoad.unkown;
  set dryLoadInfoType(DryLoad t) {
    (_data.loadInfo as DryLoadInfo).dryLoadType = t;
    notifyListeners();
  }

  LiquidLoad get liquidLoadInfoType =>
      (_data.loadInfo as LiquidLoadInfo).liquidLoadType ?? LiquidLoad.unkown;
  set liquidLoadInfoType(LiquidLoad t) {
    (_data.loadInfo as LiquidLoadInfo).liquidLoadType = t;
    notifyListeners();
  }

  ContainerLoad get containerLoadInfoType =>
      (_data.loadInfo as ContainerLoadInfo).containerLoadType ??
      ContainerLoad.unkown;
  set containerLoadInfoType(ContainerLoad t) {
    (_data.loadInfo as ContainerLoadInfo).containerLoadType = t;
    notifyListeners();
  }

  GeneralLoad get generalLoadInfoType =>
      (_data.loadInfo as GeneralLoadInfo).generalLoadType ?? GeneralLoad.unkown;
  set generalLoadInfoType(GeneralLoad t) {
    (_data.loadInfo as GeneralLoadInfo).generalLoadType = t;
    notifyListeners();
  }

  bool get invoiceInfoExists => _data.invoiceInfo.exists;

  double get invoiceInfoNetWeight =>
      (_data.invoiceInfo as InvoiceDetailedInfo).netWeight;
  set invoiceInfoNetWeight(double t) {
    (_data.invoiceInfo as InvoiceDetailedInfo).netWeight = t;
  }

  InvoiceType get invoiceInfoType =>
      (_data.invoiceInfo as InvoiceDetailedInfo).type ?? InvoiceType.unkown;
  set invoiceInfoType(InvoiceType t) {
    (_data.invoiceInfo as InvoiceDetailedInfo).type = t;
    notifyListeners();
  }

  bool get generalInfoIsCitizen => _data.generalInfo.isCitizen;
  set generalInfoIsCitizen(bool t) {
    _data.generalInfo.isCitizen = t;
  }

  PostArrival get generalInfoPostArrival => _data.generalInfo.postArrival;
  set generalInfoPostArrival(PostArrival t) {
    _data.generalInfo.postArrival = t;
  }

  TriState get generalInfoNextLoading => _data.generalInfo.nextLoading;
  set generalInfoNextLoading(TriState t) {
    _data.generalInfo.nextLoading = t;
  }

  TriState get generalInfoNextLeader => _data.generalInfo.nextLeader;
  set generalInfoNextLeader(TriState t) {
    _data.generalInfo.nextLeader = t;
  }

  bool get generalInfoCoDriverExists => _data.generalInfo.coDriver.codriver;
  set generalInfoCoDriverExists(bool t) {
    if (!t) {
      _data.generalInfo.coDriver = CoDriver(false);
    } else {
      _data.generalInfo.coDriver = CoDriverInfo();
    }
    notifyListeners();
  }

  bool get generalInfoCoDriverIsCitizen =>
      (_data.generalInfo.coDriver as CoDriverInfo).isCitizen;
  set generalInfoCoDriverIsCitizen(bool t) {
    (_data.generalInfo.coDriver as CoDriverInfo).isCitizen = t;
  }

  String get generalInfoCoDriverName =>
      (_data.generalInfo.coDriver as CoDriverInfo).name;
  set generalInfoCoDriverName(String t) {
    (_data.generalInfo.coDriver as CoDriverInfo).name = t;
  }

  String get generalInfoCoDriverPhone =>
      (_data.generalInfo.coDriver as CoDriverInfo).phoneNumber;
  set generalInfoCoDriverPhone(String t) {
    (_data.generalInfo.coDriver as CoDriverInfo).phoneNumber = t;
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
