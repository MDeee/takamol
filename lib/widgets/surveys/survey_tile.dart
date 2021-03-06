import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/models/survey.dart';
import 'package:takamol_app/providers/survey.dart';
import 'package:takamol_app/providers/surveys.dart';

class SurveyTile extends StatefulWidget {
  const SurveyTile({
    Key? key,
  }) : super(key: key);

  @override
  State<SurveyTile> createState() => _SurveyTileState();
}

class _SurveyTileState extends State<SurveyTile> {
  late final subscription;
  @override
  initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.mobile ||
            result == ConnectivityResult.wifi) setState(() {});
        // Got a new connectivity status!
      },
    );
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final survey = Provider.of<SurveyProvider>(context, listen: true);
    final SurveysProvider surveys =
        Provider.of<SurveysProvider>(context, listen: false);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: GestureDetector(
            onTap: () {
              log(json.encode(survey.data.toJson()));
            },
            child: GestureDetector(
              onTap: () {
                log(json.encode(survey.data.toJson()));
              },
              child: CircleAvatar(
                child: survey.synced
                    ? const Icon(Icons.cloud)
                    : const Icon(Icons.sd_card),
                backgroundColor: survey.synced ? Colors.green : Colors.black54,
              ),
            ),
          ),
          title: Text(survey.headerDate.toString()),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                survey.type == SurveyType.pt
                    ? "????????"
                    : survey.type == SurveyType.cars
                        ? "????????"
                        : "??????",
              ),
              Text('?????????? ???????????????? ???????????? (${survey.headerEmpNumber})')
            ],
          ),
          trailing: Consumer<SurveyProvider>(
            builder: (ctx, s, b) => !s.synced
                ? CircleAvatar(
                    child: s.syncing
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : IconButton(
                            onPressed: () {
                              s.sync(callback: surveys.save);
                            },
                            icon: const Icon(Icons.sync),
                            color: Colors.white,
                          ),
                    radius: 30,
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
