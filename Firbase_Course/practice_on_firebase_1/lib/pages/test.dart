import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  String? accessToken;

  getToken() async {
    String? myToken = await FirebaseMessaging.instance.getToken();
    print("==============================");
    print(myToken);
    print("==============================");
  }

  requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<String?> getAccessToken() async {
    final serviceAccountJson = {
      "type": "service_account",
      "project_id": "flutterlearning-f2e86",
      "private_key_id": "c470a1364f747e255500e11e1ae1c8d1ff4df45c",
      "private_key":
          "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCyykFDnLYQGcpC\nKoCRAGFGxca9g3EcZkrJbCcuNq+LoUpjHoD5DgHBuhXfni6Ia5cgIB3UlSudSthK\neN4iGHf/E697XF1kQcy7JRDhVH8j8g/3PjB0bLfsyi0lMtEsjgB82ByhTGT9/H/2\nQ3b7nBXjOTdqIyhEmoQKDi1oeTZnw42ouLjWy5BkS7yUIHiJyWohOtSp07D7vgEH\nX27NTuqC1xvywZLEqRcCXgzoqweGZGg9yy8iZLWBqUcE6b5InEVf5qE7iJ9Y4DdX\ncH3CWj7As099tN01jXO8zGlcXENT0q4tVOWOaotlBisKuFxRiQCJexf1xu4BV/6i\nwUBF02A5AgMBAAECggEAAVCxxzwEAs1JlZ6WoDBCz6iSIx6kptt6dlab5MRl1M4c\nPvzkw5pwyTVq9+Nj5jflNxqLj3MyyaFHjrOB8Og+1Oo/gliz/maBMj2OJGGoHl3V\n+hJw2bI4XKZHgCAQRGx33BBW4Agce6tTt2zbVG3YdMhULyGAdtHpqn7FOf4fGCow\nYouUpV9AWVPUcB0uJnryVkNYAGNkknMEDwusF5iSkXVx/2NULi9ZiVk54eUdv1ui\nmhwUWdP0mboMnPGHTPio804uJ6+SiygR034xqRYJq3eLOlJ2CpztokUAFrB5X5Ou\nYMPE30Qj9qexD9m2jUyF0+hIcxyQwoe32gLvpnGeIQKBgQDrSw1IQq97tHkE8Q2X\nje6jhj9JXmdG+4OvXfZ9wTAP6bTjOSkgojcd4a1Ggnh9RphvpaPA7IDeXKKEMHjy\nNw/HA4mbCKlNQWvNjedrISQbLncSBTDfZQvUOae/Rxt9E1QAtQUoijrLrBNyzJ2z\nZ+BbZnYGk79KqNcZAZUs51QeIQKBgQDChjzVleuOqX0k/nuqtKLSRdQwAEN4Fwz3\nxjDjrZFo+eDmj8Y1e9ZtXIG02pjy6FuCXQgE+CLvgR//HwUxWKVzRTBpEUF+4Ftc\nzHOKL+GBqN7nEO3a6N7N9f+4U1XlnuUNpbT8TV5NI7BUw9H/8wnXu/nE979z/Ks/\nTusZKMiPGQKBgCBYK9ZAHIFj2LL+NAEeaKyf+rkqOgY+8uY7g3PcB7BYTx5hMC8l\nPXBlIn2r18ZY2wGWAoG1wS1QDKMhSq75NLkF2neuZB+Tm68hD6vhXWZDJ+kZP5Ol\n/09IMbAQpU23R3flanUdM2HmILJKQG92GxhVaGoVC1nHBfKRDiGjFyQhAoGASqh8\ntrjohIOWbVlim1zi1PNKAfZH7tJh/sLJRsj58yFcaQErYKGb5bNIcOIpK6l0Xa9Z\nAZc+yU90uVTtiEfukDQw5VJjIc/4IMCzY4kG8t2eV27O62LPCJtuvw70+8ElRjyg\nHumO1Opqpc3WTna4A124+hjgGSMTkqO2ZZyahRkCgYEA03Bz25JDixOcX8Uv4dSv\n3WHhHxhTKQDzvusR0MQNbP3tfvQgtpFGussTjgyUnVhfeAMB9T3BLU+4yw7yVaLN\n1npkFXEYH2vjZsFCAixMq3kRfzYpwAjTIRgVB+ehbBIsisJ5oAIl465xohpMb/j4\nrtHKiWEvsGyw2OOeHrGTMkw=\n-----END PRIVATE KEY-----\n",
      "client_email":
          "firebase-adminsdk-fbsvc@flutterlearning-f2e86.iam.gserviceaccount.com",
      "client_id": "108500142381179923251",
      "auth_uri": "https://accounts.google.com/o/oauth2/auth",
      "token_uri": "https://oauth2.googleapis.com/token",
      "auth_provider_x509_cert_url":
          "https://www.googleapis.com/oauth2/v1/certs",
      "client_x509_cert_url":
          "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40flutterlearning-f2e86.iam.gserviceaccount.com",
      "universe_domain": "googleapis.com",
    };

    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging",
    ];

    try {
      http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
        scopes,
      );

      auth.AccessCredentials credentials = await auth
          .obtainAccessCredentialsViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
            scopes,
            client,
          );

      accessToken = credentials.accessToken.data;

      client.close();

      print("Access Token: $accessToken"); // Print Access Token
      return credentials.accessToken.data;
    } catch (e) {
      print("Error getting access token: $e");
      return null;
    }
  }

  sendNotification(title, message) async {
    String? accessToken = await getAccessToken();

    String? fcmToken = await FirebaseMessaging.instance.getToken();

    var headersList = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    var url = Uri.parse(
      'https://fcm.googleapis.com/v1/projects/flutterlearning-f2e86/messages:send',
    );

    var body = {
      "message": {
        "token": fcmToken,
        "notification": {"title": title, "body": message},
        "android": {
          "notification": {
            "notification_priority": "PRIORITY_MAX",
            "sound": "default",
            "channel_id": "high_importance_channel",
          },
        },
        "apns": {
          "payload": {
            "aps": {"content_available": true},
          },
        },
        "data": {
          "type": "type",
          "id": "userId",
          "click_action": "FLUTTER_NOTIFICATION_CLICK",
        },
      },
    };

    var req = http.Request('POST', url);
    req.headers.addAll(headersList);
    req.body = json.encode(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode >= 200 && res.statusCode < 300) {
      print(resBody);
    } else {
      print(res.reasonPhrase);
    }
  }

  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      if (message.notification != null) {
        print("------------------------------");
        print(message.notification!.title);
        print(message.notification!.body);
        print("------------------------------");
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${message.notification!.body}")),
        );
      }

    //   RemoteNotification? notification = message.notification;
    //   AndroidNotification? android = message.notification?.android;

    //   if (notification != null && android != null) {
    //     await flutterLocalNotificationsPlugin.show(
    //       id: notification.hashCode,
    //       title: notification.title,
    //       body: notification.body,
    //       notificationDetails: NotificationDetails(
    //         android: AndroidNotificationDetails(
    //           channel.id,
    //           channel.name,
    //           channelDescription: 'High Importance Notifications',
    //           importance: Importance.max,
    //           priority: Priority.high,
    //           icon: android.smallIcon,
    //         ),
    //       ),
    //     );
    //   }
    });

    requestPermission();
    getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification")),

      body: Container(
        child: MaterialButton(
          onPressed: () async {
            await sendNotification("Hi", "Hello World!");
          },
          child: Text("Send message"),
        ),
      ),
    );
  }
}
