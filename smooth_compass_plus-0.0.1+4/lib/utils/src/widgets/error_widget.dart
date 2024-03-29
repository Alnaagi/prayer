import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final Function() onTap;
  final String errMsg;
  final String title;

  const CustomErrorWidget(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.errMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: media.height * .18,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              textAlign: TextAlign.center,
              errMsg,
              style: TextStyle(
                  color: Colors.brown.shade700,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: media.height * .20,
          ),
          Center(
            child: MaterialButton(
              color: Colors.brown.shade900,
              shape: RoundedRectangleBorder(
                // side: BorderSide(width: 1, color: Colors.black12),
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              height: 45,
              onPressed: onTap,
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
