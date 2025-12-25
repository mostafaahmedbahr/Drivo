
class CarDetailsModel {
  int? carId;
  String? brand;
  String? model;
  int? year;
  String? carLevel;
  String? color;
  String? plateNumber;
  int? currentKilometerReading;
  int? allowedKilometers;
  int? extraKilometerPrice;
  dynamic lateHourFee;
  int? dailyRenterPrice;
  int? weeklyRenterPrice;
  int? monthlyRenterPrice;
  dynamic imageUrl;
  dynamic rentHourCost;
  int? fullFuelCost;
  int? oilChangeKmDistance;
  String? oilChangeDate;
  int? enduranceAmount;
  int? allowedKmPerDay;
  int? allowedLateHours;
  int? allowedKmPerHour;
  int? plateType;
  int? kilometersAtExit;
  dynamic extraKmCost;
  dynamic offer;
  bool? hasGps;
  String? letter1;
  String? letter2;
  String? letter3;
  int? number1;
  int? number2;
  int? number3;
  int? number4;
  Status? status;
  dynamic licenseImage;

  CarDetailsModel({this.carId, this.brand, this.model, this.year, this.carLevel, this.color, this.plateNumber, this.currentKilometerReading, this.allowedKilometers, this.extraKilometerPrice, this.lateHourFee, this.dailyRenterPrice, this.weeklyRenterPrice, this.monthlyRenterPrice, this.imageUrl, this.rentHourCost, this.fullFuelCost, this.oilChangeKmDistance, this.oilChangeDate, this.enduranceAmount, this.allowedKmPerDay, this.allowedLateHours, this.allowedKmPerHour, this.plateType, this.kilometersAtExit, this.extraKmCost, this.offer, this.hasGps, this.letter1, this.letter2, this.letter3, this.number1, this.number2, this.number3, this.number4, this.status, this.licenseImage});

  CarDetailsModel.fromJson(Map<String, dynamic> json) {
    carId = json["carId"];
    brand = json["brand"];
    model = json["model"];
    year = json["year"];
    carLevel = json["carLevel"];
    color = json["color"];
    plateNumber = json["plateNumber"];
    currentKilometerReading = json["currentKilometerReading"];
    allowedKilometers = json["allowedKilometers"];
    extraKilometerPrice = json["extraKilometerPrice"];
    lateHourFee = json["lateHourFee"];
    dailyRenterPrice = json["dailyRenterPrice"];
    weeklyRenterPrice = json["weeklyRenterPrice"];
    monthlyRenterPrice = json["monthlyRenterPrice"];
    imageUrl = json["imageUrl"];
    rentHourCost = json["rentHourCost"];
    fullFuelCost = json["fullFuelCost"];
    oilChangeKmDistance = json["oilChangeKmDistance"];
    oilChangeDate = json["oilChangeDate"];
    enduranceAmount = json["enduranceAmount"];
    allowedKmPerDay = json["allowedKmPerDay"];
    allowedLateHours = json["allowedLateHours"];
    allowedKmPerHour = json["allowedKmPerHour"];
    plateType = json["plateType"];
    kilometersAtExit = json["kilometersAtExit"];
    extraKmCost = json["extraKmCost"];
    offer = json["offer"];
    hasGps = json["hasGPS"];
    letter1 = json["letter1"];
    letter2 = json["letter2"];
    letter3 = json["letter3"];
    number1 = json["number1"];
    number2 = json["number2"];
    number3 = json["number3"];
    number4 = json["number4"];
    status = json["status"] == null ? null : Status.fromJson(json["status"]);
    licenseImage = json["licenseImage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["carId"] = carId;
    _data["brand"] = brand;
    _data["model"] = model;
    _data["year"] = year;
    _data["carLevel"] = carLevel;
    _data["color"] = color;
    _data["plateNumber"] = plateNumber;
    _data["currentKilometerReading"] = currentKilometerReading;
    _data["allowedKilometers"] = allowedKilometers;
    _data["extraKilometerPrice"] = extraKilometerPrice;
    _data["lateHourFee"] = lateHourFee;
    _data["dailyRenterPrice"] = dailyRenterPrice;
    _data["weeklyRenterPrice"] = weeklyRenterPrice;
    _data["monthlyRenterPrice"] = monthlyRenterPrice;
    _data["imageUrl"] = imageUrl;
    _data["rentHourCost"] = rentHourCost;
    _data["fullFuelCost"] = fullFuelCost;
    _data["oilChangeKmDistance"] = oilChangeKmDistance;
    _data["oilChangeDate"] = oilChangeDate;
    _data["enduranceAmount"] = enduranceAmount;
    _data["allowedKmPerDay"] = allowedKmPerDay;
    _data["allowedLateHours"] = allowedLateHours;
    _data["allowedKmPerHour"] = allowedKmPerHour;
    _data["plateType"] = plateType;
    _data["kilometersAtExit"] = kilometersAtExit;
    _data["extraKmCost"] = extraKmCost;
    _data["offer"] = offer;
    _data["hasGPS"] = hasGps;
    _data["letter1"] = letter1;
    _data["letter2"] = letter2;
    _data["letter3"] = letter3;
    _data["number1"] = number1;
    _data["number2"] = number2;
    _data["number3"] = number3;
    _data["number4"] = number4;
    if(status != null) {
      _data["status"] = status?.toJson();
    }
    _data["licenseImage"] = licenseImage;
    return _data;
  }
}

class Status {
  String? airConditionerStatus;
  String? seatCondition;
  String? screenCondition;
  String? tireCondition;
  String? odometerCondition;
  String? keyCondition;
  String? hasFireExtinguisher;
  String? hasFirstAidKit;
  String? hasReflectiveTriangle;
  String? hasTireChangingKit;
  String? fuelLevel;

  Status({this.airConditionerStatus, this.seatCondition, this.screenCondition, this.tireCondition, this.odometerCondition, this.keyCondition, this.hasFireExtinguisher, this.hasFirstAidKit, this.hasReflectiveTriangle, this.hasTireChangingKit, this.fuelLevel});

  Status.fromJson(Map<String, dynamic> json) {
    airConditionerStatus = json["airConditionerStatus"];
    seatCondition = json["seatCondition"];
    screenCondition = json["screenCondition"];
    tireCondition = json["tireCondition"];
    odometerCondition = json["odometerCondition"];
    keyCondition = json["keyCondition"];
    hasFireExtinguisher = json["hasFireExtinguisher"];
    hasFirstAidKit = json["hasFirstAidKit"];
    hasReflectiveTriangle = json["hasReflectiveTriangle"];
    hasTireChangingKit = json["hasTireChangingKit"];
    fuelLevel = json["fuelLevel"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["airConditionerStatus"] = airConditionerStatus;
    _data["seatCondition"] = seatCondition;
    _data["screenCondition"] = screenCondition;
    _data["tireCondition"] = tireCondition;
    _data["odometerCondition"] = odometerCondition;
    _data["keyCondition"] = keyCondition;
    _data["hasFireExtinguisher"] = hasFireExtinguisher;
    _data["hasFirstAidKit"] = hasFirstAidKit;
    _data["hasReflectiveTriangle"] = hasReflectiveTriangle;
    _data["hasTireChangingKit"] = hasTireChangingKit;
    _data["fuelLevel"] = fuelLevel;
    return _data;
  }
}