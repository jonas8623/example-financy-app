import 'package:example_financy/repositories/repositories.dart';
import 'package:example_financy/services/services.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuthService extends Mock implements AuthServiceHelper {}
class MockSecureStorage extends Mock implements SecureStorageRepository {}
