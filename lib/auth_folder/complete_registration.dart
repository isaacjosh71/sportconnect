
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datepicker_dropdown/datepicker_dropdown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sport_connect/auth_folder/choose_sport.dart';
import 'package:sport_connect/navigation_folder/root_page.dart';
import '../helpers/designs.dart';

class CompleteRegistration extends StatefulWidget {
  const CompleteRegistration({Key? key}) : super(key: key);

  @override
  State<CompleteRegistration> createState() => _CompleteRegistrationState();
}
class _CompleteRegistrationState extends State<CompleteRegistration> {

  final TextEditingController _nameController = TextEditingController();
  bool _select1 = true;
  bool _select2 = true;
  bool buttonIsActive = false;
  String _selectedDay = 'DD';
  String _selectedMonth = 'MM';
  String _selectedYear = 'YYYY';
  bool circular = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if (buttonIsActive) {
      _onPressed = () async {
        setState((){
          circular = true;
        });
        //using CRUD system, sending registration data of the current logged in user to the database
        //only username required at the moment
        if(_nameController.text.isNotEmpty){
          FirebaseFirestore.instance.collection('register').doc(auth.currentUser!.uid).collection('this_user').add(
              {'username':_nameController.text,
              }
          );
          setState((){
            circular = false;
          });
          Get.off(const SelectSports());
        }else if(_nameController.text.isEmpty){
          Get.snackbar('Required', 'Username field is required!',
              snackPosition: SnackPosition.BOTTOM,
              icon: const Icon(Icons.warning_amber_rounded)
          );
          setState((){
            circular = false;
          });
        }
      };
    }
    return Scaffold(
      backgroundColor: Designs.scaffoldTheme,
      body: Padding(
        padding: EdgeInsets.only(left: Designs.leftPadding35,
            right: Designs.rightPadding35, top: Designs.topPadding120),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Continue Registration',
                style: TextStyle(
                  color: Designs.blueColor,
                  fontSize: Designs.font23,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text('Please fill in the forms to register',
                style: TextStyle(
                  color: Designs.descriptionColor.withOpacity(0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: Designs.horizontal15,),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Designs.horizontal15,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: _nameController,
                        onChanged: (value) {
                          setState(() {
                            buttonIsActive =
                            value.isNotEmpty ? true : false;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            color: Designs.descriptionColor.withOpacity(0.7),
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(Icons.person, size: 18,
                            color: Designs.blueColor.withOpacity(0.55),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Designs.sizedBox40,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Designs.padding20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: Designs.height50, width:Designs.width100,
                            decoration: BoxDecoration(
                              color: Designs.blueColor.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(Designs.radius15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: Designs.vertical5,
                                  horizontal: Designs.horizontal15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Male',
                                    style: TextStyle(
                                        color: Designs.descriptionColor.withOpacity(0.85),
                                        letterSpacing: 1,
                                        fontSize: 16.5, fontWeight: FontWeight.w500),),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _select1 =!_select1;
                                      });
                                    },
                                    child: Icon(_select1 ? Icons.radio_button_off_rounded
                                        : Icons.radio_button_on_rounded,
                                        size: 17,color: Designs.blueColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: Designs.height50, width:Designs.width120,
                            decoration: BoxDecoration(
                              color: Designs.blueColor.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(Designs.radius15),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: Designs.vertical5
                                  , horizontal: Designs.horizontal15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Female',
                                    style: TextStyle(
                                        color: Designs.descriptionColor.withOpacity(0.85),
                                        letterSpacing: 1,
                                        fontSize: 16.5, fontWeight: FontWeight.w500),),
                                  GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        _select2 =!_select2;
                                      });
                                    },
                                    child: Icon(_select2 ? Icons.radio_button_off_rounded
                                        : Icons.radio_button_on_rounded,
                                        size: 17,color: Designs.blueColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Designs.sizedBox40,
                    ),
                    DropdownDatePicker(
                      icon: Icon(Icons.arrow_drop_down_rounded, size: Designs.sizedBox25,
                        color: Designs.blueColor,),
                      isExpanded: true,
                      isDropdownHideUnderline: false,
                      isFormValidator: true,
                      startYear: 1950,
                      endYear: 2030,
                      width: Designs.radius13,
                      onChangedDay: (String? newValue){
                        setState((){
                          _selectedDay = newValue!;});},
                      onChangedMonth: (String? newValue){
                        setState((){
                          _selectedMonth = newValue!;});},
                      onChangedYear: (String? newValue){
                        setState((){
                          _selectedYear = newValue!;});},
                      hintDay: '$_selectedDay',
                      hintMonth: '$_selectedMonth',
                      hintYear: '$_selectedYear',
                      hintTextStyle:Designs.hintFont,
                      monthFlex: 3,
                      dayFlex: 2,
                      errorDay: 'Please select date',
                      errorMonth: 'Please select month',
                      errorYear: 'Please select year',
                    ),
                    SizedBox(
                      height: Designs.sizedBox50,
                    ),
                    SizedBox(
                      width: Designs.width220, height: Designs.sizedBox45,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(
                              1,),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(Designs.radius13)
                            )),
                            shadowColor: MaterialStateProperty.all<Color>(
                                Colors.blueGrey),
                            backgroundColor: MaterialStateProperty.all(
                                buttonIsActive ? Designs.blueColor : Designs.blueColor.withOpacity(0.2)
                            ),
                          ),
                          onPressed: _onPressed,
                          child: const Text('Register',
                            style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                                fontSize: 17.5),)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;

  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      width: 230,
      decoration: BoxDecoration(
        color: Designs.blueColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 7),
      padding: const EdgeInsets.symmetric(
        horizontal: 15, vertical: 2,
      ),
      child: child,
    );
  }
}
