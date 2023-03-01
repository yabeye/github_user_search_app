import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SizedBox(height: 20),
        Text("Give me a sec..."),
        SizedBox(height: 20),
        SizedBox(
          height: 20,
        ),
        CircularProgressIndicator(
          color: Colors.white,
        ),
      ],
    );
  }
}
