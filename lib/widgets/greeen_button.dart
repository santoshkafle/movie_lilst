import 'package:flutter/material.dart';

class GreeenButton extends StatelessWidget {
  VoidCallback callback;
  GreeenButton({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          callback();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          elevation: 14,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
          shadowColor: Colors.black.withValues(alpha: 0.8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Next Movies",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            Icon(Icons.keyboard_double_arrow_right, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
