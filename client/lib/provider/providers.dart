import 'dart:convert';
import 'package:fitness_app/ui/screens/auth/welcome_screen/main.dart';
import 'package:http/http.dart' as http;
import 'package:fitness_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/models/models.dart';
import 'package:fitness_app/ui/screens/auth/register_screen/main.dart';
import 'package:fitness_app/ui/screens/auth/login_screen/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:fitness_app/utility/result_state.dart';

part 'getting_started_change_notifier.dart';
part 'register_change_notifier.dart';
part 'login_change_notifier.dart';
