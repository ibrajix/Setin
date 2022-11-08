
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:setin/utils/constant.dart';
import 'package:setin/screens/account.dart';
import 'package:setin/screens/notifications.dart';
import 'package:setin/screens/home.dart';

class MyRouter {
  final router = GoRouter(
      routes: [
        GoRoute(
            path: Destination.homePath, builder: (context, state) => const Home()
        ),
        GoRoute(
          path: Destination.accountPath, builder: (context, state) => const Account()
        ),
        GoRoute(
            path: Destination.notificationsPath, builder: (context, state) => const UserNotifications()
        )
      ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text("Error"),
      ),
      body: Center(
        child: Text(state.error.toString()),
      ),
    )
  );

}