import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BasePage extends StatelessWidget {
  const BasePage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            const _FirstLayer(),
            const _SecondLayer(),
            const _ThirdLayer(),
            _MainLayer(child: child),
          ],
        ),
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
  double angle = 0;

  bool isOpen = false;

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        transform: Matrix4.identity()
          ..translate(xOffSet, yOffSet)
          ..rotateZ(angle),
        duration: const Duration(milliseconds: 250),
        child: Container(
          height: context.screenHeight,
          width: context.screenWidth,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius:
                isOpen ? BorderRadius.circular(10) : BorderRadius.circular(0),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                !isOpen
                    ? IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Color(0xFF1f186f),
                        ),
                        onPressed: () {
                          setState(() {
                            xOffSet = 150;
                            yOffSet = 80;
                            angle = -0.2;
                            isOpen = true;
                          });

                          secondLayerState.setState(() {
                            secondLayerState.xOffSet = 122;
                            secondLayerState.yOffSet = 110;
                            secondLayerState.angle = -0.275;
                          });
                        })
                    : IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Color(0xFF1f186f)),
                        onPressed: () {
                          if (isOpen) {
                            setState(() {
                              xOffSet = 0;
                              yOffSet = 0;
                              angle = 0;
                              isOpen = false;
                            });

                            secondLayerState.setState(() {
                              secondLayerState.xOffSet = 0;
                              secondLayerState.yOffSet = 0;
                              secondLayerState.angle = 0;
                            });
                          }
                        },
                      ),
                widget.child,
              ],
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
          gradient: LinearGradient(colors: [Color(0xFF4c41a3), Color(0xFF1f186f)]),
        ),
      );
}

late _SecondLayerState secondLayerState;

class _SecondLayer extends StatefulWidget {
  const _SecondLayer({Key? key}) : super(key: key);

  @override
  _SecondLayerState createState() => _SecondLayerState();
}

class _SecondLayerState extends State<_SecondLayer> {
  double xOffSet = 0;
  double yOffSet = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    secondLayerState = this;
    return AnimatedContainer(
      transform: Matrix4.identity()
        ..translate(xOffSet, yOffSet)
        ..rotateZ(angle),
      duration: const Duration(milliseconds: 550),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: const Color(0xFF4c41a3)),
    );
  }
}

class _ThirdLayer extends StatelessWidget {
  const _ThirdLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: context.screenHeight,
        width: context.screenWidth,
        color: Colors.transparent,
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/icon.png', width: context.screenWidth / 5),
              Row(
                children: [
                  'Answeree'.text.white.extraBold.underline.make(),
                  'Islington'.text.red600.extraBold.scale(1.1).underline.make(),
                ],
              ),
              TextButton(
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
                child: 'About'.text.white.extraBold.make(),
              ),
            ],
          ).pOnly(top: 100),
        ).pOnly(left: 15),
      );
}
