part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable{}

class PostInitial extends PostState {
  @override

  List<Object?> get props =>  [];
}

class post_Loding extends PostState {
  @override

  List<Object?> get props =>  [];
}

class post_Loded extends PostState {
  List<Postmodel> post_data=[];

  post_Loded(this.post_data);

  @override

  List<Object?> get props =>  [post_data];
}


class post_Error extends PostState {

  final  String post_erro;
  post_Error(this.post_erro);

  @override

  List<Object?> get props =>  [post_erro];
}