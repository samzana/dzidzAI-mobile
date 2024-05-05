import 'package:dzidzai_mobile/services/phone_auth/auth_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthCubit() : super(AuthInitialState());

  String? verificationID;

  void sendOTP(String phoneNumber) async {
    emit(AuthLoadingState());

    await _firebaseAuth
        .verifyPhoneNumber(
      phoneNumber: '+263$phoneNumber',
      codeSent: (verificationId, forceResendingToken) {
        verificationID = verificationId;
        emit(AuthCodeSentState());
      },
      verificationCompleted: (phoneAuthCredential) {
        signInWithPhone(phoneAuthCredential);
      },
      verificationFailed: (error) {
        emit(AuthErrorState(error.message.toString()));
      },
      codeAutoRetrievalTimeout: (verificationId) {
        verificationID = verificationId;
      },
    )
        .catchError((error) {
      emit(AuthErrorState(error.toString()));
    });
  }

  void verifyOTP(
      String otp, String name, String phoneNumber, String password) async {
    emit(AuthLoadingState());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationID!, smsCode: otp);
    try {
      //signInWithPhone(credential);
      final user = await signUpUser('$phoneNumber@dzidzai.edu', password);
      if (user != null) {
        await updateUserName(user, name);
        await user.linkWithCredential(credential);
        emit(AuthLoggedInState(user));
      }
    } catch (ex) {
      emit(AuthErrorState(ex.toString()));
    }
  }

  void signInWithPhone(AuthCredential credential) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        emit(AuthLoggedInState(userCredential.user!));
      }
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
  }

  void signInUser(String phoneNumber, String password) async {
    emit(AuthLoadingState());
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: '$phoneNumber@dzidzai.edu', password: password);
      emit(AuthLoggedInState(userCredential.user!));
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
  }

  void logOut() async {
    emit(AuthLoggedOutState());
    _firebaseAuth.signOut();
  }

  Future<User?> signUpUser(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
    return null;
  }

  Future<void> updateUserName(User user, String name) async {
    try {
      await user.updateDisplayName(name);
      await user.reload();
    } on FirebaseAuthException catch (ex) {
      emit(AuthErrorState(ex.message.toString()));
    }
  }
}
