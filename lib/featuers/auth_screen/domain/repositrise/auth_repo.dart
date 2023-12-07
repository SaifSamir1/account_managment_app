





import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo
{
  Future<Either<Exception ,UserCredential>> signUpWithGoogle();
  Future<Either<Exception,UserCredential>> signUpWithCompleteInformation(String emailAddress,String password);
  Future<Either<Exception ,UserCredential>> loginWithGoogle();
  Future<Either<Exception,UserCredential>> loginWithCompleteInformation(String emailAddress,String password);

  Future<Either<Exception,String>> storeTheUserInformation({
    required String name,
    required String emailAddress,
    required String userId,
    required String countryName,
  });

  Future<void> pushAndEnd(context,String theNextScreen);
  Future<Either<Exception,String>> resetPasswordAndSendItToMyEmail(String email);

}