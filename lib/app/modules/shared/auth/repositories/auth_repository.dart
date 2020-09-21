import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_auth/app/modules/shared/auth/repositories/auth_exception_handler.dart';
import 'package:social_auth/enums/auth_status_enum.dart';

import 'interfaces/auth_repository_interface.dart';

class AuthRepository implements IAuthRepository {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthStatusEnum _authStatusEnum;

  bool authSignedIn;
  String uid;
  String name;
  String imageUrl;
  String userEmail;

  @override
  Future<UserCredential> authRepoGoogleSignIn() async {
    //try {
    // Initialize Firebase
    await Firebase.initializeApp();

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
    final User user = userCredential.user;

    //print(user);

    if (user != null) {
      // Checking if email and name is null
      assert(user.uid != null);
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoURL != null);

      uid = user.uid;
      name = user.displayName;
      userEmail = user.email;
      imageUrl = user.photoURL;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _firebaseAuth.currentUser;
      assert(user.uid == currentUser.uid);

      _authStatusEnum = AuthStatusEnum.successful;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);
    }
    return userCredential;
    //} catch (e) {
    //  _authStatusEnum = AuthExceptionHandler.handleException(e);
    //  print(_authStatusEnum);
    //}

    //return _authStatusEnum;
    // Once signed in, return the UserCredential
    //return await _firebaseAuth.signInWithCredential(credential);
  }

  @override
  Future<AuthStatusEnum> authRepoSignOut() async {
    await _googleSignIn.signOut();
    await _firebaseAuth.signOut();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('auth', false);

    uid = null;
    name = null;
    userEmail = null;
    imageUrl = null;

    print("User signed out of Google account");
    //return await _firebaseAuth.signOut();
    _authStatusEnum = AuthStatusEnum.signOut;

    return _authStatusEnum;
  }

  @override
  Future<String> authRepoToken() {
    // TODO: implement authRepoToken
    throw UnimplementedError();
  }

  @override
  Future<User> authRepoUser() async {
    return _firebaseAuth.currentUser;
  }

  @override
  Future<String> authRepoEmailPasswordSignIn(
      String email, String password) async {
    // Initialize Firebase
    await Firebase.initializeApp();

    final UserCredential userCredential =
        await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User user = userCredential.user;

    if (user != null) {
      // checking if uid or email is null
      assert(user.uid != null);
      assert(user.email != null);

      uid = user.uid;
      userEmail = user.email;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _firebaseAuth.currentUser;
      assert(user.uid == currentUser.uid);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('auth', true);

      return 'Successfully logged in, User UID: ${user.uid}';
    }

    return null;

    //try {
    //  UserCredential userCredential =
    //      await _firebaseAuth.signInWithEmailAndPassword(
    //          email: email.trim(), password: password.trim());
    //  return userCredential;
    //} on FirebaseAuthException catch (e) {
    //  if (e.code == 'user-not-found') {
    //    print('No user found for that email.');
    //  } else if (e.code == 'wrong-password') {
    //    print('Wrong password provided for that user.');
    //  }
    //}

    //UserCredential userCredential =
    //    await _firebaseAuth.signInWithEmailAndPassword(
    //        email: email.trim(), password: password.trim());
    //return userCredential;
  }

  @override
  Future<String> authRepoEmailPasswordSignUp(
      String email, String password) async {
    // Initialize Firebase
    await Firebase.initializeApp();

    final UserCredential userCredential =
        await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final User user = userCredential.user;

    if (user != null) {
      // checking if uid or email is null
      assert(user.uid != null);
      assert(user.email != null);

      uid = user.uid;
      userEmail = user.email;

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      return 'Successfully registered, User UID: ${user.uid}';
    }

    return null;
  }
}
