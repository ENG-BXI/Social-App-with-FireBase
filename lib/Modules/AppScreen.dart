import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/social_app_cubit.dart';
import 'package:social_app/shared/style/constant.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SocialAppCubit.get(context).getFireBaseData();

    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SocialAppCubit.get(context);
        return Scaffold(
          backgroundColor: defaultbackground,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: defaultbackground,
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                onPressed: () {
                
                },
                icon: Icon(IconBroken.Notification),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(IconBroken.Search),
              ),
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: defaultColor,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: defaultbackground,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home), label: 'home'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat), label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.User), label: 'Users'),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting), label: 'Settings'),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeCurrentIndex(index);
            },
          ),
        );
      },
    );
  }
}
