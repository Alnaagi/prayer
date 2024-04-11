import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("en", LocalData.EN),
  MapLocale("ar", LocalData.AR),
];

mixin LocalData {
  static const String Fajr = "Fajr";
  static const String sunrise = "sunrise";
  static const String Dhuhr = "Dhuhr";
  static const String Asr = "Asr";
  static const String Maghrib = "Maghrib";
  static const String Isha = "Isha";

  static const String Update_Location = "Update_Location";
  static const String change_athan = "change_athan";
  static const String disable_athan = "disable_athan";
  static const String Time_12_24h = "Time_12_24h";
  static const String change_alert_time_for_prayer =
      "change_alert_time_for_prayer";
  static const String Add_time_to_prayers = "Add_time_to_prayers";
  static const String Hijri_Date_diffrence = "Hijri_Date_diffrence";
  static const String Language = "Language";
  static const String Settings = "Settings";
  static const String toast = "toast";
  static const String Azan = "azan";
  static const String water = "water";
  static const String istigfar = "istigfar";
  static const String igama = "igama";

  static const Map<String, dynamic> EN = {
    ///// prayers /////
    Fajr: "Fajr",
    sunrise: "Sunrise",
    Dhuhr: "Dhuhr",
    Asr: "Asr",
    Maghrib: "Maghrib",
    Isha: "Isha",
    ////// settings /////
    Update_Location: "Update Location",
    change_athan: "Change azan",
    disable_athan: "Disable Notifications",
    Time_12_24h: "Time 12/24h",
    change_alert_time_for_prayer: "Change alert time for prayer",
    Add_time_to_prayers: "Add time to prayers",
    Hijri_Date_diffrence: "Hijri Date diffrence",
    Language: "Change Language",
    Settings: "Settings",
    toast: "تم تغيير اللغة",

    Azan: "azan",
    igama: "igama",
    istigfar: "istigfar",
    water: "water",
  };
  static const Map<String, dynamic> AR = {
    ////////// الصلاوات ////////
    Fajr: "الفجر",
    sunrise: "الشروق",
    Dhuhr: "الظهر",
    Asr: "العصر",
    Maghrib: "المغرب",
    Isha: "العشاء",

    /////////  الإعدادات ////////
    Update_Location: "تحديث الموقع",
    change_athan: "تغيير الأذان",
    disable_athan: "تعطيل الإشعارات",
    Time_12_24h: "الوقت 12/24 ساعة",
    change_alert_time_for_prayer: "تغيير وقت التنبيه للصلاة",
    Add_time_to_prayers: "تعديل وقت الصلاة",
    Hijri_Date_diffrence: "تعديل التاريخ الهجري ",
    Language: "تغيير اللغة",
    Settings: "الإعدادات",

    toast: "Language has changed",

/////////////// Azan ////////////
    Azan: "أذان",
    igama: "إقامة",
    istigfar: "استغفار",
    water: "ماء",
  };
}
