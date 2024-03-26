import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/social_app_cubit.dart';
import 'package:social_app/shared/componse/com.dart';
import 'package:social_app/shared/style/constant.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class PostsScreen extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  PostsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = SocialAppCubit.get(context);
    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: const Text('Create Posts'),
            leading: IconButton(
              icon: const Icon(IconBroken.Arrow___Left),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      //here stop
                      if (textController.text != '') {
                        cubit.CreatePost(
                          name: cubit.model!.name!,
                          text: textController.text,
                          isVerification: false,
                          context: context,
                        );
                        
                      } else {
                        toastMessage(
                            message: 'Write text First', color: Colors.red);
                      }
                    },
                    child: const Text(
                      'POST',
                      style: TextStyle(
                        color: defaultColor,
                      ),
                    )),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is CreatePostLoadingData)
                  const LinearProgressIndicator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:
                              CachedNetworkImageProvider(cubit.model!.image!),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
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
                  ],
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "What is on your mind ..."),
                  ),
                ),
                if (cubit.PostImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Card(
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: FileImage(cubit.PostImage!),
                                fit: BoxFit.cover),
                          ),
                        ),
                        elevation: 5,
                      ),
                      IconButton(
                        onPressed: () {
                          cubit.removeImagePost();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blue)),
                      )
                    ],
                  ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  OutlinedBorder.lerp(LinearBorder.none,
                                      LinearBorder.none, 0))),
                          onPressed: () {
                            cubit.PostImagePicker();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                IconBroken.Image,
                                color: defaultColor,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'add photo',
                                style: TextStyle(color: defaultColor),
                              )
                            ],
                          )),
                    ),
                    Expanded(
                      child: TextButton(
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                  OutlinedBorder.lerp(LinearBorder.none,
                                      LinearBorder.none, 0))),
                          onPressed: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '#tags',
                                style: TextStyle(color: defaultColor),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
