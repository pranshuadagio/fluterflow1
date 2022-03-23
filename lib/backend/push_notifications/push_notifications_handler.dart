import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../../launch/launch_widget.dart';
import '../../login/login_widget.dart';
import '../../forgot_password/forgot_password_widget.dart';
import '../../create_account/create_account_widget.dart';
import '../../profile/profile_widget.dart';
import '../../success/success_widget.dart';
import '../../paywall/paywall_widget.dart';
import '../../disclaimer/disclaimer_widget.dart';
import '../../chooseyour_challenge/chooseyour_challenge_widget.dart';
import '../../challenge/challenge_widget.dart';
import '../../blem/blem_widget.dart';
import '../../change_password/change_password_widget.dart';
import '../../notifications/notifications_widget.dart';
import '../../termsofservice/termsofservice_widget.dart';
import '../../checkout/checkout_widget.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler(
      {Key key, this.handlePushNotification, this.child})
      : super(key: key);

  final Function(BuildContext) handlePushNotification;
  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).background,
          child: Center(
            child: Builder(
              builder: (context) => Image.asset(
                'assets/images/WhatsApp_Image_2021-10-22_at_00.21.39.jpeg.png',
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Launch': (data) async => LaunchWidget(),
  'login': (data) async => LoginWidget(),
  'forgotPassword': (data) async => ForgotPasswordWidget(),
  'createAccount': (data) async => CreateAccountWidget(),
  'profile': (data) async => ProfileWidget(),
  'Success': (data) async => SuccessWidget(),
  'Paywall': (data) async => PaywallWidget(),
  'Disclaimer': (data) async => DisclaimerWidget(),
  'ChooseyourChallenge': (data) async => ChooseyourChallengeWidget(),
  'Challenge': (data) async => ChallengeWidget(),
  'Tutorials': (data) async => NavBarPage(initialPage: 'TutorialsWidget'),
  'AboutUs': (data) async => NavBarPage(initialPage: 'AboutUsWidget'),
  'Consult': (data) async => NavBarPage(initialPage: 'ConsultWidget'),
  'BLEM': (data) async => BlemWidget(),
  'Settings': (data) async => NavBarPage(initialPage: 'SettingsWidget'),
  'changePassword': (data) async => ChangePasswordWidget(),
  'notifications': (data) async => NotificationsWidget(),
  'Termsofservice': (data) async => TermsofserviceWidget(),
  'Checkout': (data) async => CheckoutWidget(),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
