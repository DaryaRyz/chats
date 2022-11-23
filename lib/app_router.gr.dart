// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import 'models/chat_model.dart' as _i6;
import 'presentation/screens/choose_roles_screen.dart' as _i1;
import 'presentation/screens/home_screen.dart' as _i2;
import 'presentation/screens/individual_chat_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    ChooseRolesScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseRolesScreen(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.HomeScreen(
          key: args.key,
          chatModels: args.chatModels,
          sourceChat: args.sourceChat,
        ),
      );
    },
    IndividualChatPageRoute.name: (routeData) {
      final args = routeData.argsAs<IndividualChatPageRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.IndividualChatPage(
          key: args.key,
          chatModel: args.chatModel,
          sourceChat: args.sourceChat,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/choose-screen',
          fullMatch: true,
        ),
        _i4.RouteConfig(
          ChooseRolesScreenRoute.name,
          path: '/choose-screen',
        ),
        _i4.RouteConfig(
          HomeScreenRoute.name,
          path: '/home',
        ),
        _i4.RouteConfig(
          IndividualChatPageRoute.name,
          path: '/individual-chat',
        ),
      ];
}

/// generated route for
/// [_i1.ChooseRolesScreen]
class ChooseRolesScreenRoute extends _i4.PageRouteInfo<void> {
  const ChooseRolesScreenRoute()
      : super(
          ChooseRolesScreenRoute.name,
          path: '/choose-screen',
        );

  static const String name = 'ChooseRolesScreenRoute';
}

/// generated route for
/// [_i2.HomeScreen]
class HomeScreenRoute extends _i4.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i5.Key? key,
    required List<_i6.ChatModel> chatModels,
    required _i6.ChatModel sourceChat,
  }) : super(
          HomeScreenRoute.name,
          path: '/home',
          args: HomeScreenRouteArgs(
            key: key,
            chatModels: chatModels,
            sourceChat: sourceChat,
          ),
        );

  static const String name = 'HomeScreenRoute';
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({
    this.key,
    required this.chatModels,
    required this.sourceChat,
  });

  final _i5.Key? key;

  final List<_i6.ChatModel> chatModels;

  final _i6.ChatModel sourceChat;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key, chatModels: $chatModels, sourceChat: $sourceChat}';
  }
}

/// generated route for
/// [_i3.IndividualChatPage]
class IndividualChatPageRoute
    extends _i4.PageRouteInfo<IndividualChatPageRouteArgs> {
  IndividualChatPageRoute({
    _i5.Key? key,
    required _i6.ChatModel chatModel,
    required _i6.ChatModel sourceChat,
  }) : super(
          IndividualChatPageRoute.name,
          path: '/individual-chat',
          args: IndividualChatPageRouteArgs(
            key: key,
            chatModel: chatModel,
            sourceChat: sourceChat,
          ),
        );

  static const String name = 'IndividualChatPageRoute';
}

class IndividualChatPageRouteArgs {
  const IndividualChatPageRouteArgs({
    this.key,
    required this.chatModel,
    required this.sourceChat,
  });

  final _i5.Key? key;

  final _i6.ChatModel chatModel;

  final _i6.ChatModel sourceChat;

  @override
  String toString() {
    return 'IndividualChatPageRouteArgs{key: $key, chatModel: $chatModel, sourceChat: $sourceChat}';
  }
}
