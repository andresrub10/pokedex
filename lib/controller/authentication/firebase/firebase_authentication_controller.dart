import 'package:Pokedex/controller/controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthenticationController extends Controller {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
}
