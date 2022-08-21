import 'package:flutter/material.dart';

@immutable
class DiceActionBtn extends StatelessWidget {
  const DiceActionBtn({
    super.key,
    this.onPressed,
    required this.icon,
    required this.text,
  });

  final VoidCallback? onPressed;
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.secondary,
      elevation: 4.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
        child: Text(text),
      ),
    );
  }
}
