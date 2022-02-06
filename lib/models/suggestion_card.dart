import 'package:takamol_app/models/suggestion.dart';

class SuggestionCard {
  SuggestionCard(bool e) {
    suggestions = e
        ? [
            Suggestion("Car", "car.jpeg"),
            Suggestion("Bus", "sabtko.jpg"),
            Suggestion("Train", "train.png"),
            Suggestion("HS", "hs.jpg"),
          ]
        : [
            Suggestion("Car", "car.jpeg"),
            Suggestion("Air", "air.jpg"),
            Suggestion("Bus", "sabtko.jpg"),
            Suggestion("Train", "train.png"),
            Suggestion("HS", "hs.jpg"),
          ];
  }
  late List<Suggestion> suggestions;
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["suggestions"] = suggestions.map((e) => e.toJson()).toList();
    return json;
  }

  SuggestionCard.fromJson(Map<String, dynamic> temp) {
    suggestions = temp['suggestions']
        .map<Suggestion>((e) => Suggestion.fromJson(e))
        .toList();
  }
}
