import 'package:example_financy/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../mocks/mock_test.dart';


void main() {

  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel userModel;

  setUp(() {
    mockFirebaseAuthService = MockFirebaseAuthService();
    userModel = UserModel(name: 'User test', email: 'test@test.com', id: '1a2b3c4f5g');
  });

  group('Tests sign up', () {

    test('Test sign up success', () async {
      when(
            () => mockFirebaseAuthService.signUp(
          name: 'User test',
          email: 'test@test.com',
          password: 'test12345',
        ),
      ).thenAnswer((_)  async => userModel);

      final actualUser = await mockFirebaseAuthService.signUp(
        name: 'User test',
        email: 'test@test.com',
        password: 'test12345',
      );

      expect(actualUser, userModel);
    });

    test('Test sign up failure', () async {
      when(
            () => mockFirebaseAuthService.signUp(
          name: 'User test',
          email: 'test@test.com',
          password: 'test12345',
        ),
      ).thenThrow(Exception());

      expect(() => mockFirebaseAuthService.signUp(
        name: 'User test',
        email: 'test@test.com',
        password: 'test12345',
      ),
          throwsException);
    });
  });
  


}