
class AllCitiesModel {
  int? pageIndex;
  int? pageSize;
  int? count;
  List<Cities>? data;

  AllCitiesModel({this.pageIndex, this.pageSize, this.count, this.data});

  AllCitiesModel.fromJson(Map<String, dynamic> json) {
    pageIndex = json["pageIndex"];
    pageSize = json["pageSize"];
    count = json["count"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Cities.fromJson(e)).toList();
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

class Cities {
  int? cityId;
  String? cityNameAr;
  String? cityNameEn;
  String? areaName;
  int? areaId;

  Cities({this.cityId, this.cityNameAr, this.cityNameEn, this.areaName, this.areaId});

  Cities.fromJson(Map<String, dynamic> json) {
    cityId = json["cityId"];
    cityNameAr = json["cityNameAR"];
    cityNameEn = json["cityNameEN"];
    areaName = json["areaName"];
    areaId = json["areaId"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["cityId"] = cityId;
    _data["cityNameAR"] = cityNameAr;
    _data["cityNameEN"] = cityNameEn;
    _data["areaName"] = areaName;
    _data["areaId"] = areaId;
    return _data;
  }
}