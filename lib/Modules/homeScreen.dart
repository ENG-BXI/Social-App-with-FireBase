import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/social_app_cubit.dart';
import 'package:social_app/shared/componse/com.dart';
import 'package:social_app/shared/local/sharedPerefrence.dart';
import 'package:social_app/shared/style/constant.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class homeScreen extends StatelessWidget {
  const homeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SocialAppCubit.get(context);
    uId = cacheHelper.getString(key: 'uId');
    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (cubit.model != null) {
          return RefreshIndicator(
            onRefresh: () async {
              cubit.getFireBaseData(isRefresh: true);
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Card(
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    'https://img.freepik.com/free-vector/programmer-doing-his-job-flat-design_52683-14150.jpg?w=740&t=st=1711326061~exp=1711326661~hmac=005aa1baec074166661239c69edc60c5ae1000035900407d8a6f53a9f1e3402d'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        elevation: 5,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'communication with frinds',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Card(
                    shape: ShapeBorder.lerp(
                        InputBorder.none, LinearBorder.none, 10),
                    elevation: 5,
                    shadowColor: Colors.black,
                    surfaceTintColor: defaultbackground,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  child: Image(
                                      fit: BoxFit.contain,
                                      image: CachedNetworkImageProvider(
                                          'https://img.freepik.com/free-vector/bearded-man-profile_24908-81067.jpg?w=740&t=st=1711325864~exp=1711326464~hmac=a87a009ef4a33adad57a831016a7993b5fdd3028066b71203cf28bf16ca204f0')),
                                  minRadius: 20,
                                  maxRadius: 21,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            'Abdalrhman Muneer',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(fontSize: 18),
                                          )),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.check_circle_sharp,
                                            color: Colors.blue,
                                            size: 15,
                                          )
                                        ],
                                      ),
                                      const Text(
                                        'jan21 , 2021 at 11:00 pm ',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.horizontal_rule),
                                  padding: EdgeInsetsDirectional.zero,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            'dsfsssssssdfddfsdfdfdffsfsdfdfdsssdfdsfdffsfsdfdfdfsdfdsfssssssdfdsfdffsfsdfdfdfsdfdsfssssssdfdsfdffsfsdfdfdfsdfdsfssssssdfdsfdffsfsdfdfdfsdfdsfssssssdfdsfdffsfsdfdfdfsdf',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Container(
                            width: double.infinity,
                            child: Wrap(
                              children: [
                                MaterialButton(
                                  onPressed: () {},
                                  height: 25,
                                  minWidth: 12,
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 5),
                                  child: Text(
                                    '#flutter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  height: 25,
                                  minWidth: 12,
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 5),
                                  child: Text(
                                    '#flutter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  height: 25,
                                  minWidth: 12,
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 5),
                                  child: Text(
                                    '#flutter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  height: 25,
                                  minWidth: 12,
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 5),
                                  child: Text(
                                    '#flutter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(
                                  'https://img.freepik.com/premium-vector/flat-d-isometric-style-time-go-home-business-concept-web-infographics-vector-illustration-man-worker-braking-chains-running-out-creative-people-collection_126523-1650.jpg?w=740',
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          IconBroken.Heart,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '120',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: Colors.grey[700]),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          IconBroken.Chat,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '120 commit',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: Colors.grey[700]),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.pinkAccent,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'write a comment ...',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: Colors.grey[700]),
                                        )
                                      ],
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                                InkWell(
                                  child: const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconBroken.Heart,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('Like')
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: ShapeBorder.lerp(
                        InputBorder.none, LinearBorder.none, 10),
                    elevation: 5,
                    shadowColor: Colors.black,
                    surfaceTintColor: defaultbackground,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.pinkAccent,
                                  minRadius: 20,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Abdalrhman Muneer',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(fontSize: 18),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.check_circle_sharp,
                                            color: Colors.blue,
                                            size: 15,
                                          )
                                        ],
                                      ),
                                      const Text(
                                        'jan21 , 2021 at 11:00 pm ',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.horizontal_rule),
                                  padding: EdgeInsetsDirectional.zero,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey.withOpacity(0.4),
                            ),
                          ),
                          Text(
                            'dsfsssssssdfddfsdfdfdffsfsdfdfdsssdfdsfdffsfsdfdfdfsdfdsfssssssdfdsfdffsfsdfdfdfsdfdsfssssssdfdsfdffsfsdfdfdfsdfdsfssssssdfdsfdffsfsdfdfdfsdfdsfssssssdfdsfdffsfsdfdfdfsdf',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Container(
                            width: double.infinity,
                            child: Wrap(
                              children: [
                                MaterialButton(
                                  onPressed: () {},
                                  height: 25,
                                  minWidth: 12,
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 5),
                                  child: Text(
                                    '#flutter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  height: 25,
                                  minWidth: 12,
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 5),
                                  child: Text(
                                    '#flutter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  height: 25,
                                  minWidth: 12,
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 5),
                                  child: Text(
                                    '#flutter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .caption!
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {},
                                  height: 25,
                                  minWidth: 12,
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 5),
                                  child: Text(
                                    '#flutter',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 120,
                            width: double.infinity,
                            color: Colors.pinkAccent,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          IconBroken.Heart,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '120',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: Colors.grey[700]),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const Icon(
                                          IconBroken.Chat,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '120 commit',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: Colors.grey[700]),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 1,
                            width: double.infinity,
                            color: Colors.grey.withOpacity(0.4),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          radius: 15,
                                          backgroundColor: Colors.pinkAccent,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'write a comment ...',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  color: Colors.grey[700]),
                                        )
                                      ],
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                                InkWell(
                                  child: const Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Row(
                                      children: [
                                        Icon(
                                          IconBroken.Heart,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text('Like')
                                      ],
                                    ),
                                  ),
                                  onTap: () {},
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}
