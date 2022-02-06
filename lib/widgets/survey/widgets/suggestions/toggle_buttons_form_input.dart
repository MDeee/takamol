import 'package:flutter/material.dart';
import 'package:takamol_app/widgets/survey/widgets/suggestions/suggestion_tile.dart';

class ToggleButtonsFormInput extends StatelessWidget {
  final Widget label;
  final List<SuggestionTile> choices;
  final Function? onChange;
  final int? initial;
  final String? Function(int?)? validator;
  final AutovalidateMode autovalidateMode;
  final Function(int?)? onSaved;
  const ToggleButtonsFormInput(
      {Key? key,
      this.label = const SizedBox.shrink(),
      required this.choices,
      this.onChange,
      this.initial,
      this.validator,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      this.onSaved})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormField<int>(
      initialValue: initial,
      validator: validator,
      autovalidateMode: autovalidateMode,
      onSaved: onSaved,
      builder: (field) {
        List<bool> selections =
            choices.map((e) => e.suggestion.picked ?? false).toList();
        if (field.value != null) {
          selections[field.value!] = true;
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LayoutBuilder(builder: (context, constraints) {
              return ToggleButtons(
                constraints: BoxConstraints.expand(
                    width: constraints.maxWidth / choices.length - 2),
                children: choices,
                onPressed: (int index) {
                  field.didChange(index);
                  if (onChange != null) {
                    onChange!(index);
                  }
                },
                isSelected: selections,
              );
            }),
            field.hasError
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        field.errorText!,
                        style: TextStyle(color: Colors.red[700], fontSize: 13),
                      ),
                    ],
                  )
                : const SizedBox.shrink()
          ],
        );
      },
    );
  }

  static Widget createChoice({
    required Widget content,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: content,
    );
  }
}
