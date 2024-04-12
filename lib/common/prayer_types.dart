import 'package:prayer/localization/locales.dart';

/// The `PrayerType` class provides constants representing different types of Islamic prayers.
///
/// This class defines constants for various Islamic prayers, including their Arabic names.
class PrayerType {
  /// Fajr prayer.
  static const String fajr = LocalData.Fajrprayer;

  /// Sunrise prayer.
  static const String sunrise = LocalData.sunrise;

  /// Dhuhr (noon) prayer.
  static const String dhuhr = LocalData.Dhuhrprayer;

  /// Asr (afternoon) prayer.
  static const String asr = LocalData.Asrprayer;

  /// Maghrib (evening) prayer.
  static const String maghrib = LocalData.Maghribprayer;

  /// Isha (night) prayer.
  static const String isha = LocalData.Ishaprayer;

  /// Isha prayer performed before midnight.
  static const String ishaBefore = 'العشاء';

  /// Fajr prayer performed after midnight.
  static const String fajrAfter = 'الفجر';

  /// No specific prayer type.
  static const String none = 'none';

  /// Sehri type.
  static const String sehri = 'السحور';

  ///  middle Of The Night Prayer.
  static const String middleOfTheNight = 'Middle of the Night';
}
