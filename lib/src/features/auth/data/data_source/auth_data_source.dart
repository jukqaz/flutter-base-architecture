abstract class AuthDataSource {
  Future<void> signIn(String email, String password);
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<void> getUser();
}

class RemoteAuthDataSource extends AuthDataSource {
  @override
  Future<void> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignedIn() {
    // TODO: implement isSignedIn
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String email, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
