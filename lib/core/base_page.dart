import 'package:answeree_islington_frontend/core/constants.dart';
import 'package:answeree_islington_frontend/core/widgets/animated_neumorphic_button.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          const _FirstLayer(),
          const _SecondLayer(),
          _MainLayer(child: child),
        ],
      );
}

class _MainLayer extends StatefulWidget {
  const _MainLayer({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<_MainLayer> createState() => _MainLayerState();
}

class _MainLayerState extends State<_MainLayer> {
  double xOffSet = 0;
  double yOffSet = 0;
  double scaleOffset = 1;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        transform: Matrix4.identity()
          ..translate(xOffSet, yOffSet)
          ..scale(scaleOffset, scaleOffset),
        duration: kCustomAnimationDuration,
        child: Container(
          height: context.screenHeight,
          width: context.screenWidth,
          decoration: BoxDecoration(
            borderRadius:
                isOpen ? BorderRadius.circular(10) : BorderRadius.circular(0),
          ),
          child: SafeArea(
            child: Scaffold(
              backgroundColor: kCustomBlackColor,
              appBar: AppBar(
                leading: AnimatedNeumorphicButton(
                  animatedIcon: AnimatedIcons.menu_close,
                  onPressed: () {
                    setState(() {
                      if (isOpen) {
                        xOffSet = 0;
                        yOffSet = 0;
                        scaleOffset = 1;
                        isOpen = false;
                      } else {
                        xOffSet = context.screenWidth / 2;
                        yOffSet = context.screenHeight / 4;
                        scaleOffset = .5;
                        isOpen = true;
                      }
                    });
                  },
                ),
              ),
              body: widget.child,
            ),
          ),
        ),
      );
}

class _FirstLayer extends StatelessWidget {
  const _FirstLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: context.screenHeight,
        width: context.screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            colors: [kCustomBlackColor, Colors.black],
          ),
        ),
      );
}

class _SecondLayer extends StatelessWidget {
  const _SecondLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/icon.png', width: context.screenWidth / 8),
              const SizedBox(height: 10),
              Row(
                children: [
                  'Answeree'.text.white.extraBold.underline.make(),
                  'Islington'.text.red600.extraBold.scale(1.1).underline.make(),
                ],
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.question_answer_outlined),
                label: const Text('Question'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.tag),
                label: const Text('Tags'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.supervised_user_circle_sharp),
                label: const Text('Users'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.badge_outlined),
                label: const Text('Badges'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.device_unknown),
                label: const Text('Unanswered'),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz_outlined),
                label: const Text('More Menu'),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () => showAboutDialog(
                  context: context,
                  applicationIcon: Image.asset(
                    'assets/images/icon.png',
                    scale: 15,
                  ),
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook, color: Colors.blue),
                    ),
                  ],
                ),
                icon: const Icon(Icons.info_outline),
                label: 'About'.text.extraBold.make(),
              ),
            ],
          ).pOnly(top: 100),
        ).pOnly(left: 15),
      );
}
