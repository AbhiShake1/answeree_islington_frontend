import 'package:answeree_islington_frontend/core/constants.dart';
import 'package:answeree_islington_frontend/core/widgets/animated_neumorphic_button/providers/click_provider.dart';
import 'package:answeree_islington_frontend/core/widgets/animated_neumorphic_button/providers/turns_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

class AnimatedNeumorphicButton extends HookConsumerWidget {
  const AnimatedNeumorphicButton({
    Key? key,
    required this.animatedIcon,
    this.height,
    this.width,
    this.onPressed,
  }) : super(key: key);

  final void Function()? onPressed;
  final AnimatedIconData animatedIcon;
  final double? height, width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //overriding sizes here to directly access context
    //on some testing, found that 50 as default is good for my screen width
    //589.76, so  calculated the same ratio for every screen size.
    final size = context.screenWidth * 0.0847;
    final height = this.height ?? size;
    final width = this.width ?? size;
    //similar to border radii, calculating offests
    //one of the offsets: used for both x and y for both button states
    final animationController =
        useAnimationController(duration: kCustomAnimationDuration);
    return AnimatedRotation(
      turns: ref.watch(turnsRef),
      duration: kCustomAnimationDuration,
      curve: Curves.easeOutExpo,
      child: GestureDetector(
        onTap: () {
          const rotation = 1 / 4; //1 quarter of a complete rotation
          final turns = ref.read(turnsRef.notifier);
          if (ref.read(isClickedRef)) {
            turns.decrement(rotation);
            animationController.reverse();
          } else {
            turns.increment(rotation);
            animationController.forward();
          }
          ref.read(isClickedRef.notifier).flip();
          onPressed?.call();
        },
        child: Center(
          child: AnimatedIcon(
            icon: animatedIcon,
            progress: animationController,
            //size (average of width and height) times two-third
            size: ((width + height) / 2) * .66,
            color: kCustomWhiteColor,
          ),
        ),
      ),
    );
  }
}
