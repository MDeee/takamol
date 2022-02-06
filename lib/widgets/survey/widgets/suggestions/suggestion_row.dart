import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:takamol_app/models/suggestion_card.dart';

import 'suggestion_tile.dart';
import 'toggle_buttons_form_input.dart';

class SuggestionRow extends StatelessWidget {
  final SuggestionCard card;
  final Function changed;
  const SuggestionRow({
    required this.card,
    required this.changed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SuggestionTile> choices =
        card.suggestions.map((e) => SuggestionTile(suggestion: e)).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ToggleButtonsFormInput(
            key: ValueKey(card),
            choices: choices,
            onChange: (e) {
              for (var i = 0; i < card.suggestions.length; i++) {
                card.suggestions[i].picked = i == e;
              }
              changed();
              log(card.toJson().toString());
            },
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "مدة السفر",
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
            Text(
              "وقت الانتظار و الاجراءات",
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
            Text(
              "وقت الوصول او الذهاب من المحطة",
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
            // choices[0].suggestion.transferTime == null
            //     ?
            Text(
              "التنقلات",
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
            // : Column(
            //     children: [
            //       Text(
            //         "التنقلات",
            //         style: TextStyle(fontSize: 15),
            //         textDirection: TextDirection.rtl,
            //       ),
            //     ],
            //   ),
            Text(
              "التكلفه",
              style: TextStyle(fontSize: 13),
              textDirection: TextDirection.rtl,
            ),
            // SizedBox(height: 2),
          ],
        ),
      ],
    );
  }
}
