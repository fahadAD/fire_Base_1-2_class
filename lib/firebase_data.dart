import 'package:firebaselogin/const_location.dart';
import 'package:firebaselogin/structure_model.dart';


class Firebase_Services {

  Future<List<Postmodel>?> get() async {
    List<Postmodel> post = [];

    await Google_Helper.firebase_store.collection("post").get().then(
      (value) {



        for (var element in value.docs) {

          post.add(Postmodel(

            tittle: element["tittle"],
            description: element["description"],
            postId: element["postId"],
            subcat: element["subcat"],

          ));

        }
      },
    );
    return post;
  }




}































































// Future post()async{
//    await Google_Helper.firebase_store.collection( "post").doc();
// }