abstract class AuthServiceHelper {
  
  Future<void> signUp({required String email, required String password});
  Future<void> signIn({required String email, required String password});
  
}

class AuthServiceImplement extends AuthServiceHelper {
  @override
  Future<void> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signUp({required String email, required String password}) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
  
  
}

