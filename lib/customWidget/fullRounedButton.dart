import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:payza/main.dart';

class FullRounedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool loading;

  const FullRounedButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.loading = false,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: PrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        onPressed: onPressed,
        child: Center(
          child: loading
              ? CircularProgressIndicator(
                  strokeWidth: 3,
                  color: Colors.white,
                )
              : Text(
                  title,
                  style: TextStyle(fontSize: 16),
                ),
        ),
      ),
    );
  }
}
