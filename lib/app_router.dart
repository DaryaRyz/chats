import 'package:auto_route/auto_route.dart';
import 'package:chats/presentation/screens/choose_roles_screen.dart';
import 'package:chats/presentation/screens/home_screen.dart';
import 'package:chats/presentation/screens/individual_chat_page.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: ChooseRolesScreen, path: ChooseRolesScreen.routeName, initial: true),
    AutoRoute(page: HomeScreen, path: HomeScreen.routeName),
    AutoRoute(page: IndividualChatPage, path: IndividualChatPage.routeName),
  ],
)
class $AppRouter {}
