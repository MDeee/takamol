class Suggestion {
  Suggestion(this.name, this.image);
  String? name;
  double? inVehicleTime;
  double? totalCost;
  double? egressTime;
  bool? transferTime;
  int? waitingTime;
  bool? picked;
  String? image;
  Map<String, dynamic> toJson() {
    Map<String, dynamic> temp = <String, dynamic>{};
    temp["name"] = name;
    temp["inVehicleTime"] = inVehicleTime;
    temp["totalCost"] = totalCost;
    temp["egressTime"] = egressTime;
    temp["transferTime"] = transferTime;
    temp["waitingTime"] = waitingTime;
    temp["picked"] = picked;
    temp["image"] = image;
    return temp;
  }

  Suggestion.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    inVehicleTime = json["inVehicleTime"];
    totalCost = json["totalCost"];
    egressTime = json["egressTime"];
    transferTime = json["transferTime"];
    waitingTime = json["waitingTime"];
    picked = json["picked"];
    image = json["image"];
  }
}
