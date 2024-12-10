import 'dart:developer';

import 'package:flutter/material.dart';

class LoadingButtonWidget extends StatefulWidget {
  final Future Function()? onPressed;
  final String text;
  const LoadingButtonWidget(
      {super.key, required this.onPressed, required this.text});

  @override
  State<LoadingButtonWidget> createState() => _LoadingButtonWidgetState();
}

class _LoadingButtonWidgetState extends State<LoadingButtonWidget> {
  bool _isLoading = false;

  Future<void> _loadFuture() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await widget.onPressed!();
    } catch (e, s) {
      log(e.toString(), error: e, stackTrace: s);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error $e')));
      rethrow;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: ElevatedButton(
          onPressed:
              (_isLoading || widget.onPressed == null) ? null : _loadFuture,
          child: _isLoading
              ? const SizedBox(
                  height: 22,
                  width: 22,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                )
              : Text(widget.text),
        ))
      ],
    );
  }
}
