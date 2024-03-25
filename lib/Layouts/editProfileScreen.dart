import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/social_app_cubit.dart';
import 'package:social_app/shared/componse/com.dart';
import 'package:social_app/shared/style/icon_broken.dart';

class EditPrfileScreen extends StatelessWidget {
  TextEditingController NameController = TextEditingController();
  TextEditingController BioController = TextEditingController();
  TextEditingController PhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = SocialAppCubit.get(context);
    NameController.text = cubit.model!.name!;
    BioController.text = cubit.model!.bio!;
    PhoneController.text = cubit.model!.phone!;
    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Edit Profile'),
            titleSpacing: 5,
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 8),
                child: TextButton(
                    onPressed: () {
                      cubit.uploadDataToFireStore(
                        bio: BioController.text,
                        phone: PhoneController.text,
                        name: NameController.text,
                      );
                    },
                    child: Text(
                      'UPdata'.toUpperCase(),
                      style: TextStyle(color: defualtColor),
                    )),
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
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
                        child: Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: cubit.changeImageCover(context)),
                                color: Colors.pinkAccent,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  cubit.getCoverimage();
                                },
                                icon: CircleAvatar(
                                  child: Icon(IconBroken.Camera),
                                  backgroundColor: Colors.blueAccent,
                                ))
                          ],
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
                          Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            children: [
                              Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: cubit.changeImage(context)),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                height: 110,
                                width: 110,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: cubit.changeImage(context)),
                                  shape: BoxShape.circle,
                                ),
                                child: state is imagePickerLoading
                                    ? Center(child: CircularProgressIndicator())
                                    : null,
                              ),
                              IconButton(
                                  onPressed: () {
                                    cubit.getimage();
                                  },
                                  icon: CircleAvatar(
                                    child: Icon(IconBroken.Camera),
                                    backgroundColor: Colors.blueAccent,
                                  ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
            if(state is uploadDataLoading)
                LinearProgressIndicator(),
             if(state is uploadDataLoading)
               SizedBox(
                  height: 10,
                ),
                defulttextFormField(
                    validator: (value) {},
                    textInputType: TextInputType.text,
                    prefixIcon: IconBroken.Profile,
                    label: 'Name',
                    Controller: NameController,
                    context: context),
                SizedBox(
                  height: 10,
                ),
                defulttextFormField(
                    validator: (value) {},
                    textInputType: TextInputType.text,
                    prefixIcon: IconBroken.Message,
                    label: 'Bio',
                    Controller: BioController,
                    context: context),
                SizedBox(
                  height: 10,
                ),
                defulttextFormField(
                    validator: (value) {},
                    textInputType: TextInputType.phone,
                    prefixIcon: IconBroken.Call,
                    label: 'Phone',
                    Controller: PhoneController,
                    context: context)
              ],
            ),
          ),
        );
      },
    );
  }
}
