import 'package:answeree_islington_frontend/core/base_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BasePage(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.question_answer,
                size: MediaQuery.of(context).size.width,
              ),
              const Text('hello world')
            ],
          ),
        ),
      );
}
