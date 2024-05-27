import 'package:flutter/widgets.dart';

class AppConstants {
  //?TODO: Remove this when implementing API store that value as JWT Token not this
  static const String tokenKey = "token";

  //screen key
  static const Key homeScreenKey = Key("homeScreenKey");

  ///Theme Type
  static const String darkTheme = "dark";
  static const String lightTheme = "light";
  static const String systemDefault = "systemDefault";

  ///Secure storage keys
  static const String isOnboardingDoneKey = "isOnboardingDone";
  static const String userKey = "user";
  static const String themeKey = "theme";

  ///Hive Adapter Ids
  //?TODO: Add Hive Adapter Ids
  static const int userAdapterId = 0;
  static const int weatherAdapterId = 1;

  static const int locationAdapterId = 2;

  static const int currentAdapterId = 3;

  static const int conditionAdapterId = 4;

  static const int forecastAdapterId = 5;

  static const int forecastdayAdapterId = 6;

  static const int dayAdapterId = 7;

  static const int astroAdapterId = 8;

  static const int hourAdapterId = 9;

  ///Hive Box Keys
  //?TODO: Add Box Keys
  static const String userBoxKey = "userBox";
//box keys

  static const String hourBoxKey = "hourBoxKey";

  static const String astroBoxKey = "astroBoxKey";

  static const String dayBoxKey = "dayBoxKey";

  static const String forecastdayBoxKey = "forecastdayBoxKey";

  static const String forecastBoxKey = "forecastBoxKey";

  static const String conditionBoxKey = "conditionBoxKey";

  static const String currentBoxKey = "currentBoxKey";

  static const String locationBoxKey = "locationBoxKey";

  static const String weatherBoxKey = "weatherBoxKey";

  ///Static Messages
  static const String requestCancelledText = "Request is cancelled.";
  static const String nullApiResponseText = "Api Response is Null";
  static const String somethingWentWrongText = "Something Went Wrong";
  static const String unknownErrorText = "Unknown Error";
  static const String unableToUpdateImageText = "Unable to update image";
  static const String unableToUpdateNameText = "Unable to update name";
  static const String emptyErrorFieldText = "This field can't be empty.";
}
