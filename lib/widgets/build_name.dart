import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BuildName extends StatefulWidget {
  const BuildName({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  _BuildNameState createState() => _BuildNameState();
}

class _BuildNameState extends State<BuildName> {
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
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 2),
          blurRadius: 6,
          color: Colors.black26,
        )
      ], borderRadius: BorderRadius.circular(10), color: Vx.white),
      child: TextFormField(
          keyboardType: TextInputType.name,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: 'Enter your name',
            prefixIcon: Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          validator: (name) {
            if (name!.length <= 3) {
              return 'Name should be greater than 3 letters';
            }
            return null;
          }),
    );
  }
}
