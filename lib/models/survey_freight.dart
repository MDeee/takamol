import 'package:enum_to_string/enum_to_string.dart';

import 'survey.dart';

import '/providers/survey_frieght.dart';

enum CarType {
  small,
  van,
  truck,
  trailerTruck,
  trailer,
}
enum PropertyType {
  mine,
  shippingCompanyProperty,
  workProperty,
  someoneElseProperty
}

enum LoadType {
  dry,
  liquid,
  container,
  generalLoadOnClosedTruck,
  generalLoadOnOpenTruck,
  cars,
  animals,
  other,
  undefinedLoad, // لا يعرف محمله او غير محمله
  unknownLoad, // محمله ولا يعرف ما بداخلها
  undefined
}

enum DryLoad {
  cement,
  steel,
  wheat,
  various,
  metals,
  agricaltural,
  remnants,
  other,
  unkown,
}
enum LiquidLoad {
  fuelOrOil,
  asphalt,
  water,
  agricaltural,
  other,
  unkown,
}
enum ContainerLoad {
  industrial,
  machines,
  tools,
  consumerProducts,
  petroChemical,
  remnants,
  empty,
  other,
  unkown,
}
enum GeneralLoad {
  industrial,
  machines,
  tools,
  building,
  consumerProducts,
  other,
  unkown,
}
enum InvoiceType {
  looseLiquid,
  looseDry,
  cooled,
  agricaltural,
  industrial,
  mining,
  equipment,
  machines,
  cars,
  dangrous,
  alive,
  other,
  unkown,
}

class Header extends HeaderBase {
  Header() : super();
  late CarType carType;
  late PropertyType propertyType;
  late int axisCount;
  bool isLoaded = false;
  late bool hasRefrigerator;
  late String from;
  late String to;
}

class LoadInfo {
  final LoadType type;
  String? other;
  LoadInfo(this.type);
}

class DryLoadInfo extends LoadInfo {
  DryLoadInfo() : super(LoadType.dry);
  DryLoad? dryLoadType;
}

class LiquidLoadInfo extends LoadInfo {
  LiquidLoadInfo() : super(LoadType.liquid);
  LiquidLoad? liquidLoadType;
}

class ContainerLoadInfo extends LoadInfo {
  ContainerLoadInfo() : super(LoadType.container);
  ContainerLoad? containerLoadType;
}

class GeneralLoadInfo extends LoadInfo {
  GeneralLoadInfo(LoadType type) : super(type) {
    if (type != LoadType.generalLoadOnClosedTruck &&
        type != LoadType.generalLoadOnOpenTruck) {
      throw Exception("BadType Exception");
    }
  }
  GeneralLoad? generalLoadType;
}

class InvoiceInfo {
  final bool exists;
  String? other;
  InvoiceInfo(this.exists);
}

class InvoiceDetailedInfo extends InvoiceInfo {
  InvoiceDetailedInfo() : super(true);
  InvoiceType? type;
  late double netWeight;
}

enum IndustrialPoseType {
  constructionSite,
  industrialBuilding,
  inventory,
  port,
  loadingPort,
  companyGarage,
  house,
  other,
}

class IndustrialPose {
  LocationInfo location = LocationInfo();
  String? type;
  late DateTime timestamp;
}

enum PostArrival {
  returnToOrigin,
  stay,
  otherPlace,
  unkown,
}
enum TriState {
  yes,
  no,
  unkown,
}

class CoDriver {
  final bool codriver;
  CoDriver(this.codriver);
}

class CoDriverInfo extends CoDriver {
  CoDriverInfo() : super(true);
  late String phoneNumber;
  late String name;
  late bool isCitizen;
}

class GeneralInfo {
  PostArrival postArrival = PostArrival.unkown;
  late TriState nextLoading;
  late TriState nextLeader;
  late bool isCitizen;
  CoDriver coDriver = CoDriver(false);
}

class SurveyFreight extends Survey {
  LoadInfo loadInfo = LoadInfo(LoadType.undefined);
  IndustrialPose origin = IndustrialPose();
  IndustrialPose destination = IndustrialPose();
  InvoiceInfo invoiceInfo = InvoiceInfo(false);
  GeneralInfo generalInfo = GeneralInfo();

  SurveyFreight() : super(SurveyType.freight) {
    super.provider = SurveyFreightProvider(this);
    super.header = Header();
  }

  SurveyFreight.fromJson(Map<String, dynamic> json)
      : super(EnumToString.fromString(SurveyType.values, json['type'],
            camelCase: true)!) {
    header = Header();
    provider = SurveyFreightProvider(this);

    (header as Header).carType = EnumToString.fromString(
        CarType.values, json['headerCarType'],
        camelCase: true)!;
    (header as Header).propertyType = EnumToString.fromString(
        PropertyType.values, json['headerPropertyType'],
        camelCase: true)!;
    (header as Header).from = json['headerFrom'];
    (header as Header).to = json['headerTo'];
    (header as Header).axisCount = json['headerAxisCount'];
    (header as Header).hasRefrigerator = json['headerRefrigerator'];
    (header as Header).isLoaded = json['headerIsLoaded'];
    id = json['id'];
    synced = json['synced'];
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
    origin = IndustrialPose();
    origin.location.name = json['originLocationName'];
    origin.location.travelTarget = EnumToString.fromString(
        TravelTarget.values, json['originLocationType'],
        camelCase: true)!;
    origin.type = json['originType'];
    origin.timestamp = DateTime.parse(json['originTimeStamp']);

    destination = IndustrialPose();
    destination.location.name = json['destinationLocationName'];
    destination.location.travelTarget = EnumToString.fromString(
        TravelTarget.values, json['destinationLocationType'],
        camelCase: true)!;
    destination.type = json['destinationType'];
    destination.timestamp = DateTime.parse(json['destinationTimeStamp']);
    var tempType = EnumToString.fromString(
        LoadType.values, json['loadInfoType1'],
        camelCase: true)!;

    switch (tempType) {
      case LoadType.dry:
        loadInfo = DryLoadInfo();
        (loadInfo as DryLoadInfo).dryLoadType = EnumToString.fromString(
            DryLoad.values, json['dryLoadInfoType'],
            camelCase: true)!;
        break;
      case LoadType.liquid:
        loadInfo = LiquidLoadInfo();
        (loadInfo as LiquidLoadInfo).liquidLoadType = EnumToString.fromString(
            LiquidLoad.values, json['liquidLoadInfoType'],
            camelCase: true)!;
        break;
      case LoadType.container:
        loadInfo = ContainerLoadInfo();
        (loadInfo as ContainerLoadInfo).containerLoadType =
            EnumToString.fromString(
                ContainerLoad.values, json['containerLoadInfoType'],
                camelCase: true)!;
        break;
      case LoadType.generalLoadOnClosedTruck:
      case LoadType.generalLoadOnOpenTruck:
        loadInfo = GeneralLoadInfo(tempType);
        (loadInfo as GeneralLoadInfo).generalLoadType = EnumToString.fromString(
            GeneralLoad.values, json['generalLoadInfoType'],
            camelCase: true)!;
        break;
      default:
        loadInfo = LoadInfo(tempType);
    }
    bool tempInvoiceExists = json['invoiceInfoExists'];
    if (tempInvoiceExists) {
      invoiceInfo = InvoiceDetailedInfo();
      (invoiceInfo as InvoiceDetailedInfo).netWeight =
          json['invoiceInfoNetWeight'];
      (invoiceInfo as InvoiceDetailedInfo).type = EnumToString.fromString(
          InvoiceType.values, json['invoiceInfoType1'],
          camelCase: true)!;
    } else {
      invoiceInfo = InvoiceInfo(tempInvoiceExists);
    }

    generalInfo = GeneralInfo();
    generalInfo.isCitizen = json['generalInfoIsCitizen'];
    generalInfo.postArrival = EnumToString.fromString(
        PostArrival.values, json['generalInfoPostArrival'],
        camelCase: true)!;
    if (generalInfo.postArrival != PostArrival.unkown) {
      generalInfo.nextLoading = EnumToString.fromString(
          TriState.values, json['generalInfoNextLoading'],
          camelCase: true)!;
      generalInfo.nextLeader = EnumToString.fromString(
          TriState.values, json['generalInfoNextLeader'],
          camelCase: true)!;
    }
    bool codriver = json['generalInfoCoDriverExists'];
    if (codriver) {
      generalInfo.coDriver = CoDriverInfo();
      (generalInfo.coDriver as CoDriverInfo).isCitizen =
          json['generalInfoCoDriverIsCitizen'];
      (generalInfo.coDriver as CoDriverInfo).name =
          json['generalInfoCoDriverName'];
      (generalInfo.coDriver as CoDriverInfo).phoneNumber =
          json['generalInfoCoDriverPhone'];
    } else {
      generalInfo.coDriver = CoDriver(codriver);
    }
    loadInfo.other = json['loadInfoType2'];
    invoiceInfo.other = json['invoiceInfoOther'];
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['headerCarType'] = EnumToString.convertToString(
        (header as Header).carType,
        camelCase: true);

    data['headerPropertyType'] = EnumToString.convertToString(
        (header as Header).propertyType,
        camelCase: true);

    data['headerFrom'] = (header as Header).from;
    data['headerTo'] = (header as Header).to;
    data['headerRefrigerator'] = (header as Header).hasRefrigerator;
    data['headerIsLoaded'] = (header as Header).isLoaded;
    data['headerAxisCount'] = (header as Header).axisCount;
    data['id'] = id;
    data['type'] = EnumToString.convertToString(type, camelCase: true);
    data['synced'] = synced;
    data['headerLat'] = header.locationLat;
    data['headerLong'] = header.locationLong;
    data['headerDate'] = header.date.toString();
    data['manualLocation'] =
        EnumToString.convertToString(header.manualLocation, camelCase: true);

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
    data['originLocationName'] = origin.location.name;
    print("check origin location type ...");
    print(origin.location.travelTarget);
    data['originLocationType'] = origin.location.travelTarget != null
        ? EnumToString.convertToString(origin.location.travelTarget,
            camelCase: true)
        : "";
    data['originType'] = origin.type;
    data['originTimeStamp'] = origin.timestamp.toString();
    data['destinationLocationName'] = destination.location.name;
    data['destinationLocationType'] = destination.location.travelTarget != null
        ? EnumToString.convertToString(destination.location.travelTarget,
            camelCase: true)
        : "";
    data['destinationType'] = destination.type;
    data['destinationTimeStamp'] = destination.timestamp.toString();
    data['loadInfoType1'] =
        EnumToString.convertToString(loadInfo.type, camelCase: true);
    data['loadInfoType2'] = loadInfo.other ?? "";
    data['loadInfoType'] =
        EnumToString.convertToString(loadInfo.type, camelCase: true) +
            (loadInfo.other != null ? " " + loadInfo.other! : "");
    switch (loadInfo.type) {
      case LoadType.dry:
        data['dryLoadInfoType'] = EnumToString.convertToString(
            (loadInfo as DryLoadInfo).dryLoadType,
            camelCase: true);
        break;
      case LoadType.liquid:
        data['liquidLoadInfoType'] = EnumToString.convertToString(
            (loadInfo as LiquidLoadInfo).liquidLoadType,
            camelCase: true);
        break;
      case LoadType.container:
        data['containerLoadInfoType'] = EnumToString.convertToString(
            (loadInfo as ContainerLoadInfo).containerLoadType,
            camelCase: true);
        break;
      case LoadType.generalLoadOnOpenTruck:
      case LoadType.generalLoadOnClosedTruck:
        data['generalLoadInfoType'] = EnumToString.convertToString(
            (loadInfo as GeneralLoadInfo).generalLoadType,
            camelCase: true);
        break;

      default:
    }

    data['invoiceInfoExists'] = invoiceInfo.exists;
    data['invoiceInfoOther'] = invoiceInfo.other ?? "";
    if (invoiceInfo.exists) {
      data['invoiceInfoNetWeight'] =
          (invoiceInfo as InvoiceDetailedInfo).netWeight;
      data['invoiceInfoType'] = EnumToString.convertToString(
            (invoiceInfo as InvoiceDetailedInfo).type,
            camelCase: true,
          ) +
          (invoiceInfo.other != null ? " - " + invoiceInfo.other! : "");
      data['invoiceInfoType1'] = EnumToString.convertToString(
        (invoiceInfo as InvoiceDetailedInfo).type,
        camelCase: true,
      );
    }
    data['generalInfoIsCitizen'] = generalInfo.isCitizen;
    data['generalInfoPostArrival'] =
        EnumToString.convertToString(generalInfo.postArrival, camelCase: true);
    if (generalInfo.postArrival != PostArrival.unkown) {
      data['generalInfoNextLoading'] = EnumToString.convertToString(
          generalInfo.nextLoading,
          camelCase: true);
      data['generalInfoNextLeader'] =
          EnumToString.convertToString(generalInfo.nextLeader, camelCase: true);
    }
    data['generalInfoCoDriverExists'] = generalInfo.coDriver.codriver;
    if (generalInfo.coDriver.codriver) {
      data['generalInfoCoDriverIsCitizen'] =
          (generalInfo.coDriver as CoDriverInfo).isCitizen;
      data['generalInfoCoDriverName'] =
          (generalInfo.coDriver as CoDriverInfo).name;
      data['generalInfoCoDriverPhone'] =
          (generalInfo.coDriver as CoDriverInfo).phoneNumber;
    }

    return data;
  }
}
