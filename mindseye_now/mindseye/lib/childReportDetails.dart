// Copyright 2024 Umang Patel
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     https://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:mindseye/labelDataScreen.dart';

class ChildReport extends StatefulWidget {
  @override
  _ChildReportState createState() => _ChildReportState();
}

class _ChildReportState extends State<ChildReport> {
  final String reportId = '82736';
  final String name = 'Student C';
  final int age = 13;
  final int rollNumber = 345678;
  final int score = 87;
  final List<String> answers = [
    'Answer to first question',
    'Answer to second question',
    'Answer to third question',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 50,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Report ID: $reportId',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Name: $name',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Age: $age',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Roll Number: $rollNumber',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Score: $score',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Brief Summary',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Answer 1: ${answers[0]}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Answer 2: ${answers[1]}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Answer 3: ${answers[2]}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
