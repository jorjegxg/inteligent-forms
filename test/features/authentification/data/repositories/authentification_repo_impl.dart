import 'dart:ffi';

import 'package:flutter_test/flutter_test.dart';
import 'package:inteligent_forms/core/constants/string_constants.dart';
import 'package:inteligent_forms/core/errors/failures.dart';
import 'package:inteligent_forms/features/authentication/data/datasources/remote/authentication_firestore_api.dart';
import 'package:inteligent_forms/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthenticationFirestoreApi extends Mock
    implements AuthenticationFirestoreApi {}

void main() {
  late MockAuthenticationFirestoreApi mockAuthenticationFirestoreApi;
  late AuthenticationRepoImpl authenticationRepoImpl;

  setUp(() {
    mockAuthenticationFirestoreApi = MockAuthenticationFirestoreApi();
    authenticationRepoImpl = AuthenticationRepoImpl(
        authFirestoreApi: mockAuthenticationFirestoreApi);
  });
  const name = "test";
  const type = "test";
  const emailAddress = "test";
  const password = "test";
  const fiscalCode = "test";
  const address = "test";
  Exception exception = Exception();


  test("should call the sign up function from the database", () async {
    when(() => mockAuthenticationFirestoreApi.signUp(
        name: any(),
        type: any(),
        emailAddress: any(),
        password: any(),
        fiscalCode: any(),
        address: any())).thenAnswer((_) async => Void);

    await authenticationRepoImpl.signUp(
        name: name,
        type: type,
        emailAddress: emailAddress,
        password: password,
        fiscalCode: fiscalCode,
        address: address);

    verify(() => mockAuthenticationFirestoreApi.signUp(
          name: name,
          type: type,
          emailAddress: emailAddress,
          password: password,
          fiscalCode: fiscalCode,
          address: address,
        ));
    verifyNoMoreInteractions(mockAuthenticationFirestoreApi);
  });

  test("should call the login function from the database", () async {
    when(() => mockAuthenticationFirestoreApi.login(
          email: any(),
          password: any(),
        )).thenAnswer((_) async => Void);

    await authenticationRepoImpl.login(
      email: emailAddress,
      password: password,
    );

    verify(() => mockAuthenticationFirestoreApi.login(
          email: emailAddress,
          password: password,
        ));
    verifyNoMoreInteractions(mockAuthenticationFirestoreApi);
  });

  test("should call the logout function from the database", () async {
    when(() => mockAuthenticationFirestoreApi.logout())
        .thenAnswer((_) async => Void);

    await authenticationRepoImpl.logout();

    verify(() => mockAuthenticationFirestoreApi.logout());
    verifyNoMoreInteractions(mockAuthenticationFirestoreApi);
  });

  test("should call the logout function from the database,and throw error",
      () async {
    when(() => mockAuthenticationFirestoreApi.logout())
        .thenAnswer((_) async => throwsA(exception));

    final result = await authenticationRepoImpl.logout();

    expect(
      result,
      HardFailure(
        failureMessage: AppStringFailuresMessages.unexpectedFailure,
      ),
    );
    verifyNoMoreInteractions(mockAuthenticationFirestoreApi);
  });
}
