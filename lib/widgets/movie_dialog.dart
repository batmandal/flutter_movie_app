import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie/index.dart';

class MovieDialog extends StatelessWidget {
  final MovieModel data;
  const MovieDialog(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      child: SizedBox(
        height: size.height * 0.3,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("close dialog")),
            Text(data.title),
          ],
        ),
      ),
    );
  }
}
