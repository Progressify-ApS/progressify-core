import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as material;
import 'package:get_it/get_it.dart';

part 'navigation_animations.dart';

class NavigationService {
  late final PageRoute Function(RouteSettings settings) routes;

  NavigationService(this.routes);

  ///requires a route function to be passed into the class
  /// ```dart
  ///  PageRoute getRoute(RouteSettings settings) {
  ///   switch (settings.name) {
  ///     case AdminDashboard.route:
  ///       return FadeRoute(page: const AdminDashboard(), settings: settings);
  ///     default:
  ///       return FadeRoute(
  ///           page: PageNotFound(route: settings.name!), settings: settings);
  ///   }
  ///   }
  /// ```
  static void initialize(PageRoute Function(RouteSettings settings) routes) =>
      GetIt.instance
          .registerSingleton<NavigationService>(NavigationService(routes));

  ///NavigationService.initialize must be called before using this
  static NavigationService get instance => GetIt.instance<NavigationService>();

  ///In your MaterialApp, add this to the navigatorKey
  ///Eg. navigatorKey: NavigationService.instance.navigatorKey
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  List<String> routeStack = ['/'];

  String get currentRoute {
    String result = '';
    if (routeStack.isNotEmpty) {
      result = routeStack.last;
    }
    return result;
  }

  addToRouteStackRecord(String routeName) {
    routeStack.add(routeName);
    logCurrentRoute();
  }

  replaceLastRouteStackRecord(String routeName) {
    if (routeStack.isEmpty) {
      routeStack.add(routeName);
    } else {
      routeStack[routeStack.length - 1] = routeName;
    }
    logCurrentRoute();
  }

  popLastRouteStackRecord() {
    if (routeStack.isNotEmpty) {
      routeStack.removeLast();
    } else {
      if (kDebugMode) {
        print(
            'The routeStack ended up empty, check if there was some error, falling back to last known screen');
      }
      routeStack.add(currentRoute);
    }
    logCurrentRoute();
  }

  Future<Object?> showDialog(
      {required Widget child,
      BuildContext? context,
      String identifier = 'dialog',
      bool barrierDismissible = false}) async {
    log('Showing dialog $identifier', origin: 'NavigationService');
    addToRouteStackRecord(identifier);
    Object? result = await material.showDialog(
        context: context ?? navigatorKey.currentContext as BuildContext,
        barrierDismissible: barrierDismissible,
        builder: (dialogContext) {
          return child;
        });
    popLastRouteStackRecord();
    return result;
  }

  Future<Object> showModalBottomSheet({
    required Widget child,
    BuildContext? context,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    Color? barrierColor,
    bool isScrollControlled = false,
    bool useRootNavigator = false,
    bool isDismissible = true,
    bool enableDrag = true,
    AnimationController? transitionAnimationController,
    String identifier = 'modalBottomSheet',
  }) async {
    log('Showing modalBottomSheet $identifier', origin: 'NavigationService');
    addToRouteStackRecord(identifier);
    Object result = await material.showModalBottomSheet(
        routeSettings: RouteSettings(name: identifier),
        context: context ?? navigatorKey.currentContext as BuildContext,
        builder: (BuildContext dialogContext) {
          return child;
        },
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: shape,
        clipBehavior: clipBehavior,
        constraints: constraints,
        barrierColor: barrierColor,
        isScrollControlled: isScrollControlled,
        useRootNavigator: useRootNavigator,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        transitionAnimationController: transitionAnimationController);
    popLastRouteStackRecord();
    return result;
  }

  logCurrentRoute() {
    log('Currently on $currentRoute, stack: $routeStack',
        origin: 'NavigationService');
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
    log('Pushing [$routeName]');
    addToRouteStackRecord(routeName);
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic>? pushReplacementNamed(String routeName,
      {Object? arguments, Object? result}) {
    log('Pushing replacement [$routeName]', origin: 'NavigationService');
    replaceLastRouteStackRecord(routeName);
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments, result: result);
  }

  Future<Object?>? push(Route<Object> route) {
    log('Pushing route [${route.settings.name}]', origin: 'NavigationService');

    return navigatorKey.currentState?.push(route);
  }

  Future<Object?>? pushReplacement(Route<Object> route, {Object? result}) {
    log('Pushing replacement route [${route.settings.name}]',
        origin: 'NavigationService');
    return navigatorKey.currentState?.pushReplacement(route, result: result);
  }

  bool get isFirst => routeStack.length < 2;

  pop<T extends Object>([T? result]) {
    if (routeStack.length > 1) {
      popLastRouteStackRecord();
      navigatorKey.currentState?.pop(result);
    } else {
      return;
    }
  }

  popUntilFirst() {
    routeStack = [routeStack.first];

    logCurrentRoute();
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  log(String log, {String? origin}) {
    developer.log(log,
        name: 'NavigationService${origin != null ? '/$origin' : ''}');
  }
}
