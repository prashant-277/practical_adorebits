import 'dart:ui';

import 'package:get_storage/get_storage.dart';

const primaryColor = Color(0xFF000000);
const secondaryColor = Color(0xFF212121);

var baseUrl = "https://api.themoviedb.org/3";
var imageBaseUrl = "https://image.tmdb.org/t/p/w500";
GetStorage storage = GetStorage();

const String apiKey = "api_key=14bc774791d9d20b3a138bb6e26e2579";
String strNoInternetConnection = storage.read("Check your internet connection").toString();