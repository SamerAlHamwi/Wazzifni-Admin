
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../core/utils/notifications/local_notification.dart';
import '../../../core/utils/storage/storage.dart';
import '../../../core/widgets/pages/background_page.dart';
import '../../login/data/repository/auth_repository.dart';
import '../data/use_case/cities_use_case.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    getCities();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // initFirebase();
    });
  }

  getCities(){
    GetCitiesUseCase(AuthRepository()).call(
      params: CitiesParams(),
    ).then((value){
      // cityListModel = value.data!;
      SharedStorage.setCities(value.data!);
      getNextPage();
    });
  }

  getNextPage(){
    if(SharedStorage.hasToken()){
      context.go('/home');
    }else{
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundPage(
        body: Center(
          child: Image.asset(
            AppAssets.logo,
            width: 150,
            height: 150,
          ),
        )
    );
  }

  initFirebase() async {
    final notificationSettings = await FirebaseMessaging.instance.requestPermission(provisional: true);
    LocalNotificationService.initialize(context);
    FirebaseMessaging.instance.getToken().then((token) {
      if(token != null){
        print(token);
        if(SharedStorage.hasToken()){
          // SetFcmUseCase(AuthRepository()).call(params: SetFcmParams(input: token),).then((value){
          //   print(value);
          // });
        }
      }
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message data: ${message.data}');
      if (message.notification != null) {
        LocalNotificationService.display(message);
        print('Message also contained a notification: ${message.notification}');
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message clicked! ${message.messageId}');
    });
  }
}
