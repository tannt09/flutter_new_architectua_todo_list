import 'package:flutter/material.dart';

class OverlayService {
  static final OverlayService _instance = OverlayService._internal();
  factory OverlayService() => _instance;
  OverlayService._internal();

  static OverlayState? get _overlayState {
    final context = navigatorKey.currentContext;
    if (context == null) return null;
    return Overlay.of(context);
  }

  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void showAlert({
    required String title,
    required String message,
    required VoidCallback onConfirm,
  }) {
    if (_overlayState == null) return;

    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black54,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(message),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    overlayEntry.remove();
                    onConfirm();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    _overlayState?.insert(overlayEntry);
  }
}