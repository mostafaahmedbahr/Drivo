
class AllCarsModel {
  bool? isSuccess;
  int? status;
  String? messageEn;
  String? messageAr;
  Result? result;

  AllCarsModel({this.isSuccess, this.status, this.messageEn, this.messageAr, this.result});

  AllCarsModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json["isSuccess"];
    status = json["status"];
    messageEn = json["messageEn"];
    messageAr = json["messageAr"];
    result = json["result"] == null ? null : Result.fromJson(json["result"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["isSuccess"] = isSuccess;
    _data["status"] = status;
    _data["messageEn"] = messageEn;
    _data["messageAr"] = messageAr;
    if(result != null) {
      _data["result"] = result?.toJson();
    }
    return _data;
  }
}

class Result {
  int? pageIndex;
  int? pageSize;
  int? count;
  List<Data>? data;

  Result({this.pageIndex, this.pageSize, this.count, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    pageIndex = json["pageIndex"];
    pageSize = json["pageSize"];
    count = json["count"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["pageIndex"] = pageIndex;
    _data["pageSize"] = pageSize;
    _data["count"] = count;
    if(data != null) {
      _data["data"] = data?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Data {
  int? carId;
  String? plateNumber;
  String? type;
  int? year;
  String? carLevel;
  String? color;
  int? currentKilometerReading;
  String? status;
  int? branchId;
  String? branch;

  Data({this.carId, this.plateNumber, this.type, this.year, this.carLevel, this.color, this.currentKilometerReading, this.status, this.branchId, this.branch});

  Data.fromJson(Map<String, dynamic> json) {
    carId = json["carId"];
    plateNumber = json["plateNumber"];
    type = json["type"];
    year = json["year"];
    carLevel = json["carLevel"];
    color = json["color"];
    currentKilometerReading = json["currentKilometerReading"];
    status = json["status"];
    branchId = json["branchId"];
    branch = json["branch"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["carId"] = carId;
    _data["plateNumber"] = plateNumber;
    _data["type"] = type;
    _data["year"] = year;
    _data["carLevel"] = carLevel;
    _data["color"] = color;
    _data["currentKilometerReading"] = currentKilometerReading;
    _data["status"] = status;
    _data["branchId"] = branchId;
    _data["branch"] = branch;
    return _data;
  }
}