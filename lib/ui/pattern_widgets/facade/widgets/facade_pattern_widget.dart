/*
Copyright (c) 2019 Mangirdas Kazlauskas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../widgets/vertical_space.dart';
import '../facades/smarthome_facade.dart';
import '../smart_home_state.dart';
import 'device_icon.dart';
import 'mode_switcher.dart';

class FacadePatternWidget extends StatefulWidget {
  @override
  _FacadePatternWidgetState createState() => _FacadePatternWidgetState();
}

class _FacadePatternWidgetState extends State<FacadePatternWidget> {
  final SmartHomeFacade _smartHomeFacade = SmartHomeFacade();
  final SmartHomeState _smartHomeState = SmartHomeState();

  bool _cinemaModeOn = false;
  bool _gamingModeOn = false;
  bool _streamingModeOn = false;

  bool get _isAnyModeOn => _cinemaModeOn || _gamingModeOn || _streamingModeOn;

  void _changeCinemaMode(bool activated) {
    if (activated) {
      _smartHomeFacade.startMovie(_smartHomeState, 'Movie title');
    } else {
      _smartHomeFacade.stopMovie(_smartHomeState);
    }

    setState(() {
      _cinemaModeOn = activated;
    });
  }

  void _changeGamingMode(bool activated) {
    if (activated) {
      _smartHomeFacade.startGaming(_smartHomeState);
    } else {
      _smartHomeFacade.stopGaming(_smartHomeState);
    }

    setState((){
      _gamingModeOn = activated;
    });
  }

  void _changeStreamingMode(bool activated) {
    if (activated) {
      _smartHomeFacade.startStreaming(_smartHomeState);
    } else {
      _smartHomeFacade.stopStreaming(_smartHomeState);
    }

    setState(() {
      _streamingModeOn = activated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ModeSwitcher(
            title: 'Home cinema mode',
            activated: _cinemaModeOn,
            onChanged: !_isAnyModeOn || _cinemaModeOn ? _changeCinemaMode : null,
          ),
          ModeSwitcher(
            title: 'Gaming mode',
            activated: _gamingModeOn,
            onChanged: !_isAnyModeOn || _gamingModeOn ? _changeGamingMode : null,
          ),
          ModeSwitcher(
            title: 'Streaming mode',
            activated: _streamingModeOn,
            onChanged: !_isAnyModeOn || _streamingModeOn ? _changeStreamingMode : null,
          ),
          VerticalSpace(32),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DeviceIcon(
                    iconData: FontAwesomeIcons.tv,
                    activated: _smartHomeState.tvOn,
                  ),
                  DeviceIcon(
                    iconData: FontAwesomeIcons.film,
                    activated: _smartHomeState.netflixConnected,
                  ),
                  DeviceIcon(
                    iconData: Icons.speaker,
                    activated: _smartHomeState.audioSystemOn,
                  ),
                ],
              ),
              VerticalSpace(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DeviceIcon(
                    iconData: FontAwesomeIcons.playstation,
                    activated: _smartHomeState.gamingConsoleOn,
                  ),
                  DeviceIcon(
                    iconData: FontAwesomeIcons.video,
                    activated: _smartHomeState.streamingCameraOn,
                  ),
                  DeviceIcon(
                    iconData: FontAwesomeIcons.lightbulb,
                    activated: _smartHomeState.lightsOn,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
