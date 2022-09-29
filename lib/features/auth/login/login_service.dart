import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_project/models/auth/user_request.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Either<User?, FirebaseAuthException>> login(
      UserRequest userRequest) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: userRequest.email, password: userRequest.password);

      return Left(userCredential.user);
    } on FirebaseAuthException catch (e) {
      return Right(e);
    }
  }
}
