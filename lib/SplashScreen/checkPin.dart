import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckPin extends StatefulWidget {
  const CheckPin({super.key});

  @override
  State<CheckPin> createState() => _CheckPinState();
}

class _CheckPinState extends State<CheckPin> {
  @override
  Widget build(BuildContext context) {
    return const OtpScreen();
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
                child: Container(
                  alignment: const Alignment(0,0.5),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      buildSecurityText(),
                      const SizedBox(height: 40,)
                    ],
                  ),
                )
            ),
            buildNumberPad()
          ],
        )
    );
  }
}

buildNumberPad(){
  return Expanded(
    child: Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
             KeyboardNumber(n:1, onPressed: (){}),
             KeyboardNumber(n:2, onPressed: (){}),
             KeyboardNumber(n:3, onPressed: (){}),
           ],
         ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardNumber(n:4, onPressed: (){}),
              KeyboardNumber(n:5, onPressed: (){}),
              KeyboardNumber(n:6, onPressed: (){}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              KeyboardNumber(n:7, onPressed: (){}),
              KeyboardNumber(n:8, onPressed: (){}),
              KeyboardNumber(n:9, onPressed: (){}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                width: 60,
                child: MaterialButton(
                  onPressed: null,
                  child: SizedBox(),
                ),
              ),
              KeyboardNumber(n: 0, onPressed: (){}),
              SizedBox(
                width: 60,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60)
                  ),
                  onPressed: (){},
                  child: const Icon(Icons.backspace_outlined,color: Colors.deepOrangeAccent,),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

class KeyboardNumber extends StatelessWidget {
  const KeyboardNumber({super.key, required this.n, required this.onPressed});

  final int n;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blueAccent.withOpacity(0.1)
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        padding: const EdgeInsets.all(8),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60)
        ),
        height: 90,
        child: Text("$n",style: const TextStyle(fontSize: 24,color: Colors.blueAccent,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
      ),
    );
  }
}

buildSecurityText (){
  return const Text("Enter Security Pin",
    style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold
    ),
  );
}




