import 'package:auto_route/auto_route_annotations.dart';
import 'package:notes_firebase/presentation/notes/notes_overview/notes_overview_page.dart';
import 'package:notes_firebase/presentation/sign_in/sign_in_page.dart';
import 'package:notes_firebase/presentation/splash/splash_page.dart';

// @MaterialAutoRouter(generateNavigationHelperExtension: true)
// class $Router {
//   @initial
//   SplashPage splashPage;
//   SignInPage signInPage;
// }

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    MaterialRoute(page: SplashPage, initial: true),
    MaterialRoute(page: SignInPage),
    MaterialRoute(page: NotesOverviewPage),
  ],
)
class $Router {}
