import 'package:chattapp/firebase_options.dart';
import 'package:chattapp/screens/auth_cubit/auth_cubit.dart';
import 'package:chattapp/screens/bloc/auth_bloc/auth_bloc.dart';
import 'package:chattapp/screens/login_page.dart';
import 'package:chattapp/screens/chatPage.dart';
import 'package:chattapp/screens/chat_cubit/chat_cubit.dart';
import 'package:chattapp/screens/register_page.dart';
import 'package:chattapp/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  BlocOverrides.runZoned(
    () => const ScholarChat(),
    blocObserver: SimpleBlocObserver(),
  );
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'loginPage',
        routes: {
          'loginPage': (context) => const LoginPage(),
          Registerpage.id: (context) => const Registerpage(),
          ChatPage.id: (context) => ChatPage(),
        },
      ),
    );
  }
}
