import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<void> signup();
  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<void> signup() async{
    try {
      
    } on FirebaseAuthException catch (e) {
      
    }
  }

}