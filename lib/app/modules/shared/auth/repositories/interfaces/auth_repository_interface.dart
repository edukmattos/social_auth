import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_auth/enums/auth_status_enum.dart';

abstract class IAuthRepository {
  Future<User> authRepoUser();
  Future<UserCredential> authRepoGoogleSignIn();
  Future<String> authRepoEmailPasswordSignIn(String email, String password);
  Future<String> authRepoEmailPasswordSignUp(String email, String password);
  Future authRepoSignOut();
  Future<String> authRepoToken();
}
