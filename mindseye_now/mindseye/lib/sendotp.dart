import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:http/http.dart' as http;
// Initialize Twilio
final twilioFlutter = TwilioFlutter(
  accountSid: 'ACb915e231adcd26971551592d0e549487', // Replace with your Account SID
  authToken: '0bbacec697f419f19ec4b799fe51ef82', // Replace with your Auth Token
  twilioNumber: '+917725961716'

  // : 'VA4ca04d1e5b3e7b73c514c711479f56a4',// Replace with your Verification Service Id
);

// Function to send OTP
Future<void> sendOtp(String dialCode, String phoneNumber,String usertype) async {
    String backendUrl = dotenv.env['BACKEND_URL']!;

  final url = '${backendUrl}/api/users/search-number';

  var response_mongo = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'usertype': usertype,
      'number': phoneNumber
    }),
  );
  print(response_mongo.body);
  if(response_mongo.body.message=="Error Fetching User"){
    print("User not found");
    return;
  }
  else{
    print("User found");
  }

  TwilioResponse response = await twilioFlutter.sendVerificationCode(
    verificationServiceId: 'VA4ca04d1e5b3e7b73c514c711479f56a4',
    recipient: '$dialCode${phoneNumber.replaceAll(" ", "")}',
    verificationChannel: VerificationChannel.SMS,
  );

  if (response.responseState == ResponseState.SUCCESS) {
    print('OTP sent successfully.');
    // Update your UI accordingly
  } else {
    print('Failed to send OTP: ${response.responseState}');
  }
}

extension on String {
  get message => null;
}

extension on http.Response {
  get status => null;
}

Future<bool> verifyOtp(String dialCode, String phoneNumber, String otp) async {
  try {
    TwilioResponse response = await twilioFlutter.verifyCode(
      verificationServiceId: 'VA4ca04d1e5b3e7b73c514c711479f56a4',
      recipient: '$dialCode${phoneNumber.replaceAll(" ", "")}',
      code: otp,
    );

    if (response.responseState == ResponseState.SUCCESS &&
        response.metadata?['status'] == 'approved') {
      print('OTP verified successfully.');
      return true; // OTP is valid
    } else {
      print('OTP verification failed: ${response.metadata?['status']}');
      return false; // OTP is invalid
    }
  } catch (e) {
    print('Error during OTP verification: $e');
    return false; // Return false in case of an error
  }
}