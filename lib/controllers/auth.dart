import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plasmacovid_app/controllers/preferances.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final googleSignIn = GoogleSignIn();
Future<bool> googlesignin() async {
  GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  if (googleSignInAccount != null) {
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    UserCredential result = await auth.signInWithCredential(credential);
    User user = await result.user;
    print(user.uid);
    //String usUId = user.email;
    //Userpreferances.setUsername(user.email);
    return Future.value(true);
  }
}

Future<bool> signin(String email, String password) async {
  try {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    User user = result.user;
    return Future.value(true);
  } catch (e) {
    switch (e.code) {
      case "invalid-email":
        print("Error");
    }
  }
}

Future<bool> signupp(String email, String password) async {
  try {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    User user = result.user;
    return Future.value(true);
  } catch (e) {
    switch (e.code) {
      case "email-already-in-use":
        print("Error");
    }
  }
}

Future<bool> signOutUser() async {
  User user = await auth.currentUser;
  if (user.providerData[1].providerId == "google.com") {
    await googleSignIn.disconnect();
  }
  auth.signOut();
}
