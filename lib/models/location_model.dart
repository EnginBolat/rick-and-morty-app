class Location {
  var name;
  var url;

  Location(this.name, this.url);

  factory Location.fromJson(Map<dynamic,dynamic>json){
    return Location(json["name"] as String,json["url"] as String);
  }
}
