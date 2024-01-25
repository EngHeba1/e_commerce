import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'core/utiles/observer.dart';
import 'e_commerce.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(const ECommerce());
}


