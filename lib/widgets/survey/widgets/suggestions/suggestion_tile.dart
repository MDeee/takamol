import 'package:flutter/material.dart';
import 'package:takamol_app/models/suggestion.dart';

import 'toggle_buttons_form_input.dart';

class SuggestionTile extends StatelessWidget {
  final Suggestion suggestion;
  const SuggestionTile({Key? key, required this.suggestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ToggleButtonsFormInput.createChoice(
      content: Column(
        children: [
          Text(suggestion.name ?? "default"),
          Expanded(
            // child:
            // AspectRatio(
            //   aspectRatio: 1.8,
            child: Image.asset(
              suggestion.image ?? "notfound.jpg",
              fit: BoxFit.cover,
            ),
            // ),
          ),
          Text("${suggestion.inVehicleTime!.toStringAsFixed(2)}"),
          Text("${suggestion.waitingTime ?? '-'}"),
          Text("${suggestion.egressTime!.toStringAsFixed(2)}"),
          suggestion.transferTime == null
              ? Text(" ")
              : Column(
                  children: [
                    Text("${suggestion.transferTime! ? 'Yes' : 'No'}"),
                  ],
                ),
          Text(" ${suggestion.totalCost!.toStringAsFixed(2)}"),
        ],
      ),
    );
  }
}
