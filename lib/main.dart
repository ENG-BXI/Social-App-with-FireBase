import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Modules/AppScreen.dart';
import 'package:social_app/cubit/blocObserver.dart';
import 'package:social_app/cubit/social_app_cubit.dart';
import 'package:social_app/firebase_options.dart';
import 'package:social_app/Modules/login.dart';
import 'package:social_app/shared/componse/com.dart';
import 'package:social_app/shared/local/sharedPerefrence.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await cacheHelper.init();
  uId = cacheHelper.getString(key: 'uId');
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late Widget widget;
    if (uId == null) {
      widget = loginScreenSocialApp();
    } else {
      widget = AppScreen();
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SocialAppCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: widget,
      ),
    );
  }
}
