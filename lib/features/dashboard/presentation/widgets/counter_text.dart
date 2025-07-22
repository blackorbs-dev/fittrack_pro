import 'package:flutter/material.dart';

class CounterText extends ImplicitlyAnimatedWidget{
  const CounterText({
    super.key, required this.count,
    super.duration = const Duration(milliseconds: 1200),
    super.curve = Curves.fastOutSlowIn,
    this.countStyle, this.prefix,
    this.prefixStyle, this.suffix,
    this.suffixStyle
  });

  final num count;
  final String? prefix;
  final String? suffix;
  final TextStyle? prefixStyle;
  final TextStyle? countStyle;
  final TextStyle? suffixStyle;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() => _CounterTextState();
}

class _CounterTextState extends AnimatedWidgetBaseState<CounterText>{
  IntTween _intCount = IntTween(begin: 0, end: 1);
  Tween<double> _doubleCount = Tween<double>(begin: 0, end: 1);

  @override
  void initState() {
    super.initState();
    if(widget.count is int){
      _intCount = IntTween(begin: 0, end: widget.count.toInt());
    }
    else{
      _doubleCount = Tween<double>(begin: 0, end: widget.count.toDouble());
    }
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => widget.count is int
      ? spannedText(_intCount.evaluate(animation).toString())
      : spannedText(_doubleCount.evaluate(animation).toStringAsFixed(2));

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    if(widget.count is int){
      _intCount = visitor(_intCount, widget.count,
              (dynamic value) => IntTween(begin: value)) as IntTween;
    }
    else{
      _doubleCount = visitor(_doubleCount, widget.count,
              (dynamic value) => Tween<double>(begin: value)) as Tween<double>;
    }
  }

  Widget spannedText(String count){
    TextStyle? defaultStyle = Theme.of(context).textTheme.headlineSmall?.copyWith(color: Theme.of(context).colorScheme.onSecondary);
    return RichText(textAlign: TextAlign.center, text: TextSpan( children: [
      TextSpan(text: widget.prefix, style: widget.prefixStyle??defaultStyle),
      TextSpan(text: count, style: widget.countStyle??defaultStyle),
      TextSpan(text: widget.suffix, style: widget.suffixStyle??defaultStyle)
    ]));
  }
}