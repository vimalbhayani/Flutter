import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Url_Launcher extends StatefulWidget {
  const Url_Launcher({super.key});

  @override
  State<Url_Launcher> createState() => _Url_LauncherState();
}

class _Url_LauncherState extends State<Url_Launcher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Url Launcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              _launchPhoneDialer('tel:+46483135484');
            }, 
            child: Text('Call'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              _launchSms('sms:+51564653156');
            }, 
            child: Text('Send SMS'),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchPhoneDialer(String phoneNumber) async {
    if(await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    }
    else
    {
      throw 'Could not launch $phoneNumber';
    }
  }
  Future<void> _launchSms(String phoneNumber) async {
     if(await canLaunch(phoneNumber)) {
      await launch(phoneNumber);
    }
    else
    {
      throw 'Could not launch $phoneNumber';
    }
  }
}