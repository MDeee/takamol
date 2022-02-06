import 'dart:convert';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:location/location.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/providers/auth.dart';
import '/providers/surveys.dart';

import '/screens/login_screen.dart';
import '/screens/splash_screen.dart';
import '/screens/survey_screen.dart';
import '/screens/surveys_screen.dart';
import '/models/survey.dart';
import '/models/survey_cars.dart';
import '/models/survey_freight.dart';
import '/models/survey_pt.dart';

Future<void> _messageHandler(RemoteMessage message) async {
  print('will sync');
  syncall();
}

Future<bool> syncall() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.reload();
  prefs.setBool('dontsync', true);
  if (!prefs.containsKey("surveys")) return false;
  var surveysList = prefs.getStringList("surveys")!;
  final _surveys = [];
  for (Map<String, dynamic> s in surveysList.map(json.decode).toList()) {
    switch (EnumToString.fromString(SurveyType.values, s['type'],
        camelCase: true)!) {
      case SurveyType.pt:
        _surveys.add(SurveyPT.fromJson(s));
        break;
      case SurveyType.cars:
        _surveys.add(SurveyCars.fromJson(s));
        break;
      case SurveyType.freight:
        _surveys.add(SurveyFreight.fromJson(s));
        break;
      default:
    }
  }
  _surveys.forEach((e) => print(e.synced));

  for (Survey i in _surveys) {
    print(i.header.date);
    await i.provider.sync(force: true);
  }
  _surveys.forEach((e) => print(e.synced));

  prefs
      .setStringList(
        "surveys",
        _surveys.map((v) => json.encode(v.toJson())).toList(),
      )
      .then((value) => print("done"))
      .onError(
    (error, stackTrace) {
      print(error.toString());
      return false;
    },
  );
  prefs.setBool('dontsync', false);
  print(_surveys.map((v) => json.encode(v.toJson())).toList());
  return true;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("something");
  Firebase.initializeApp().then((value) async {
    FirebaseMessaging.instance.subscribeToTopic('sync');
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('dontsync', false);
    FirebaseMessaging.onBackgroundMessage(_messageHandler);
  });
  print("second thing");

  Intl.defaultLocale = 'ar_EG';
  runApp(const MyApp());
}

class LifecycleEventHandler extends WidgetsBindingObserver {
  final AsyncCallback? resumeCallBack;
  final AsyncCallback? suspendingCallBack;

  LifecycleEventHandler({
    this.resumeCallBack,
    this.suspendingCallBack,
  });

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      case AppLifecycleState.resumed:
        if (resumeCallBack != null) {
          await resumeCallBack!();
        }
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        if (suspendingCallBack != null) {
          await suspendingCallBack!();
        }
        break;
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(
      LifecycleEventHandler(
        resumeCallBack: () async => setState(
          () {
            print("returned to app");
          },
        ),
      ),
    );
  }

  Future<bool> locationEnabled() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return false;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Auth>(create: (ctx) => Auth()),
        ChangeNotifierProxyProvider<Auth, SurveysProvider>(
          create: (ctx) => SurveysProvider(),
          update: (ctx, _auth, _old) =>
              SurveysProvider.auth(_auth.authHeader, _auth.uid, _old!),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'تطوير انظمة تخطيط النقل',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale("ar"),
        routes: {
          SplashScreen.routeName: (ctx) => const SplashScreen(),
          LoginScreen.routeName: (ctx) => const LoginScreen(),
          SurveyScreen.routeName: (ctx) => const SurveyScreen(),
        },
        home: FutureBuilder(
          future: locationEnabled(),
          builder: (ctx, dataSnapshot) =>
              dataSnapshot.connectionState == ConnectionState.waiting
                  ? Scaffold(
                      body: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            CircularProgressIndicator(),
                            Text("جاري التأكد من السماحيات"),
                          ],
                        ),
                      ),
                    )
                  : dataSnapshot.data as bool
                      ? Consumer<Auth>(
                          builder: (context, auth, child) => auth.isAuth
                              ? const SurveysScreen()
                              : FutureBuilder(
                                  future: auth.tryAutoLogin(),
                                  builder: (context, snapshot) =>
                                      snapshot.connectionState ==
                                              ConnectionState.waiting
                                          ? const SplashScreen()
                                          : const LoginScreen(),
                                ),
                        )
                      : Scaffold(
                          body: InkWell(
                            onTap: () => setState(() {}),
                            child: Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.pin_drop),
                                  Text("يجب السماح بخدمة تحديد الموقع"),
                                  Text(
                                    "اضغط لإعادة المحاولة",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
        ),
      ),
    );
  }
}
