import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebaselogin/BLOC/post_bloc.dart';
import 'package:firebaselogin/firebase_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 @override
  void initState() {

    context.read<PostBloc>().add(All_postData());
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

body:  BlocBuilder<PostBloc,PostState>(
    builder: (context, state) {
      if(state is post_Loding){
        return CircularProgressIndicator();
      }if(state is post_Loded){
       return ListView.builder(
         primary: false,
         shrinkWrap: true,
         itemCount: state.post_data.length,
         itemBuilder: (BuildContext context, int index) {
       var data=state.post_data[index];

           return ListTile(
             title: Text(data.tittle!),
             subtitle: Text(data.description!),
           );
       },




       );
      }
    if(state is post_Error){
      return Text("Error your service");
    }else{
      return Text(" No data");
    }
    },),
    );
  }
}
