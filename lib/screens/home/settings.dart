import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

DateTime scheduleTime = DateTime.now();

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var date = DateTime.now();
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
      ),
      backgroundColor: Colors.brown,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: 1,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Card(
                            child: InkWell(
                              onTap: () {
                                print('tapped');

                                AwesomeNotifications().createNotification(
                                    content: NotificationContent(
                                      id: 99,
                                      channelKey: 'prayer_channel',
                                      title: '   اذان صلاة ',
                                      body: '   لأذان صلاة ',
                                      wakeUpScreen: true,

                                      // category: NotificationCategory.Reminder,
                                      payload: {'uuid': 'uuid-test'},
                                      // autoDismissible: false,
                                    ),
                                    schedule: NotificationCalendar.fromDate(
                                        date: DateTime(
                                            date.year,
                                            date.month,
                                            date.day,
                                            date.hour,
                                            date.minute,
                                            date.second + 5),
                                        preciseAlarm: true,
                                        allowWhileIdle: true));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Country List",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {
                                print('tapped');

                                AwesomeNotifications().createNotification(
                                    content: NotificationContent(
                                      id: 88,
                                      channelKey: 'Prayer_reminder',
                                      title: "reminder",
                                      body: 'reminder',
                                      wakeUpScreen: true,

                                      // category: NotificationCategory.Reminder,
                                      payload: {'uuid': 'uuid-test'},
                                      // autoDismissible: false,
                                    ),
                                    schedule: NotificationCalendar.fromDate(
                                        date: DateTime(
                                            date.year,
                                            date.month,
                                            date.day,
                                            date.hour,
                                            date.minute,
                                            date.second + 5),
                                        preciseAlarm: true,
                                        allowWhileIdle: true));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "City List",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {
                                print('tapped');

                                AwesomeNotifications().createNotification(
                                    content: NotificationContent(
                                      id: 77,
                                      channelKey: 'Prayer_igama',
                                      title: "igama",
                                      body: 'igama',
                                      wakeUpScreen: true,

                                      // category: NotificationCategory.Reminder,
                                      payload: {'uuid': 'uuid-test'},
                                      // autoDismissible: false,
                                    ),
                                    schedule: NotificationCalendar.fromDate(
                                        date: DateTime(
                                            date.year,
                                            date.month,
                                            date.day,
                                            date.hour,
                                            date.minute,
                                            date.second + 5),
                                        preciseAlarm: true,
                                        allowWhileIdle: true));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Add time to prayers ",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {
                                print('tapped');
                                AwesomeNotifications().createNotification(
                                    content: NotificationContent(
                                      id: 66,
                                      channelKey: 'Prayer_Water',
                                      title: "water",
                                      body: 'water',
                                      wakeUpScreen: true,

                                      // category: NotificationCategory.Reminder,
                                      payload: {'uuid': 'uuid-test2'},
                                      // autoDismissible: false,
                                    ),
                                    schedule: NotificationCalendar.fromDate(
                                        date: DateTime(
                                            date.year,
                                            date.month,
                                            date.day,
                                            date.hour,
                                            date.minute,
                                            date.second + 5),
                                        preciseAlarm: true,
                                        allowWhileIdle: true));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Hijri Date diffrence",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {
                                print('tapped');
                                AwesomeNotifications().cancelAll();
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Language",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {
                                print('tapped');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Time 12/24h",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {
                                print('tapped');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "diable athan for a specific time",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {
                                print('tapped');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "change athan",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {
                                print('tapped');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Update Location",
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: InkWell(
                              onTap: () {
                                print('tapped');
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "alert for prayer for each specific prayer time",
                                      style: TextStyle(
                                          fontSize: media.width * 0.04),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  )

                  // ListView(
                  //   children: [
                  //     Text("Country List"),
                  //     Text("diable athan for a specific time"),,
                  //     Text("Add time to prayers "),
                  //     Text("Language"),
                  //     Text("Hijri Date diffrence"),
                  //     Text("Time 12/24h"),
                  //     Text("diable athan for a specific time"),
                  //     Text("change athan"),
                  //     Text("Update Location"),
                  //     Text("alert for prayer for each specific prayer time"),
                  //   ],
                  // ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
