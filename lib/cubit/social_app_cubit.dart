import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_app/Models/postModel.dart';
import 'package:social_app/Models/userModel.dart';
import 'package:social_app/Modules/AppScreen.dart';
import 'package:social_app/Modules/PostScreen.dart';
import 'package:social_app/Modules/chatScreen.dart';
import 'package:social_app/Modules/homeScreen.dart';
import 'package:social_app/Modules/settingScreen.dart';
import 'package:social_app/Modules/userScreen.dart';
import 'package:social_app/shared/componse/com.dart';
import 'package:social_app/shared/local/sharedPerefrence.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
part 'social_app_state.dart';

class SocialAppCubit extends Cubit<SocialAppState> {
  static SocialAppCubit get(context) =>
      BlocProvider.of<SocialAppCubit>(context);
  SocialAppCubit() : super(SocialAppInitial());

  bool isVisable = false;
  changeIspassword(bool isVisable) {
    this.isVisable = !isVisable;
    emit(changeVisablePassword());
  }

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  createUserWithEmailAndPassword(
      {required String email,
      required String name,
      required String phone,
      required String password,
      context}) {
    emit(RegisterLoading());
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userModel _model = userModel(
          name: name,
          email: email,
          password: password,
          isVerficatifon: false,
          phone: phone,
          //defualt bio
          bio: 'write your bio ...',
          cover:
              'https://images.pexels.com/photos/442559/pexels-photo-442559.jpeg?auto=compress&cs=tinysrgb&w=600',
          image:
              'https://img.freepik.com/free-photo/image-hesitant-unshaven-european-man-with-thick-beard-holds-chin-purses-lips-with-clueless-expressions_273609-17361.jpg?t=st=1710978422~exp=1710979022~hmac=66060b6370d34d943c3840f45065d9e8d5a47fc86244dc793e7301df9859750b');
      print('proccess 2 ');

      _firebaseFirestore
          .collection('users')
          .doc(value.user!.uid)
          .set(_model.toMap())
          .then((valueFirestore) {
        cacheHelper.setString(key: 'uId', value: value.user!.uid).then((value) {
          if (value) {
            emit(RegisterLoaded());
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => AppScreen()));
            print("ok set cache and login");
          }
        });
      });
      print('proccess db ');

      print("ok insert in fB");
    }).catchError((error) {
      print(error.toString());
    });

    // print(value.user!.email);
    // print(value.user!.uid);
  }

  loginFireBaseWithEmailAndPassword(
      {required String email, required String password, context}) {
    emit(loginLoading());

    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print('ok sing in ');
      cacheHelper
          .setString(key: 'uId', value: value.user!.uid)
          .then((Boolvalue) {
        print('ok cache in ');
        if (Boolvalue) {
          emit(loginLoaded());
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => AppScreen()));
        }
      });
    }).catchError((error) {
      emit(loginError(error.toString()));
      print(error.toString());
    });
  }

  Future SetFirebaseData({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) async {
    print('proccess 1 ');
    Umodel = userModel(
        name: name,
        email: email,
        password: password,
        isVerficatifon: false,
        phone: phone,
        bio: 'write your bio ...',
        cover:
            'https://images.pexels.com/photos/442559/pexels-photo-442559.jpeg?auto=compress&cs=tinysrgb&w=600',
        image:
            'https://img.freepik.com/free-photo/image-hesitant-unshaven-european-man-with-thick-beard-holds-chin-purses-lips-with-clueless-expressions_273609-17361.jpg?t=st=1710978422~exp=1710979022~hmac=66060b6370d34d943c3840f45065d9e8d5a47fc86244dc793e7301df9859750b');
    print('proccess 2 ');

    _firebaseFirestore
        .collection('users')
        .doc(uId)
        .set(Umodel!.toMap())
        .then((value) {
      print('proccess 1 ');

      print("ok insert in fB");
    }).catchError((error) {
      print(error.toString());
    });
  }

  userModel? Umodel;
  getFireBaseData({bool isUpdate = false, bool isRefresh = false}) {
    emit(settingScreenLoading());
    if (Umodel != null && !isUpdate && !isRefresh) {
      emit(settingScreenLoaded());
    } else {
      _firebaseFirestore.collection('users').doc(uId).get().then((value) {
        Umodel = userModel.fromjson(value.data());
        emit(settingScreenLoaded());
      }).catchError((error) {
        print("======================= errror");
        print(error.toString());
        print("======================= errror");
      });
    }
  }

  List<Widget> screen = [
    homeScreen(),
    chatScreen(),
    PostsScreen(),
    userScreen(),
    settingScreen()
  ];
  int currentIndex = 0;
  changeCurrentIndex(int index, {context}) {
    currentIndex = index;
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => PostsScreen()));
      currentIndex = 0;
    }
    emit(changeCurrentIndexState());
  }

  List<String> titles = [
    'Home',
    'Chats',
    'Posts',
    'Users',
    'Settings',
  ];

  File? imageFile;
  File? imageCoverFile;
  getimage() async {
    var image = ImagePicker();
    emit(imagePickerLoading());
    image.pickImage(source: ImageSource.gallery).then((valuePick) {
      if (valuePick != null) {
        print("ok pickimage select");

        imageFile = File(valuePick.path);
        //storage image in fireStorage
        ProfilestorageImage().then((value) {
          print(valuePick.name);
          emit(imagePickerLoaded());
        });
      } else {
        emit(imagePickerError());
      }
    });
  }

  getCoverimage() async {
    var image = ImagePicker();
    emit(imageCoverPickerLoading());
    image.pickImage(source: ImageSource.gallery).then((valuePick) {
      if (valuePick != null) {
        print("ok pickCoverimage select");

        imageCoverFile = File(valuePick.path);
        //storage image in fireStorage
        CoverstorageImage().then((value) {
          print(valuePick.name);
          emit(imageCoverPickerLoaded());
        });
      } else {
        emit(imageCoverPickerError());
      }
    });
  }

  ImageProvider<Object> changeImage(context) {
    var image;
    image = imageFile == null
        ? CachedNetworkImageProvider(Umodel!.image!)
        : FileImage(imageFile!);
    return image;
  }

  ImageProvider<Object> changeImageCover(context) {
    var image;
    image = imageCoverFile == null
        ? CachedNetworkImageProvider(Umodel!.cover!)
        : FileImage(imageCoverFile!);
    return image;
  }

  Future ProfilestorageImage() async {
    print("ok in fun");

    await _firebaseStorage
        .ref()
        .child("user/${uId}/${Uri.file(imageFile!.path).pathSegments.last}")
        .putFile(imageFile!)
        .then((value) {
      value.ref.getDownloadURL().then(
        (valueUrl) {
          ProfileImageUrl = valueUrl;
        },
      ).catchError(
        (error) {},
      );
      print('ok upload');
    });
  }

  Future CoverstorageImage() async {
    print("ok in fun");

    await _firebaseStorage
        .ref()
        .child(
            "user/${uId}/${Uri.file(imageCoverFile!.path).pathSegments.last}")
        .putFile(imageCoverFile!)
        .then((value) {
      value.ref.getDownloadURL().then(
        (valueUrl) {
          CoverImageUrl = valueUrl;
        },
      ).catchError(
        (error) {},
      );
      print('ok upload');
    });
  }

  postModel? pModel;
  uploadDataToFireStore(
      {String? name,
      String? email,
      String? password,
      String? phone,
      String? image,
      String? cover,
      String? bio,
      bool isVerficatifon = false,
      context}) {
    emit(uploadDataLoading());

    userModel _model = userModel(
      name: name ?? Umodel!.name,
      email: email ?? Umodel!.email,
      password: password ?? Umodel!.password,
      phone: phone ?? Umodel!.phone,
      image: ProfileImageUrl ?? Umodel!.image!,
      cover: CoverImageUrl ?? Umodel!.cover!,
      bio: bio ?? Umodel!.bio,
      isVerficatifon: isVerficatifon == Umodel!.isVerficatifon
          ? Umodel!.isVerficatifon
          : isVerficatifon,
    );
    // userModel _model = userModel(name: name, email: email, password: password, phone: phone, image: image, cover: cover, bio: bio, isVerficatifon: isVerficatifon);
    _firebaseFirestore
        .collection('users')
        .doc(uId)
        .update(_model.toMap())
        .then((value) {
      getFireBaseData(isUpdate: true);
      changeCurrentIndex(screen.length - 1, context: context);
      Navigator.pop(context);
    }).catchError((error) {
      emit(uploadDataError(error: error.toString()));
    });
  }

  File? PostImage;
  String? UrlPostImage;
  Future PutPostImage() async {
    var task = await _firebaseStorage
        .ref()
        .child('posts/$uId/${Uri.file(PostImage!.path).pathSegments.last}')
        .putFile(PostImage!);
    UrlPostImage = await task.ref.getDownloadURL();
  }

  CreatePost({
    required String name,
    required String text,
    String? tag,
    required bool isVerification,
    required BuildContext context,
  }) async {
    emit(CreatePostLoadingData());
    if (PostImage != null) {
      print(PostImage!.path);
      print("===========================================================");
      await PutPostImage();
    }
    postModel _model = postModel(
      name: name,
      text: text,
      tag: tag,
      image: UrlPostImage,
      isVerficatifon: isVerification,
    );
    _firebaseFirestore
        .collection('posts')
        //.add to add (doc) and random ID
        .add(_model.toMap())
        .then((value) {
      emit(CreatePostLoadedData());
      Navigator.pop(context);
      PostImage = null;
      UrlPostImage = null;
      Posts = [];
      getPosts();
    }).catchError((error) {
      emit(CreatePostErrorData(Error: error.toString()));
    });
  }

  Future PostImagePicker() async {
    var image = ImagePicker();
    XFile? fileX = await image.pickImage(source: ImageSource.gallery);
    if (fileX != null) {
      PostImage = File(fileX.path);
      emit(postImagePickerLoaded());
    }
  }

  removeImagePost() {
    PostImage = null;
    emit(removeImagePostState());
  }

  List<postModel> Posts = [];
  List<String> PostId = [];
  List<int> likes = [];
  getPosts() async {
    Posts = [];
    PostId = [];
    likes = [];
    emit(getPostsLoadingData());
    var _allPosts = await _firebaseFirestore.collection('posts').get();
    _allPosts.docs.forEach((element) async {
      var _like = await element.reference.collection('like').get();
      likes.add(_like.docs.length ?? 0);
      Posts.add(postModel.fromjson(element.data()));
      PostId.add(element.id);
    });

    await _firebaseFirestore.collection('posts').get().then((Value) {
      print("=====================");
      print(likes.toString());
      emit(getPostsLoadedData());
    }).catchError((error) {
      emit(getPostsErrorData(Error: error.toString()));
    });
  }

  addLike(String PostId) {
    emit(addLikeLoading());
    _firebaseFirestore
        .collection('posts')
        .doc(PostId)
        .collection('like')
        .doc(uId)
        .set({'status': true}).then((value) {
      emit(addLikeLoaded());
    }).catchError((error) {
      emit(addLikeError(error.toString()));
    });
  }

  List<userModel> allUsers = [];
  List<String> UsersId = [];

  getAllUser() async {
    emit(getAllUserLoadingData());
    var users = await _firebaseFirestore.collection("users").get();
    users.docs.forEach((element) {
      allUsers.add(userModel.fromjson(element.data()));
      UsersId.add(element.id);
    });
    emit(getAllUserLoadedData());
  }
}
