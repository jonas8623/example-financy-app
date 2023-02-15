import 'package:bloc_test/bloc_test.dart';
import 'package:example_financy/bloc/bloc.dart';
import 'package:example_financy/models/models.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../test.dart';

void main() {

  group('Auth Bloc Testing', () {

    late AuthBloc authBloc;
    late MockSecureStorage mockSecureStorage;
    late MockFirebaseAuthService mockFirebaseAuthService;
    late UserModel userModel;

    setUp(() {

      mockSecureStorage = MockSecureStorage();
      mockFirebaseAuthService = MockFirebaseAuthService();

      authBloc = AuthBloc(
          authServiceHelper: mockFirebaseAuthService,
          secureStorageRepository: mockSecureStorage
      );

      userModel = UserModel(
          name: 'User test',
          email: 'test@test.com',
          id: '1a2b3c4f5g'
      );
    });
    
    test('Initial Test', () {
      expect(authBloc.state, UnAuthenticated());
    });

    blocTest<AuthBloc, AuthState>(
        'Bloc Test Sign In Failure',
        build: () => authBloc,
        act: (bloc) => bloc.add(
            SignInRequestedEvent(
                email: userModel.email!,
                password: 'test@123456'
            ),
        ),
        expect: () => <AuthState>[
          AuthLoadingState(),
          AuthErrorState(errorMessage: 'Error'),
          UnAuthenticated()
        ]
    );

    blocTest<AuthBloc, AuthState>(
        'Bloc Test View Sign In',
        build: () => authBloc,
        act: (bloc) => bloc.add(SignInViewEvent()),
        expect: () => <AuthState>[
          SignInViewState()
        ]
    );

    blocTest<AuthBloc, AuthState>(
        'Bloc Test Logout Failure',
        build: () => authBloc,
        act: (bloc) => bloc.add(SignOutEvent()),
        expect: () => <AuthState>[
          AuthLoadingState(),
          AuthErrorState(errorMessage: 'Error')
        ]
    );

  });

}