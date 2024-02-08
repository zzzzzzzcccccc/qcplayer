import 'package:flutter/material.dart';
import 'package:qcplayer/constants/common.dart';
import 'package:qcplayer/pages/home.dart';

class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Common.title),
      ),
      body: Center(
        child: Text(
          Common.helloWorld,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}