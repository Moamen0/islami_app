import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_color.dart';
import 'package:islami_app/utils/app_style.dart';

class SuraContent extends StatefulWidget {
  final String content;
  final int index;

  const SuraContent({super.key, required this.content, required this.index});

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> with SingleTickerProviderStateMixin {
  bool isSelected = false;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

@override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );

    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: AppColor.primaryColor.withOpacity(0.1),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

@override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

 void _handleTap() {
    setState(() {
      isSelected = !isSelected;
    });

    if (isSelected) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }

  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
   return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
    return GestureDetector(
          onTap: _handleTap,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            margin: EdgeInsets.symmetric(horizontal: width * 0.08),
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isSelected 
                    ? AppColor.primaryColor 
                    : AppColor.primaryColor,
                width: isSelected ? 2.0 : 1.0,
              ),
              color: _colorAnimation.value,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColor.primaryColor.withOpacity(0.2),
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      )
                    ]
                  : [],
            ),
            child: Text(
              '${widget.content}[${widget.index + 1}]',
              style: isSelected
                  ? AppStyle.bold20Primary.copyWith(
                      color: AppColor.primaryColor,
                      fontSize: 21, 
                    )
                  : AppStyle.bold20Primary,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
  
}
