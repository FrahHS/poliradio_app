import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:poliradio_app/managers/poliradio_app_icons_icons.dart';

class TitleBarWidget extends StatefulWidget {
  const TitleBarWidget({super.key});

  @override
  State<TitleBarWidget> createState() => _TitleBarWidgetState();
}

const backgroundColor = Color(0xFF333333);

class _TitleBarWidgetState extends State<TitleBarWidget> {
  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [Expanded(child: MoveWindow()), const TitlebarButtons()],
      ),
    );
  }
}

class TitlebarButtons extends StatefulWidget {
  const TitlebarButtons({Key? key}) : super(key: key);

  @override
  TitlebarButtonsState createState() => TitlebarButtonsState();
}

class TitlebarButtonsState extends State<TitlebarButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Minimize button
        TitlebarButton(
          icon: PoliradioAppIcons.minimize,
          iconColor: Colors.white,
          hoverColor: const Color(0xFF555555),
          callback: appWindow.minimize,
        ),
        // Maximize/restore button
        TitlebarButton(
          icon: PoliradioAppIcons.maximize,
          iconColor: Colors.white,
          hoverColor: const Color(0xFF555555),
          callback: appWindow.maximizeOrRestore,
        ),
        // Close button
        TitlebarButton(
          icon: PoliradioAppIcons.close,
          iconColor: Colors.white,
          hoverColor: Colors.red,
          callback: appWindow.close,
        ),
      ],
    );
  }
}

class TitlebarButton extends StatefulWidget {
  const TitlebarButton(
      {Key? key,
      required this.iconColor,
      required this.hoverColor,
      required this.callback,
      required this.icon})
      : super(key: key);

  final Color iconColor;
  final Color hoverColor;
  final VoidCallback callback;
  final IconData icon;

  @override
  TitlebarButtonState createState() => TitlebarButtonState();
}

class TitlebarButtonState extends State<TitlebarButton> {
  bool hover = false;

  void incrementEnter(PointerEvent details) {
    setState(() {
      hover = true;
    });
  }

  void incrementExit(PointerEvent details) {
    setState(() {
      hover = false;
    });
  }

  Color setColor() {
    if (hover) {
      return widget.hoverColor;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: incrementEnter,
      onExit: incrementExit,
      child: Container(
        alignment: Alignment.center,
        color: setColor(),
        child: InkWell(
          onTap: widget.callback,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Icon(
                size: 15,
                widget.icon,
                color: widget.iconColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
