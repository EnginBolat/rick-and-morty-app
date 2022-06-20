class InformationModel {
  String? next;

  InformationModel(this.next);

  factory InformationModel.fromJson(Map<String, dynamic> json) {
    return InformationModel(json["next"] as String);
  }
}
