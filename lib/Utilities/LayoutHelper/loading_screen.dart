import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  final Widget child;
  final bool loading;
  final double? height;
  const LoadingScreen({Key? key, required this.child,this.loading = false, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          loading?Positioned.fill(
            child: Container(
              color: Colors.grey.withOpacity(0.3),
            ),
          ):const SizedBox(),
          loading? const Positioned(
            child: Center(child: CircularProgressIndicator()),
          ):const SizedBox(),
        ],
      ),
    );
  }
}
