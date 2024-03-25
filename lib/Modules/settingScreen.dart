import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Layouts/editProfileScreen.dart';
import 'package:social_app/Modules/login.dart';
import 'package:social_app/cubit/social_app_cubit.dart';
import 'package:social_app/shared/local/sharedPerefrence.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SocialAppCubit.get(context).getFireBaseData();
    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = SocialAppCubit.get(context);
        if (cubit.model != null) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: RefreshIndicator(
              onRefresh: () async {
                cubit.getFireBaseData(isRefresh: true);
              },
              child: Column(
                children: [
                  Container(
                    height: 170,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        //cover
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: cubit.changeImageCover(context)),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                            ),
                          ),
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              minRadius: 60,
                              maxRadius: 60,
                            ),
                            Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: cubit.changeImage(context),
                                ),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Text(
                    cubit.model!.name!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    cubit.model!.bio!,
                    style: Theme.of(context).textTheme.bodySmall!,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '100',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                'Posts',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '265',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                'Photos',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '100K',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                'Followers',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          child: Column(
                            children: [
                              Text(
                                '90',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                'Followings',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          child: Container(
                            height: 30,
                            child: Center(
                              child: Text('Add Photos',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color: Colors.blue,
                                      )),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[500]!),
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => EditPrfileScreen()));
                        },
                        child: Container(
                          width: 50,
                          height: 30,
                          child: Center(
                            child: Icon(
                              IconBroken.Edit,
                              size: 20,
                              color: Colors.blue,
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[500]!),
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        } else
          return Center(
            child: TextButton(
                onPressed: () {
                  cacheHelper.removeData(key: 'uId').then((value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => loginScreenSocialApp()));
                  });
                },
                child: CircularProgressIndicator()),
          );
      },
    );
  }
}
