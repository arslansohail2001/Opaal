import 'package:flutter/material.dart';

class TopProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const TopProgressBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(totalSteps, (index) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.only(
              right: index < totalSteps - 1 ? 8.0 : 0,
            ),
            height: 4,
            decoration: BoxDecoration(
              color: index < currentStep ? Colors.white : const Color(0xFF333333),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}
