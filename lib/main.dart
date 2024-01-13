import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rc_fl_quiz_app/screens/GeographicQuizz/Levels/LevelsCountries_screen.dart';
import 'package:rc_fl_quiz_app/screens/musicCategories/MusicCategories.dart';
import 'package:rc_fl_quiz_app/theme/theme.dart';
import 'screens/screens.dart';
import 'screens/MusicQuizz/Levels/Levels_screen.dart';
import 'screens/GeographicQuizz/Levels/LevelsCountries_screen.dart';
import 'screens/geographicCategories/GeographicCategories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quizz-me',
      theme: ThemeData(
        fontFamily: 'NunitoSans',
        primarySwatch: Colors.blue,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: whiteColor,
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(
              child: const SplashScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case '/onboarding':
            return PageTransition(
              child: const OnboardingScreen(),
              type: PageTransitionType.fade,
              settings: settings,
            );
          case '/login':
            return PageTransition(
              child: const LoginScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/forgotPassword':
            return PageTransition(
              child: const ForgotPasswordScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/checkMailScreen':
            return PageTransition(
              child: const CheckMailScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/createNewPassword':
            return PageTransition(
              child: const CreateNewPasswordScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/register':
            return PageTransition(
              child: const RegisterScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/verification':
            return PageTransition(
              child: const VerificationScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/home':
            return PageTransition(
              child: const HomeScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/categories':
            return PageTransition(
              child: const CategoriesScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
            case '/musicCategories':
            return PageTransition(
              child: const MusicCategoriesScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
            case '/geographicCategories':
            return PageTransition(
              child: const GeographicCategoriesScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/liveQuiz':
            return PageTransition(
              child: const LiveQuizScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
            case '/MusicQuiz':
            return PageTransition(
              child: LevelsPage(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
            case '/GeographicQuiz':
            return PageTransition(
              child: LevelsCountriesPage(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/liveQuizFound':
            return PageTransition(
              child: const LiveQuizFoundScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/quiz':
            return PageTransition(
              child: const QuizScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/quizResult':
            return PageTransition(
              child: const QuizResultScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/selectFriend':
            return PageTransition(
              child: const SelectFriendScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/randomuser':
            return PageTransition(
              child: const RandomUserScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/groupQuiz':
            return PageTransition(
              child: const GroupQuizScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/groupQuizResult':
            return PageTransition(
              child: const GroupQuizResultScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/history':
            return PageTransition(
              child: const HistoryScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          /*
          case '/leaderboard':
            return PageTransition(
              child: const LeaderBaordScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );*/
          case '/createQuiz':
            return PageTransition(
              child: const CreateQuizScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/createQuizDetail':
            return PageTransition(
              child: const CreateQuizDetailScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          case '/createQuizDone':
            return PageTransition(
              child: const CreateQuizDoneScreen(),
              type: PageTransitionType.rightToLeft,
              settings: settings,
            );
          default:
            return null;
        }
      },
    );
  }
}
