import 'package:answeree_islington_frontend/core/base_page.dart';
import 'package:answeree_islington_frontend/core/widgets/loading.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BasePage(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              LoadingIndicator(),
              Text('hello world'),
            ],
          ),
        ),
      );
}
