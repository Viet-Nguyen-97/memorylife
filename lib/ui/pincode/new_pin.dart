import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:memorylife/ui/pincode/re_pin.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinPutTest extends StatefulWidget {
  @override
  PinPutTestState createState() => PinPutTestState();
}

class PinPutTestState extends State<PinPutTest> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.blue),
      borderRadius: BorderRadius.circular(5.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Builder(
          builder: (context) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                
                Positioned(
                  top: 250.0,
                  child: Center(
                    child: Text("Tạo mật khẩu", style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  )
                ),

                Positioned(
                  top: 280,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      height: 50,
                      color: Colors.white,
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(5.0),
                      child: PinPut(
                        fieldsCount: 6,
                        onSubmit: (String pin) => _sendDataToSecondScreen(pin, context),
                        focusNode: _pinPutFocusNode,
                        controller: _pinPutController,
                        submittedFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        selectedFieldDecoration: _pinPutDecoration,
                        followingFieldDecoration: _pinPutDecoration.copyWith(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  )
                ),

                Positioned(
                  top: 400,
                  left: 20,
                  right: 20,
                  child: Center(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {

                      },
                      child: Text('Xác nhận', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                    ),
                  )
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _sendDataToSecondScreen(String pin, BuildContext context) {
    String textToSend = pin;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RePinPutTest(pinn: textToSend,),
        ));
  }
}