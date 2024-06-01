import 'package:egycamp/main_screens/Booked_trips.dart';
import 'package:egycamp/main_screens/loved_trips.dart';
import 'package:flutter/material.dart';

import '../general_widgets.dart';
import '../main_screens/user_profile.dart';
import '../signup_screen/functions.dart';
import '../signup_screen/signin.dart';

class TopBar extends StatefulWidget {
  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        children: [
          EgyCampLogo(),
          Expanded(
            child: SizedBox(),
          ),
          CustomDropdownButton(),
          SizedBox(
            width: 20,
          ),
          // Container(
          //   height: 50,
          //   width: 50,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/amanda.png'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // )

        ],
      ),
    );
  }
}





class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {


  @override
  Widget build(BuildContext context) {
    List<String> list = <String>['Profile', 'Manage Account', 'Booking & Trips', 'Sign Out'];
    String dropdownValue = list.first;
    var userCredentialsSingleton = UserCredentialsSingleton();
    String? email = userCredentialsSingleton.getEmail();
    String? username = userCredentialsSingleton.getUsername();
    return DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        // style: const TextStyle(color: Colors.deepPurple),
        underline: Container(),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
          if(value=='Sign Out'){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SigninScreen()),
            );
          }else if(value=='Manage Account'){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ManageAccountScreen()),
            );
          }else if(value=='Booking & Trips'){
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => BookedTripsScreen()),
            );
          }
        },
        items: [
          DropdownMenuItem(value: list[0],child: Column(
            children: [
              Text(
                username!=null?username:'moamen',
                style: TextStyle(
                  // color: Color.fromRGBO(55, 120, 159, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                email!=null?email:'moamen21@gmail.com',
                style: TextStyle(
                  // color: Color.fromRGBO(55, 120, 159, 1),
                    fontSize: 11,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )),
          DropdownMenuItem(value:list[1], child: Text(list[1])),
          DropdownMenuItem(value:list[2], child: Text(list[2])),
          DropdownMenuItem(value:list[3], child: Text(list[3])),
          // DropdownMenuItem(value:list[4], child: Text(list[4])),
        ]

      // list.map<DropdownMenuItem<String>>((String value) {
      //   return DropdownMenuItem<String>(
      //     value: value,
      //     child: Text(value),
      //   );
      // }).toList(),
    );
  }
}