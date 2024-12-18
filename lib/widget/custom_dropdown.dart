import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({super.key});

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final LayerLink _layerLink = LayerLink();
  String dropdownValue = "Not Selected";
  bool isDropdownOpen = false;
  OverlayEntry? _overlayEntry;

  final List<String> items = ["Not Selected", "Male", "Female", "Other"];

  void toggleDropdown() {
    if (isDropdownOpen) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    } else {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
    }
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    Size size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        top: offset.dy + size.height,
        left: offset.dx,
        child: Material(
          elevation: 2,
          child: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: items.map((String value) {
              return ListTile(
                title: Text(value,
                    style: TextStyle(
                      color: dropdownValue == value
                          ? Colors.black
                          : AppColors.grey4,
                    )),
                onTap: () {
                  setState(() {
                    dropdownValue = value;
                    toggleDropdown();
                  });
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: toggleDropdown,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dropdownValue,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    );
  }
}
