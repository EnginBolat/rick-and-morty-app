class Origin {
  var name;
  var url;

  Origin(this.name, this.url);

  factory Origin.fromJson(Map<dynamic, dynamic> json) {
    return Origin(json["name"] as String, json["url"] as String);
  }
}
