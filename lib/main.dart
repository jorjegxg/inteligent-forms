import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inteligent_forms/features/authentication/data/datasources/remote/authentication_firestore_api.dart';
import 'package:inteligent_forms/features/authentication/data/repositories/authentication_repo_impl.dart';
import 'package:inteligent_forms/features/authentication/domain/usecases/authentication_usecase.dart';
import 'package:inteligent_forms/features/authentication/domain/validators/autentication_validators.dart';
import 'package:inteligent_forms/features/authentication/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:inteligent_forms/features/create_form/data/repositories/create_form_repository_impl.dart';
import 'package:inteligent_forms/features/fill_form/data/datasources/fill_form_api.dart';
import 'package:inteligent_forms/features/fill_form/data/repositories/fill_form_repository_impl.dart';
import 'package:inteligent_forms/features/fill_form/domain/usecases/fill_form_usecase.dart';
import 'package:inteligent_forms/features/forms/domain/usecases/forms_usecase.dart';
import 'package:inteligent_forms/features/profile/domain/usecases/profile_usecase.dart';
import 'package:sizer/sizer.dart';

import 'bloc_observer.dart';
import 'features/authentication/presentation/bloc/account_type_bloc.dart/bloc/account_type_bloc.dart';
import 'features/authentication/presentation/pages/home_page/home_page.dart';
import 'features/create_form/data/datasources/create_form_api.dart';
import 'features/create_form/domain/usecases/create_form.dart';
import 'features/create_form/presentation/bloc/create_field_bloc/create_field_bloc.dart';
import 'features/create_form/presentation/bloc/create_form_bloc/create_form_bloc.dart';
import 'features/create_form/presentation/bloc/cubit/document_type_cubit.dart';
import 'features/fill_form/presentation/bloc/fill_content_bloc/bloc/fill_content_bloc.dart';
import 'features/fill_form/presentation/bloc/fill_form_bloc.dart';
import 'features/forms/data/datasource/form_api.dart';
import 'features/forms/data/repositories/form_repository_impl.dart';
import 'features/forms/presentation/bloc/forms_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/submissions/data/datasources/submission_api.dart';
import 'features/submissions/data/repositories/submission_repo_impl.dart';
import 'features/submissions/domain/usecases/submission_usecase.dart';
import 'features/submissions/presentation/bloc/submissions_bloc.dart';
import 'firebase_options.dart';

Future main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => Sizer(
        builder: (
          context,
          orientation,
          deviceType,
        ) {
          return const InteligentFrormsApp();
        },
      ),
    ),
  );
}

class InteligentFrormsApp extends StatelessWidget {
  const InteligentFrormsApp({super.key});

  @override
  Widget build(BuildContext context) {
    final firestore = FirebaseFirestore.instance;
    final createFormBloc = CreateFormBloc(
      createFormUseCase: CreateForm(
        CreateFormRepositoryImpl(
          api: CreateFormApiImpl(
            FirebaseFirestore.instance,
          ),
        ),
      ),
    );

    var themeData = ThemeData(
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.white),
        checkColor: MaterialStateProperty.all(const Color(0XFF004369)),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.teal,
      ).copyWith(
          primary: const Color(0XFF01949A),
          secondary: const Color(0XFF004369),
          tertiary: const Color(0XFFE5DDC8)),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AccountTypeBloc(),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => AuthenticationBloc(
            authenticationUsecase: AuthenticationUsecase(
              authenticationRepo: AuthenticationRepoImpl(
                  authFirestoreApi: AuthenticationFirestoreApi()),
              authenticationValidator: AuthenticationValidator(),
            ),
            accountTypeBloc: context.read<AccountTypeBloc>(),
          ),
        ),
        BlocProvider(
          create: (context) => createFormBloc,
        ),
        BlocProvider(
          create: (context) => DocumentTypeCubit(),
        ),
        BlocProvider(
          create: (context) => CreateFieldBloc(),
        ),
        BlocProvider(
          create: (context) => FormsBloc(
            formsUseCase: FormsUseCase(
              formRepository: FormRepositoryImpl(
                formApi: FormApi(
                  firestore: firestore,
                ),
              ),
            ),
            createFormBloc: createFormBloc,
          )..add(
              FormsLoadStartedEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            profileUsecase: ProfileUsecase(),
          )..add(
              const ProfileLoadEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => FillFormBloc(
            getFormUsecase: GetFormUsecase(
              FillFormRepositoryImpl(
                datasource: FillFormApi(
                  firestore,
                ),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => FillContentBloc(
            fillFormBloc: context.read<FillFormBloc>(),
          ),
        ),
        BlocProvider(
          create: (context) => SubmissionsBloc(
            submissionUsecase: SubmissionUsecase(
              SubmissionRepoImpl(
                submissionApi: SubmissionApi(
                  firestore: firestore,
                ),
              ),
            ),
          ),
          child: Container(),
        )
      ],
      child: MaterialApp(
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}
