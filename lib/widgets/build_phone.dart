import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class BuildPhone extends StatefulWidget {
  const BuildPhone({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  _BuildPhoneState createState() => _BuildPhoneState();
}

class _BuildPhoneState extends State<BuildPhone> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);

    super.dispose();
  }

  void onListen() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 6,
              color: Colors.black26,
            )
          ], borderRadius: BorderRadius.circular(10), color: Vx.white),
          child: TextFormField(
            controller: widget.controller,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Enter phone number',
              prefixIcon: Icon(Icons.phone),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            validator: (phones) {
              if (phones!.length < 10) {
                return 'Enter a valid number';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
