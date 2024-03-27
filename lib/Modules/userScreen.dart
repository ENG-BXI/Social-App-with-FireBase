import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/userModel.dart';
import 'package:social_app/cubit/social_app_cubit.dart';

class userScreen extends StatelessWidget {
  const userScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = SocialAppCubit.get(context);
    return BlocConsumer<SocialAppCubit, SocialAppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
                itemBuilder: (context, index) => buildItemUser(
                      model: cubit.allUsers[index],
                      context: context,
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 5,
                    ),
                itemCount: cubit.allUsers.length));
      },
    );
  }

  Widget buildItemUser({
    required userModel model,
    context,
  }) =>
      InkWell(
        onTap: () {},
        child: Container(
          width: double.infinity,
          height: 60,
          
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(model.image!))),
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        model.name! ,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 23),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
