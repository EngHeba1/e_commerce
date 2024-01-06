import 'package:flutter/material.dart';

import 'config/routes/rouets.dart';

class ECommerce extends StatelessWidget {
  const ECommerce({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) => AppRoutes.onGenerat(settings),
    );
  }
}