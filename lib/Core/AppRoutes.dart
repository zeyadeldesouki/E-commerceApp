import 'package:ecommerceapp/Features/HomeView/Presentation/Views/HomeView.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/PopularDetailsView.dart';
import 'package:ecommerceapp/Features/HomeView/Presentation/Views/Widgets/FavoritesView.dart';
import 'package:ecommerceapp/Features/LogInView/Presentation/Views/ForgotView.dart';
import 'package:ecommerceapp/Features/LogInView/Presentation/Views/LogInView.dart';
import 'package:ecommerceapp/Features/ProfileView/Presentation/Views/ProfileView.dart';
import 'package:ecommerceapp/Features/SignUpView/Presentation/Views/SignUpView.dart';
import 'package:ecommerceapp/Features/SplashView.dart/Presentation/Views/SplashView.dart';
import 'package:ecommerceapp/Features/VerifiyView/Presentation/Views/VerifiyView.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static const kSplash = '/';
  static const kLogin = '/login';
  static const kForget = '/forget';
  static const kSignup = "/signup";
  static const kProfile = "/profile";
  static const kVerifiy = "/verify";
  static const kHome = "/home";
  static const kDetails = "/details";
  static const kFavorite = "/favorite";
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: kSplash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const LogInView(),
      ),
      GoRoute(
        path: kForget,
        builder: (context, state) => const ForgotView(),
      ),
      GoRoute(
        path: kSignup,
        builder: (context, state) => const SignUpView(),
      ),
      GoRoute(
        path: kProfile,
        builder: (context, state) => const ProfileView(),
      ),
      GoRoute(
        path: kVerifiy,
        builder: (context, state) => const VerifiyView(),
      ),
      GoRoute(
        path: kHome,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kDetails,
        builder: (context, state) => const PopularDetailsView(),
      ),
      GoRoute(
        path: kFavorite,
        builder: (context, state) => const FavouriteView(),
      ),
    ],
  );
}
