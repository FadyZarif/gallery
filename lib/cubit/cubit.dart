

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/cubit/states.dart';
import 'package:gallery/models/GalleryModel.dart';
import 'package:gallery/shared/components/constant.dart';
import 'package:gallery/shared/network/endPoint.dart';

import '../login/cubit/cubit.dart';
import '../shared/network/remote/dio_helper.dart';

class MyCubit extends Cubit<States> {
  MyCubit() : super(IntialState()); // need intial state in the super

  static MyCubit get(context) => BlocProvider.of(context);



  GalleryModel? model;

  void getGallery() {
    emit(LoadingGetGalleryState());
    DioHelper.getData(
        url: 'my-gallery',
        token: token
    ).then((value) {
      print('00000000000000xxxxxxxxxxxxxxxx');
       model = GalleryModel.fromJson(value.data);
      print(value.data);
      emit(SuccessGetGalleryState());
    }).catchError((error) {
      print(error.toString()+'xxxxxxxxxxxxxxxxxxxxxx');
      emit(ErrorGetGalleryState());
    });
  }







}
