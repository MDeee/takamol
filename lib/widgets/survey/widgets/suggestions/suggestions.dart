import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/helpers/cards_helper.dart';
import 'package:takamol_app/helpers/distance_helper.dart';
import 'package:takamol_app/models/suggestion_card.dart' as models;
import 'package:takamol_app/providers/survey.dart';
import 'package:takamol_app/providers/survey_pt.dart';
import '/models/survey_pt.dart';

import 'suggestion_row.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  int index = 0;
  bool show = false;
  final int i = Random().nextInt(CardsHelper.sbCards.length);
  @override
  Widget build(BuildContext context) {
    SurveyPTProvider survey =
        Provider.of<SurveyProvider>(context, listen: false) as SurveyPTProvider;
    int distance = 0;
    if (show) {
      distance = Distance.getDistance(survey.journeyStartLocationName!,
              survey.journeyEndLocationName!) ??
          0;
    }
    bool isSb = distance <= 400;
    print(distance);

    List<Map<String, CardChoiceDetails>> cards =
        isSb ? CardsHelper.sbCards[i] : CardsHelper.lbCards[i];
    models.SuggestionCard c = models.SuggestionCard(isSb);
    if (isSb) {
      c.suggestions[0].inVehicleTime = distance * 0.01;
      c.suggestions[1].inVehicleTime = distance * 0.0136;
      c.suggestions[2].inVehicleTime = distance * 0.0074;
      c.suggestions[3].inVehicleTime = distance * 0.0038;
      //
      c.suggestions[0].totalCost = distance * 0.1817;
      c.suggestions[1].totalCost = distance * 0.2713;
      c.suggestions[2].totalCost = distance * 0.2428;
      c.suggestions[3].totalCost = distance * 0.5691;
      //
      c.suggestions[0].egressTime = 30;
      c.suggestions[1].egressTime = 50;
      c.suggestions[2].egressTime = 50;
      c.suggestions[3].egressTime = 50;
    } else {
      c.suggestions[0].inVehicleTime = distance * 0.0110;
      c.suggestions[1].inVehicleTime = ((distance * 0.0013) + 0.6113);
      c.suggestions[2].inVehicleTime = distance * 0.0138;
      c.suggestions[3].inVehicleTime = distance * 0.0083;
      c.suggestions[4].inVehicleTime = distance * 0.0038;
      //
      c.suggestions[0].totalCost = distance * 0.1817;
      c.suggestions[1].totalCost = distance * 0.0949;
      c.suggestions[2].totalCost = distance * 0.2110;
      c.suggestions[3].totalCost = distance * 0.2335;
      c.suggestions[4].totalCost = distance * 0.3482;
      //
      c.suggestions[0].egressTime = 30;
      c.suggestions[1].egressTime = 60;
      c.suggestions[2].egressTime = 50;
      c.suggestions[3].egressTime = 50;
      c.suggestions[4].egressTime = 50;
    }
    List<models.SuggestionCard> suggestions = cards.map((e) {
      models.SuggestionCard t = models.SuggestionCard(isSb);
      if (isSb) {
        t.suggestions[0].inVehicleTime =
            c.suggestions[0].inVehicleTime! * (1 + e['Car']!.inVehicleTime);
        t.suggestions[1].inVehicleTime =
            c.suggestions[1].inVehicleTime! * (1 + e['Bus']!.inVehicleTime);
        t.suggestions[2].inVehicleTime =
            c.suggestions[2].inVehicleTime! * (1 + e['Train']!.inVehicleTime);
        t.suggestions[3].inVehicleTime =
            c.suggestions[3].inVehicleTime! * (1 + e['HS']!.inVehicleTime);
        //
        t.suggestions[0].totalCost =
            c.suggestions[0].totalCost! * (1 + e['Car']!.totalCost);
        t.suggestions[1].totalCost =
            c.suggestions[1].totalCost! * (1 + e['Bus']!.totalCost);
        t.suggestions[2].totalCost =
            c.suggestions[2].totalCost! * (1 + e['Train']!.totalCost);
        t.suggestions[3].totalCost =
            c.suggestions[3].totalCost! * (1 + e['HS']!.totalCost);
        //
        t.suggestions[0].egressTime =
            c.suggestions[0].egressTime! * (1 + e['Car']!.egressTime);
        t.suggestions[1].egressTime =
            c.suggestions[1].egressTime! * (1 + e['Bus']!.egressTime);
        t.suggestions[2].egressTime =
            c.suggestions[2].egressTime! * (1 + e['Train']!.egressTime);
        t.suggestions[3].egressTime =
            c.suggestions[3].egressTime! * (1 + e['HS']!.egressTime);

        //
        t.suggestions[0].waitingTime = e['Car']!.waitingTime;
        t.suggestions[1].waitingTime = e['Bus']!.waitingTime;
        t.suggestions[2].waitingTime = e['Train']!.waitingTime;
        t.suggestions[3].waitingTime = e['HS']!.waitingTime;
      } else {
        t.suggestions[0].inVehicleTime =
            c.suggestions[0].inVehicleTime! * (1 + e['Car']!.inVehicleTime);
        t.suggestions[1].inVehicleTime =
            c.suggestions[1].inVehicleTime! * (1 + e['Air']!.inVehicleTime);
        t.suggestions[2].inVehicleTime =
            c.suggestions[2].inVehicleTime! * (1 + e['Bus']!.inVehicleTime);
        t.suggestions[3].inVehicleTime =
            c.suggestions[3].inVehicleTime! * (1 + e['Train']!.inVehicleTime);
        t.suggestions[4].inVehicleTime =
            c.suggestions[4].inVehicleTime! * (1 + e['HS']!.inVehicleTime);
        //
        t.suggestions[0].totalCost =
            c.suggestions[0].totalCost! * (1 + e['Car']!.totalCost);
        t.suggestions[1].totalCost =
            c.suggestions[1].totalCost! * (1 + e['Air']!.totalCost);
        t.suggestions[2].totalCost =
            c.suggestions[2].totalCost! * (1 + e['Bus']!.totalCost);
        t.suggestions[3].totalCost =
            c.suggestions[3].totalCost! * (1 + e['Train']!.totalCost);
        t.suggestions[4].totalCost =
            c.suggestions[4].totalCost! * (1 + e['HS']!.totalCost);
        //
        t.suggestions[0].egressTime =
            c.suggestions[0].egressTime! * (1 + e['Car']!.egressTime);
        t.suggestions[1].egressTime =
            c.suggestions[1].egressTime! * (1 + e['Air']!.egressTime);
        t.suggestions[2].egressTime =
            c.suggestions[2].egressTime! * (1 + e['Bus']!.egressTime);
        t.suggestions[3].egressTime =
            c.suggestions[3].egressTime! * (1 + e['Train']!.egressTime);
        t.suggestions[4].egressTime =
            c.suggestions[4].egressTime! * (1 + e['HS']!.egressTime);
        //
        t.suggestions[0].waitingTime = e['Car']!.waitingTime;
        t.suggestions[1].waitingTime = e['Air']!.waitingTime;
        t.suggestions[2].waitingTime = e['Bus']!.waitingTime;
        t.suggestions[3].waitingTime = e['Train']!.waitingTime;
        t.suggestions[4].waitingTime = e['HS']!.waitingTime;
        //
        t.suggestions[0].transferTime = e['Car']!.transferTime;
        t.suggestions[1].transferTime = e['Air']!.transferTime;
        t.suggestions[2].transferTime = e['Bus']!.transferTime;
        t.suggestions[3].transferTime = e['Train']!.transferTime;
        t.suggestions[4].transferTime = e['HS']!.transferTime;
      }
      return t;
    }).toList();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                Text("استكمال الاقتراحات"),
                Switch(
                  value: show,
                  onChanged: (v) => setState(() {
                    show = v;
                  }),
                )
              ],
            ),
            suggestions.length > 0 && show
                ? FormField(
                    initialValue: suggestions,
                    builder: (field) {
                      return Column(
                        children: [
                          (field.value as List).length > 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: index != 0
                                          ? () => setState(() {
                                                if (index > 0) index--;
                                              })
                                          : null,
                                      icon: Icon(Icons.arrow_back),
                                    ),
                                    Text(
                                        "${index + 1} / ${(field.value as List).length}"),
                                    IconButton(
                                      onPressed: index !=
                                              (field.value as List).length - 1
                                          ? () => setState(() {
                                                if (index <
                                                    (field.value as List)
                                                            .length -
                                                        1) index++;
                                              })
                                          : null,
                                      icon: Icon(Icons.arrow_forward),
                                    )
                                  ],
                                )
                              : SizedBox.shrink(),
                          SuggestionRow(
                            card: (field.value as List)[index],
                            changed: () {
                              setState(() {
                                if (index < (field.value as List).length - 1)
                                  index++;
                              });
                            },
                          ),
                          field.hasError
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      field.errorText!,
                                      style: TextStyle(
                                          color: Colors.red[700], fontSize: 13),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink()
                        ],
                      );
                    },
                    validator: (List<models.SuggestionCard>? e) {
                      if (e!
                          .map(
                            (e) => e.suggestions.map((e) => e.picked).any(
                                (element) =>
                                    element != null && element != false),
                          )
                          .any((element) => element != true))
                        return "يجب استكمال الاستبيان";
                    },
                    onSaved: (List<models.SuggestionCard>? e) {
                      survey.suggestions = e!;
                      (survey.data as SurveyPT).suggestionName =
                          "${isSb ? 'sb' : 'lb'}-${(i ~/ 2) + 1}.${i.remainder(2) + 1}";
                    },
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
