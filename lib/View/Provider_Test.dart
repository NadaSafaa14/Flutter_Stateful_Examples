import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:third_week_flutter/View/Provider/TextFieldProvider.dart';

class ProviderTest extends StatelessWidget {
  ProviderTest({super.key});

  @override
  Widget build(BuildContext context) {
    TextFieldProvider textProviderObj = Provider.of<TextFieldProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TextField(
                //   controller: textProviderObj.textController,
                //   decoration: InputDecoration(
                //     labelText: "Enter some text",
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20),
                // Text("You typed : ${textProviderObj.textController.text}"),

                Text(
                  "Counter : ${textProviderObj.counter}",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: textProviderObj.Increase,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[100],
                      ),
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 30, color: Colors.pink),
                      ),
                    ),
                    SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: textProviderObj.Decrease,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[100],
                      ),
                      child: Text(
                        "-",
                        style: TextStyle(fontSize: 30, color: Colors.pink),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                ElevatedButton(
                  onPressed: textProviderObj.Reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink[100],
                  ),
                  child: Text(
                    "Reset",
                    style: TextStyle(fontSize: 20, color: Colors.pink),
                  ),
                ),

                SizedBox(height: 50),

                Switch(
                  value: textProviderObj.flag,
                  onChanged: textProviderObj.toggle,
                  activeColor: Colors.green,
                  hoverColor: Colors.white,
                  inactiveThumbColor: Colors.red,
                  inactiveTrackColor: Colors.red[200],
                ),

                SizedBox(height: 10),

                Visibility(
                  child: Text("The switch is ON"),
                  visible: textProviderObj.flag,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
