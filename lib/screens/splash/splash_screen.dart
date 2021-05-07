import 'package:flutter/material.dart';
import 'package:heritage/routes/app_routes.dart';
import 'package:heritage/shared/app_gradient_text.dart';
import 'package:heritage/utilities/app_ui.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward(
        from: 0.5,
      ).then((value) {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.SCAN,
        );
      });
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                tag: 'Heritage',
                child: AppGradientText(
                  'Heritage',
                  fontSize: 64,
                  fontFamilly: AppUi.italianaFont,
                ),
              ),
              AppGradientText(
                'التراث',
                fontSize: 32,
                fontFamilly: AppUi.reemKufiFont,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
