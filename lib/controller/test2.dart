import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:prayer/common/locationaddress.dart';
import 'package:prayer/common/prayer_time.dart';
import 'package:prayer/var/prayer_calculation_method.dart';
import 'package:prayer/var/var.dart';
import 'package:prayers_times/prayers_times.dart';

DateTime date = DateTime.now();

class test2 {
  static Future Notif2() async {
    Coordinates coordinates = Coordinates(latitudeloc, longitudeloc);
    print("///Notif\\\\");
// Specify the calculation parameters for prayer times
    PrayerCalculationParameters params = PrayerCalculationMethod.custom();
    params.madhab = PrayerMadhab.shafi;
// Create a PrayerTimes instance for the specified location
    PrayerTimes prayerTimes = PrayerTimes(
      coordinates: coordinates,
      calculationParameters: params,
      precision: true,
      locationName: timeZone,
    );

    final now = DateTime.now();
    DateTime tomorrow = DateTime(now.year, now.month, now.day + 1);
    PrayerTimes prayerTimes1 = PrayerTimes(
      coordinates: coordinates,
      calculationParameters: params,
      dateTime: tomorrow,
      precision: true,
      locationName: timeZone,
    );

    // DateTime tomorrow2 = DateTime(now.year, now.month, now.day + 2);
    // PrayerTimes prayerTimes2 = PrayerTimes(
    //   coordinates: coordinates,
    //   calculationParameters: params,
    //   dateTime: tomorrow2,
    //   precision: true,
    //   locationName: timeZone,
    // );

    // DateTime tomorrow3 = DateTime(now.year, now.month, now.day + 3);
    // PrayerTimes prayerTimes3 = PrayerTimes(
    //   coordinates: coordinates,
    //   calculationParameters: params,
    //   dateTime: tomorrow3,
    //   precision: true,
    //   locationName: timeZone,
    // );

    // DateTime tomorrow4 = DateTime(now.year, now.month, now.day + 4);
    // PrayerTimes prayerTimes4 = PrayerTimes(
    //   coordinates: coordinates,
    //   calculationParameters: params,
    //   dateTime: tomorrow4,
    //   precision: true,
    //   locationName: timeZone,
    // );

    // DateTime tomorrow5 = DateTime(now.year, now.month, now.day + 5);
    // PrayerTimes prayerTimes5 = PrayerTimes(
    //   coordinates: coordinates,
    //   calculationParameters: params,
    //   dateTime: tomorrow5,
    //   precision: true,
    //   locationName: timeZone,
    // );

    // DateTime tomorrow6 = DateTime(now.year, now.month, now.day + 6);
    // PrayerTimes prayerTimes6 = PrayerTimes(
    //   coordinates: coordinates,
    //   calculationParameters: params,
    //   dateTime: tomorrow6,
    //   precision: true,
    //   locationName: timeZone,
    // );
    //////////////////////////////////////////////////////////////////
    DateTime beforefajrnotif = prayerTimes.fajrStartTime!
        .subtract(Duration(minutes: fajrnotif_beforeprayertime));
    DateTime afterfajrnotif = prayerTimes.fajrStartTime!
        .add(Duration(minutes: fajrnotif_afterprayertime));
    ///////
    DateTime beforeduhrnotif = prayerTimes.dhuhrStartTime!
        .subtract(Duration(minutes: duhrnotif_beforeprayertime));
    DateTime afterduhrnotif = prayerTimes.dhuhrStartTime!
        .add(Duration(minutes: duhrnotif_afterprayertime));
    ///////
    DateTime beforeasrnotif = prayerTimes.asrStartTime!
        .subtract(Duration(minutes: asrnotif_beforeprayertime));
    DateTime afterasrnotif = prayerTimes.asrStartTime!
        .add(Duration(minutes: asrnotif_afterprayertime));
    //////////
    DateTime beforemagribnotif = prayerTimes.maghribStartTime!
        .subtract(Duration(minutes: maghribnotif_beforeprayertime));
    DateTime aftermagribnotif = prayerTimes.maghribStartTime!
        .add(Duration(minutes: maghribnotif_afterprayertime));
    //////////
    DateTime beforeishanotif = prayerTimes.ishaStartTime!
        .subtract(Duration(minutes: ishanotif_beforeprayertime));
    DateTime afterishanotif = prayerTimes.ishaStartTime!
        .add(Duration(minutes: ishanotif_afterprayertime));

    // print(beforefajrnotif.hour);
    // print(beforefajrnotif.minute);
    // print(afterfajrnotif.hour);
    // print(afterfajrnotif.minute);
// //////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////
    DateTime beforefajrnotif1 = prayerTimes1.fajrStartTime!
        .subtract(Duration(minutes: fajrnotif_beforeprayertime));
    DateTime afterfajrnotif1 = prayerTimes1.fajrStartTime!
        .add(Duration(minutes: fajrnotif_afterprayertime));
    ///////
    DateTime beforeduhrnotif1 = prayerTimes1.dhuhrStartTime!
        .subtract(Duration(minutes: duhrnotif_beforeprayertime));
    DateTime afterduhrnotif1 = prayerTimes1.dhuhrStartTime!
        .add(Duration(minutes: duhrnotif_afterprayertime));
    ///////
    DateTime beforeasrnotif1 = prayerTimes1.asrStartTime!
        .subtract(Duration(minutes: asrnotif_beforeprayertime));
    DateTime afterasrnotif1 = prayerTimes1.asrStartTime!
        .add(Duration(minutes: asrnotif_afterprayertime));
    //////////
    DateTime beforemagribnotif1 = prayerTimes1.maghribStartTime!
        .subtract(Duration(minutes: maghribnotif_beforeprayertime));
    DateTime aftermagribnotif1 = prayerTimes1.maghribStartTime!
        .add(Duration(minutes: maghribnotif_afterprayertime));
    //////////
    DateTime beforeishanotif1 = prayerTimes1.ishaStartTime!
        .subtract(Duration(minutes: ishanotif_beforeprayertime));
    DateTime afterishanotif1 = prayerTimes1.ishaStartTime!
        .add(Duration(minutes: ishanotif_afterprayertime));

    // print(beforefajrnotif.hour);
    // print(beforefajrnotif.minute);
    // print(afterfajrnotif.hour);
    // print(afterfajrnotif.minute);
// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 10,
          channelKey: 'Prayer_reminder',
          title: 'اقترب أذان الفجر',
          body: 'بقي على أذان صلاة الفجر $fajrnotif_beforeprayertime دقائق',
          wakeUpScreen: true,
          criticalAlert: true,

          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          // autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: beforefajrnotif.hour,
            minute: beforefajrnotif.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 11,
          channelKey: 'prayer_channel',
          title: 'أذان الفجر ',
          body: 'حان الان موعد أذان صلاة الفجر',
          wakeUpScreen: true,
          criticalAlert: true,

          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          // autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: prayerTimes.fajrStartTime!.hour,
            minute: prayerTimes.fajrStartTime!.minute,
            preciseAlarm: true,
            allowWhileIdle: true)

        //  NotificationCalendar.fromDate(
        //     // repeats: true,
        //     date: DateTime(prayerTimes.fajrStartTime!.hour,
        //         prayerTimes.fajrStartTime!.minute),
        //     preciseAlarm: true,
        //     allowWhileIdle: true)

        );

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 12,
          channelKey: 'Prayer_igama',
          title: 'إقامة صلاة الفجر',
          body: 'مضى على أذان صلاة الفجر $fajrnotif_afterprayertime دقائق',
          wakeUpScreen: true,
          criticalAlert: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: afterfajrnotif.hour,
            minute: afterfajrnotif.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 13,
          channelKey: 'Prayer_reminder',
          title: 'اقترب أذان الظهر',
          body: 'بقي على أذان صلاة الظهر $duhrnotif_beforeprayertime دقائق',
          wakeUpScreen: true,
          criticalAlert: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          // autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: beforeduhrnotif.hour,
            minute: beforeduhrnotif.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 14,
          channelKey: 'prayer_channel',
          title: 'أذان الظهر ',
          body: 'حان الان موعد أذان صلاة الظهر',
          wakeUpScreen: true,
          criticalAlert: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          // autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: prayerTimes.dhuhrStartTime!.hour,
            minute: prayerTimes.dhuhrStartTime!.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 15,
          channelKey: 'Prayer_igama',
          title: 'إقامة صلاة الظهر',
          body: 'مضى على أذان صلاة الظهر $duhrnotif_afterprayertime دقائق',
          wakeUpScreen: true,
          criticalAlert: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: afterduhrnotif.hour,
            minute: afterduhrnotif.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

//////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 16,
          channelKey: 'Prayer_reminder',
          title: 'اقترب أذان العصر',
          body: 'بقي على أذان صلاة العصر $asrnotif_beforeprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: beforeasrnotif.hour,
            minute: afterduhrnotif.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 17,
          channelKey: 'prayer_channel',
          title: 'أذان العصر ',
          body: 'حان الان موعد أذان صلاة العصر',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: prayerTimes.asrStartTime!.hour,
            minute: prayerTimes.asrStartTime!.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 18,
          channelKey: 'Prayer_igama',
          title: 'إقامة صلاة العصر',
          body: 'مضى على أذان صلاة العصر $asrnotif_afterprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: afterasrnotif.hour,
            minute: afterasrnotif.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

// // //////////////////////////////////////////////////////////////////////
// //     ////////////////////////////////////////////////////////////////////

// // //////////////////////////////////////////////////////////
// // /////////////////////////////////////////////////////////

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 19,
          channelKey: 'Prayer_reminder',
          title: 'اقترب أذان المغرب',
          body: 'بقي على أذان صلاة المغرب $maghribnotif_beforeprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: beforemagribnotif.hour,
            minute: beforemagribnotif.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 20,
          channelKey: 'prayer_channel',
          title: 'أذان المغرب ',
          body: 'حان الان موعد أذان صلاة المغرب',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: prayerTimes.maghribStartTime!.hour,
            minute: prayerTimes.maghribStartTime!.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 21,
          channelKey: 'Prayer_igama',
          title: 'إقامة صلاة المغرب',
          body: 'مضى على أذان صلاة المغرب $maghribnotif_afterprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: aftermagribnotif.hour,
            minute: aftermagribnotif.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

// // //////////////////////////////////////////////////////////////////////
// //     ////////////////////////////////////////////////////////////////////
// // //////////////////////////////////////////////////////////
// // /////////////////////////////////////////////////////////
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 22,
          channelKey: 'Prayer_reminder',
          title: 'اقترب أذان العشاء',
          body: 'بقي على أذان صلاة العشاء $ishanotif_beforeprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: beforeishanotif.hour,
            minute: beforeishanotif.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 23,
          channelKey: 'prayer_channel',
          title: 'أذان العشاء ',
          body: 'حان الان موعد أذان صلاة العشاء',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: prayerTimes.ishaStartTime!.hour,
            minute: prayerTimes.ishaStartTime!.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 24,
          channelKey: 'Prayer_igama',
          title: 'إقامة صلاة العشاء',
          body: 'مضى على أذان صلاة العشاء $ishanotif_afterprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day,
            hour: afterishanotif.hour,
            minute: afterishanotif.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 25,
          channelKey: 'Prayer_reminder',
          title: 'اقترب أذان الفجر',
          body: 'بقي على أذان صلاة الفجر $fajrnotif_afterprayertime دقائق',
          wakeUpScreen: true,
          criticalAlert: true,

          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          // autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: beforefajrnotif1.hour,
            minute: beforefajrnotif1.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 26,
          channelKey: 'prayer_channel',
          title: 'أذان الفجر ',
          body: 'حان الان موعد أذان صلاة الفجر',
          wakeUpScreen: true,
          criticalAlert: true,

          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          // autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: prayerTimes1.fajrStartTime!.hour,
            minute: prayerTimes1.fajrStartTime!.minute,
            preciseAlarm: true,
            allowWhileIdle: true)

        //  NotificationCalendar.fromDate(
        //     // repeats: true,
        //     date: DateTime(prayerTimes.fajrStartTime!.hour,
        //         prayerTimes.fajrStartTime!.minute),
        //     preciseAlarm: true,
        //     allowWhileIdle: true)

        );

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 27,
          channelKey: 'Prayer_igama',
          title: 'إقامة صلاة الفجر',
          body: 'مضى على أذان صلاة الفجر $fajrnotif_afterprayertime دقائق',
          wakeUpScreen: true,
          criticalAlert: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: afterfajrnotif1.hour,
            minute: afterfajrnotif1.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

//////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 28,
          channelKey: 'Prayer_reminder',
          title: 'اقترب أذان الظهر',
          body: 'بقي على أذان صلاة الظهر $duhrnotif_beforeprayertime دقائق',
          wakeUpScreen: true,
          criticalAlert: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          // autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: beforeduhrnotif1.hour,
            minute: beforeduhrnotif1.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 29,
          channelKey: 'prayer_channel',
          title: 'أذان الظهر ',
          body: 'حان الان موعد أذان صلاة الظهر',
          wakeUpScreen: true,
          criticalAlert: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          // autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: prayerTimes1.dhuhrStartTime!.hour,
            minute: prayerTimes1.dhuhrStartTime!.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 30,
          channelKey: 'Prayer_igama',
          title: 'إقامة صلاة الظهر',
          body: 'مضى على أذان صلاة الظهر $duhrnotif_afterprayertime دقائق',
          wakeUpScreen: true,
          criticalAlert: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: afterduhrnotif1.hour,
            minute: afterduhrnotif1.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

//////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 31,
          channelKey: 'Prayer_reminder',
          title: 'اقترب أذان العصر',
          body: 'بقي على أذان صلاة العصر $asrnotif_beforeprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: beforeasrnotif1.hour,
            minute: beforeasrnotif1.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 32,
          channelKey: 'prayer_channel',
          title: 'أذان العصر ',
          body: 'حان الان موعد أذان صلاة العصر',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: prayerTimes1.asrStartTime!.hour,
            minute: prayerTimes1.asrStartTime!.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 33,
          channelKey: 'Prayer_igama',
          title: 'إقامة صلاة العصر',
          body: 'مضى على أذان صلاة العصر $asrnotif_afterprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: afterasrnotif1.hour,
            minute: afterasrnotif1.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

// // //////////////////////////////////////////////////////////////////////
// //     ////////////////////////////////////////////////////////////////////

// // //////////////////////////////////////////////////////////
// // /////////////////////////////////////////////////////////

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 34,
          channelKey: 'Prayer_reminder',
          title: 'اقترب أذان المغرب',
          body: 'بقي على أذان صلاة المغرب $maghribnotif_beforeprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: beforemagribnotif1.hour,
            minute: beforefajrnotif1.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 35,
          channelKey: 'prayer_channel',
          title: 'أذان المغرب ',
          body: 'حان الان موعد أذان صلاة المغرب',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: prayerTimes1.maghribStartTime!.hour,
            minute: prayerTimes1.maghribStartTime!.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 36,
          channelKey: 'Prayer_igama',
          title: 'إقامة صلاة المغرب',
          body: 'مضى على أذان صلاة المغرب $maghribnotif_afterprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: aftermagribnotif1.hour,
            minute: aftermagribnotif1.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

// // //////////////////////////////////////////////////////////////////////
// //     ////////////////////////////////////////////////////////////////////
// // //////////////////////////////////////////////////////////
// // /////////////////////////////////////////////////////////
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 37,
          channelKey: 'Prayer_reminder',
          title: 'اقترب أذان العشاء',
          body: 'بقي على أذان صلاة العشاء $ishanotif_beforeprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: beforeishanotif1.hour,
            minute: beforeishanotif1.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 38,
          channelKey: 'prayer_channel',
          title: 'أذان العشاء ',
          body: 'حان الان موعد أذان صلاة العشاء',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: prayerTimes1.ishaStartTime!.hour,
            minute: prayerTimes1.ishaStartTime!.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 39,
          channelKey: 'Prayer_igama',
          title: 'إقامة صلاة العشاء',
          body: 'مضى على أذان صلاة العشاء $ishanotif_afterprayertime دقائق',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'uuid': 'uuid-test'},
          autoDismissible: false,
        ),
        schedule: NotificationCalendar(
            year: date.year,
            month: date.month,
            day: date.day + 1,
            hour: afterishanotif1.hour,
            minute: afterishanotif1.minute,
            preciseAlarm: true,
            allowWhileIdle: true));

// // //////////////////////////////////////////////////////////////////////
// //     ////////////////////////////////////////////////////////////////////

// // //////////////////////////////////////////////////////////
// // /////////////////////////////////////////////////////////
// //     AwesomeNotifications().createNotification(
// //         content: NotificationContent(
// //           id: 110,
// //           channelKey: 'prayer_channel',
// //           title: 'اقترب أذان الفجر',S
// //           body: 'بقي على أذان صلاة الفجر 10 دقائق',
// //           wakeUpScreen: true,
// //           category: NotificationCategory.Reminder,
// //           payload: {'uuid': 'uuid-test'},
// //           autoDismissible: false,
// //         ),
// //         schedule: NotificationCalendar.fromDate(
// //             date: DateTime(
// //                 tomorrow.year,
// //                 tomorrow.month,
// //                 tomorrow.day,
// //                 prayerTimes1.fajrStartTime!.hour,
// //                 prayerTimes1.fajrStartTime!.minute - 10),
// //             preciseAlarm: true,
// //             allowWhileIdle: true));

// //     AwesomeNotifications().createNotification(
// //         content: NotificationContent(
// //           id: 111,
// //           channelKey: 'prayer_channel',
// //           title: 'أذان الفجر ',
// //           body: 'حان الان موعد أذان صلاة الفجر',
// //           wakeUpScreen: true,
// //           category: NotificationCategory.Reminder,
// //           payload: {'uuid': 'uuid-test'},
// //           autoDismissible: false,
// //         ),
// //         schedule: NotificationCalendar.fromDate(
// //             date: DateTime(
// //                 tomorrow.year,
// //                 tomorrow.month,
// //                 tomorrow.day,
// //                 prayerTimes1.fajrStartTime!.hour,
// //                 prayerTimes1.fajrStartTime!.minute),
// //             preciseAlarm: true,
// //             allowWhileIdle: true));

// //     AwesomeNotifications().createNotification(
// //         content: NotificationContent(
// //           id: 112,
// //           channelKey: 'prayer_channel',
// //           title: 'إقامة صلاة الفجر',
// //           body: 'مضى على أذان صلاة الفجر 10 دقائق',
// //           wakeUpScreen: true,
// //           category: NotificationCategory.Reminder,
// //           payload: {'uuid': 'uuid-test'},
// //           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.fajrStartTime!.hour,
//                 prayerTimes1.fajrStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 120,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان الظهر',
//           body: 'بقي على أذان صلاة الظهر 10 دقائق',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.dhuhrStartTime!.hour,
//                 prayerTimes1.dhuhrStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 121,
//           channelKey: 'prayer_channel',
//           title: 'أذان الظهر ',
//           body: 'حان الان موعد أذان صلاة الظهر',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.dhuhrStartTime!.hour,
//                 prayerTimes1.dhuhrStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 122,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة الظهر',
//           body: 'مضى على أذان صلاة الفجر 10 الظهر',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.dhuhrStartTime!.hour,
//                 prayerTimes1.dhuhrStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 130,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان العصر',
//           body: 'بقي على أذان صلاة العصر 10 دقائق',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.asrStartTime!.hour,
//                 prayerTimes1.asrStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 131,
//           channelKey: 'prayer_channel',
//           title: 'أذان العصر ',
//           body: 'حان الان موعد أذان صلاة العصر',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.asrStartTime!.hour,
//                 prayerTimes1.asrStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 132,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة العصر',
//           body: 'مضى على أذان صلاة العصر 10 دقائق',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.asrStartTime!.hour,
//                 prayerTimes1.asrStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////

// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 140,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان المغرب',
//           body: 'بقي على أذان صلاة المغرب 10 دقائق',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.maghribStartTime!.hour,
//                 prayerTimes1.maghribStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 141,
//           channelKey: 'prayer_channel',
//           title: 'أذان المغرب ',
//           body: 'حان الان موعد أذان صلاة المغرب',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.maghribStartTime!.hour,
//                 prayerTimes1.maghribStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 142,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة المغرب',
//           body: 'مضى على أذان صلاة المغرب 3 دقائق',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.maghribStartTime!.hour,
//                 prayerTimes1.maghribStartTime!.minute + 3),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////
// //////////////////////////////////////////////////////////
// /////////////////////////////////////////////////////////
//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 150,
//           channelKey: 'prayer_channel',
//           title: 'اقترب أذان العشاء',
//           body: 'بقي على أذان صلاة العشاء 10 دقائق',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.ishaStartTime!.hour,
//                 prayerTimes1.ishaStartTime!.minute - 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 151,
//           channelKey: 'prayer_channel',
//           title: 'أذان العشاء ',
//           body: 'حان الان موعد أذان صلاة العشاء',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 tomorrow.day,
//                 prayerTimes1.ishaStartTime!.hour,
//                 prayerTimes1.ishaStartTime!.minute),
//             preciseAlarm: true,
//             allowWhileIdle: true));

//     AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: 152,
//           channelKey: 'prayer_channel',
//           title: 'إقامة صلاة العشاء',
//           body: 'مضى على أذان صلاة العشاء 10 دقائق',
//           wakeUpScreen: true,
//           category: NotificationCategory.Reminder,
//           payload: {'uuid': 'uuid-test'},
//           autoDismissible: false,
//         ),
//         schedule: NotificationCalendar.fromDate(
//             date: DateTime(
//                 tomorrow.year,
//                 tomorrow.month,
//                 date.day + 1,
//                 prayerTimes1.maghribStartTime!.hour,
//                 prayerTimes1.maghribStartTime!.minute + 10),
//             preciseAlarm: true,
//             allowWhileIdle: true));

// //////////////////////////////////////////////////////////////////////
//     ////////////////////////////////////////////////////////////////////
  }

  // static loctest() async {
  //   print("object");
  //   PrayerWidget();
  // }
}
