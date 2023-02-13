import 'package:example_financy/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthServiceHelper {
  
  Future<UserModel?> signUp({required String name, required String email, required String password});
  Future<UserModel?> signIn({required String email, required String password});
  Future<void> signOut();

}

class AuthServiceImplement extends AuthServiceHelper {

  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserModel?> signIn({required String email, required String password}) async {

    try {
      final resultUser = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      if(resultUser.user != null) {
        return UserModel(
            email: resultUser.user!.email,
            name: resultUser.user!.displayName
        );
      }

    } on FirebaseAuthException catch(error) {

      if(error.code == 'user-not-found') {
        throw Exception('No user found for that email');

      } else if(error.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user');
      }
    } catch(error) {
      throw Exception('No user found for that email');
    }

    return null;
  }

  @override
  Future<UserModel?> signUp({String? name, required String email, required String password}) async {

    try {
      final resultUser = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      if(resultUser.user != null) {
        await resultUser.user!.updateDisplayName(name);
        return UserModel(
          name: _firebaseAuth.currentUser?.displayName,
          email: _firebaseAuth.currentUser?.email,
          id: _firebaseAuth.currentUser?.uid
        );
      }

    } on FirebaseAuthException catch(error) {

      if(error.code == 'weak-password') {
        throw Exception('The password provided is too weak');
      } else if(error.code == 'email-already-in-use') {
        throw Exception('The account already exists for that email');
      }
    } catch(error) {
       throw Exception("");
    }

    return null;
  }

  @override
  Future<void> signOut() async {

    try {
      await _firebaseAuth.signOut();
    } catch(error) {
      throw Exception(error.toString());
    }
  }
}

