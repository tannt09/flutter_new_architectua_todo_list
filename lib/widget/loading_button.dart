import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_new_architectua/constants/colors.dart';

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
    return GestureDetector(
      onTap: (_isLoading || widget.onPressed == null) ? null : _loadFuture,
      child: Container(
        width: double.infinity,
        height: 50,
        margin: const EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(30),
        ),
        child: _isLoading
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                widget.text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
