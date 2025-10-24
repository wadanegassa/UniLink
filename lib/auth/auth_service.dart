import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Register user and save role automatically
  Future<String?> registerUser({
    required String id,
    required String email,
    required String password,
  }) async {
    try {
      // Determine role
      String role;
      if (id.toUpperCase().startsWith('UGR')) {
        role = 'student';
      } else if (email.endsWith('@union.haramaya.edu')) {
        role = 'union_admin';
      } else {
        return 'Invalid ID or email';
      }

      // Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Save in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'idNumber': id,
        'email': email,
        'role': role,
        'createdAt': FieldValue.serverTimestamp(),
      });

      return role; // return role for navigation
    } on FirebaseAuthException catch (e) {
      return e.message; // return Firebase error
    }
  }

  /// Login user and fetch role
  Future<String?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      // Firebase Auth
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get role from Firestore
      DocumentSnapshot snapshot = await _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      String role = snapshot.get('role') ?? 'student';
      return role;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  /// Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  /// Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
