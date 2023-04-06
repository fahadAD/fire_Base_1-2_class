import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebaselogin/BLOC/post_bloc.dart';
import 'package:firebaselogin/firebase_data.dart';
import 'package:firebaselogin/structure_model.dart';
import 'package:meta/meta.dart';

part 'post_event.dart';
part 'post_state.dart';


class PostBloc extends Bloc<PostEvent, PostState> {

  List<Postmodel> post_list=[];

  Firebase_Services _firebase_services=Firebase_Services();


  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) async{

     emit(post_Loding());

     post_list=(await _firebase_services.get())!;

      if(post_list.isNotEmpty){
        emit(post_Loded(post_list));
      }else{
        emit(post_Error("ERROR"));
      }

    });
  }
}
