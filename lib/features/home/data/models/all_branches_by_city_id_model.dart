
class AllBranchesByCityIdModel {
  int? pageIndex;
  int? pageSize;
  int? count;
  List<Branches>? data;

  AllBranchesByCityIdModel({this.pageIndex, this.pageSize, this.count, this.data});

  AllBranchesByCityIdModel.fromJson(Map<String, dynamic> json) {
    pageIndex = json["pageIndex"];
    pageSize = json["pageSize"];
    count = json["count"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => Branches.fromJson(e)).toList();
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

class Branches {
  int? branchId;
  int? transportBranchId;
  String? branchName;

  Branches({this.branchId, this.transportBranchId, this.branchName});

  Branches.fromJson(Map<String, dynamic> json) {
    branchId = json["branchId"];
    transportBranchId = json["transportBranchId"];
    branchName = json["branchName"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["branchId"] = branchId;
    _data["transportBranchId"] = transportBranchId;
    _data["branchName"] = branchName;
    return _data;
  }
}