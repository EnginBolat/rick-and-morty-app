import 'package:rick_and_morty_demo/models/info_model.dart';
import 'package:rick_and_morty_demo/models/result_model.dart';

class HeroModel {
  InformationModel? info;
  late ResultModel result;

  HeroModel(info, this.result);

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      InformationModel.fromJson(json["info"]),
      ResultModel.fromJson(json["result"]),
    );
  }
}

class HeroModelResponse {
  List<HeroModel> listOfHeroModels;

  HeroModelResponse(this.listOfHeroModels);

  factory HeroModelResponse.fromJson(Map<String, dynamic> json) {
    var jsonArray = (json["results"] as List);
    List<HeroModel> listOfHeroModels = jsonArray
        .map((jsonArrayNesnesi) => HeroModel.fromJson(jsonArrayNesnesi))
        .toList();

    return HeroModelResponse(listOfHeroModels);
  }
}
