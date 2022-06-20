class ResultModel {
  var result;

  ResultModel(this.result);

  factory ResultModel.fromJson(Map<dynamic, dynamic> json) {
    return ResultModel(json["result"] as String);
  }
}
