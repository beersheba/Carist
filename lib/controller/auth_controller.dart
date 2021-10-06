import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User> signInAnon() async {
    UserCredential result = await firebaseAuth.signInAnonymously();
    User user = result.user;
    return user;
  }

  void signOut() {
    firebaseAuth.signOut();
  }

  @override
  void onInit() {
    signInAnon().then((User user) {
      print('Login success!');
      print('UID: ' + user.uid);
    });
    super.onInit();
  }
}
