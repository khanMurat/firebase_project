import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/core/constants/collection_constant.dart';
import 'package:firebase_project/models/auth/user_data.dart';
import 'package:firebase_project/models/auth/user_request.dart';

class RegisterService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<Either<User, FirebaseAuthException>> createuser(
      UserRequest userRequest) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userRequest.email, password: userRequest.password);

      return Left(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return Right(e);
    }
  }

  Future<void> userData(UserData userData) async {
    final userDataMap = userData.toMap();

    await _firebaseFirestore
        .collection(Collection.userInfo)
        .doc(userData.uid)
        .set(userDataMap);
  }
}
