import 'package:flutter/material.dart';
import 'package:motiv_prototype/ComponentLibrary/LoadingSpinners/three_bounce.dart';

import '../../ComponentLibrary/LoadingSpinners/fading_circle_spinner.dart';
import '../../ComponentLibrary/LoadingSpinners/loading_spinner_wave.dart';
import '../../ComponentLibrary/LoadingSpinners/pumping_heart.dart';
import '../../ComponentLibrary/LoadingSpinners/ripple_spinner.dart';
import '../../ComponentLibrary/LoadingSpinners/spinning_lines_spinner.dart';

class SpinnerTestingScreen extends StatefulWidget {
  const SpinnerTestingScreen({super.key});

  @override
  SpinnerTestingScreenState createState() => SpinnerTestingScreenState();
}

class SpinnerTestingScreenState extends State<SpinnerTestingScreen> {
  String _selectedWidget = 'WaveSpinner';

  Widget _buildWidgetToTest() {
    switch (_selectedWidget) {
      case 'FadingCircleSpinner':
        return const Center(
          child: FadingCircleSpinner(
            size: 50.0,
            color: Colors.blue,
            duration: Duration(milliseconds: 1200),
          ),
        );
      case 'RippleSpinner':
        return const Center(
          child: RippleSpinner(
            size: 50.0,
            color: Colors.blue,
            duration: Duration(milliseconds: 1200),
          ),
        );
      case 'SpinningLinesSpinner':
        return const Center(
          child: SpinningLinesSpinner(
            size: 50.0,
            color: Colors.blue,
            duration: Duration(milliseconds: 1200),
          ),
        );
      case 'PumpingHeartSpinner':
        return const Center(
          child: PumpingHeartSpinner(
            size: 50.0,
            color: Colors.blue,
            duration: Duration(milliseconds: 1200),
          ),
        );
      case 'WaveSpinner':
        return const Center(
          child: WaveSpinner(
            size: 50.0,
            color: Colors.blue,
            duration: Duration(milliseconds: 1200),
          ),
        );
      case 'ThreeBounceSpinner':
        return const Center(
          child: ThreeBounceSpinner(
            size: 50.0,
            color: Colors.blue,
            duration: Duration(milliseconds: 1200),
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spinner Testing Screen'),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedWidget,
            items: [
              'FadingCircleSpinner',
              'RippleSpinner',
              'SpinningLinesSpinner',
              'PumpingHeartSpinner',
              'WaveSpinner',
              'ThreeBounceSpinner',
              'PianoWaveSpinner'
            ].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedWidget = newValue!;
              });
            },
          ),
          Expanded(
            child: Center(
              child: _buildWidgetToTest(),
            ),
          ),
        ],
      ),
    );
  }
}
