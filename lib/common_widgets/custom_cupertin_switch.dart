import 'package:flutter/material.dart';

class CustomCupertinoSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCupertinoSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<CustomCupertinoSwitch> createState() => _CustomCupertinoSwitchState();
}

class _CustomCupertinoSwitchState extends State<CustomCupertinoSwitch> {
  late bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = widget.value;
  }

  @override
  void didUpdateWidget(CustomCupertinoSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _switchValue = widget.value;
    }
  }

  void _toggleSwitch() {
    setState(() {
      _switchValue = !_switchValue;
    });
    widget.onChanged(_switchValue);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSwitch,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 90, // Increased width to prevent overflow
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: _switchValue ? Colors.green : Colors.grey,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      "Online",
                      style: TextStyle(
                        fontSize: 11, // Reduced font size
                        fontWeight: FontWeight.bold,
                        color: _switchValue ? Colors.white : Colors.transparent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      "Offline",
                      style: TextStyle(
                        fontSize: 11, // Reduced font size
                        fontWeight: FontWeight.bold,
                        color:
                            !_switchValue ? Colors.white : Colors.transparent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: _switchValue
                  ? 55
                  : 2, // Adjusted position for wider container
              top: 2,
              bottom: 2,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
