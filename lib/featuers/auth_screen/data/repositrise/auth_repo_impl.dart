






import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/repositrise/auth_repo.dart';
import '../models/store_the_user_info_model.dart';

class AuthRepoImpl extends AuthRepo
{
  @override
  Future<Either<Exception,UserCredential>> loginWithCompleteInformation(String emailAddress,String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );

      return Right(credential);

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(Exception('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        return Left(Exception('Wrong password provided for that user.'));
      }
      else{
        return Left(Exception('خطا في كلمة السر او البريد الالكتروني'));
      }
    }catch (e){
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception,UserCredential>> loginWithGoogle() async{
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return Right(await FirebaseAuth.instance.signInWithCredential(credential));

    } catch (e) {

      return Left(Exception(e.toString()));
    }

  }

  @override
  Future<Either<Exception,UserCredential>> signUpWithCompleteInformation(String emailAddress,String password) async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Right(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Left(Exception('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        return Left(Exception('The account already exists for that email.'));
      }
      else{
        return Left(Exception('something wrong'));
      }
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  @override
    Future<Either<Exception,UserCredential>> signUpWithGoogle() async{
      // Trigger the authentication flow
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        // Once signed in, return the UserCredential
        return Right(await FirebaseAuth.instance.signInWithCredential(credential));

      } catch (e) {

        return Left(Exception(e.toString()));
      }

    }

  @override
  Future<Either<Exception,String>> storeTheUserInformation ({
    required String name,
    required String countryName,
    required String emailAddress,
    required String userId,
  }) async{

    try{
      UserInfoModel infoOfTheUser = UserInfoModel(
        name: name,
        email: emailAddress,
        userId: userId,
        isEmailVerified: false,
        countryName: countryName,
      );
      FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .set(infoOfTheUser.toMap());

      return const Right('Create user is Successfully');
    }
    catch(e)
    {
      return Left(Exception(e.toString()));
    }
  }

  @override
  Future<void> pushAndEnd(context,String theNextScreen) async{
      GoRouter.of(context).pushReplacement(theNextScreen);
  }

  @override
  Future<Either<Exception,String>> resetPasswordAndSendItToMyEmail(String email) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email:email);
      return const Right('Chek your email now');
    }on FirebaseAuthException catch (e) {
      return Left(Exception(e.toString()));
    }
  }

  }
