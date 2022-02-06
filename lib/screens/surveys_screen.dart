import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takamol_app/models/survey.dart';

import '/providers/auth.dart';
import '/providers/surveys.dart';
import '/screens/survey_screen.dart';
import '/widgets/common/connection_error.dart';
import '/widgets/surveys/survey_list.dart';

class SurveysScreen extends StatefulWidget {
  const SurveysScreen({Key? key}) : super(key: key);
  // static const routeName = "surveys-screen";
  static const routeName = "/";

  @override
  State<SurveysScreen> createState() => _SurveysScreenState();
}

class _SurveysScreenState extends State<SurveysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تطوير انظمة تخطيط النقل"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            SurveyScreen.routeName,
                            arguments: "Personal",
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.person),
                                Text("PT"),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            SurveyScreen.routeName,
                            arguments: "Rental",
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.local_taxi),
                                Text("CAR"),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            SurveyScreen.routeName,
                            arguments: "Freight",
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.car_rental),
                                Text("Freight"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
          const SizedBox(width: 20),
          IconButton(
            onPressed:
                Provider.of<SurveysProvider>(context, listen: false).syncAll,
            icon: const Icon(Icons.sync),
          ),
          const SizedBox(width: 30),
          IconButton(
            onPressed: Provider.of<Auth>(context).logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: Provider.of<SurveysProvider>(context, listen: false).fetch(),
          builder: (fctx, dataSnapshot) =>
              dataSnapshot.connectionState == ConnectionState.waiting
                  ? const Padding(
                      padding: EdgeInsets.all(40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : dataSnapshot.hasError
                      ? Padding(
                          padding: const EdgeInsets.all(50),
                          child: ConnectionError(() => setState(() => {})),
                        )
                      : dataSnapshot.hasData
                          ? SurveyList()
                          : const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Center(
                                child: Text(
                                  'لا يوجد اي استبيانات',
                                ),
                              ),
                            ),
        ),
      ),
    );
  }
}
