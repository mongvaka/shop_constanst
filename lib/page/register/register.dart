
import 'package:flutter/material.dart';
import 'package:shop_constanst/page/login/login.dart';
import 'package:shop_constanst/page/register/register_model.dart';
import 'package:shop_constanst/page/register/register_service.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../shared/constanst/enum.dart';
import '../../widget/button/m_button.dart';
import '../../widget/input/m_input.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    RegisterModel model = RegisterModel();
    RegisterService service = RegisterService();
    return Scaffold(
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 450),

              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Form(
                            key: formKey,
                            child: Column(
                              children: [
                                MInput(
                                  controller: model.cUser,
                                  hintText: 'USER_NAME',
                                  mandatory: true,
                                  prefixIcon: FontAwesomeIcons.user,
                                  key: const Key('USER_NAME'), onChange: (value){

                                } ,
                                ),
                                MInput(
                                  controller: model.cPassword,
                                  hintText: 'PASSWORD',
                                  mandatory: true,
                                  prefixIcon: FontAwesomeIcons.lock,
                                  key: const Key('PASSWORD'),
                                  onChange: (){
                                  } ,
                                ),
                                MInput(
                                  controller: model.cConfirmPassword,
                                  hintText: 'CONFIRM_PASSWORD',
                                  mandatory: true,
                                  prefixIcon: FontAwesomeIcons.lock,
                                  key: const Key('CONFIRM_PASSWORD'),
                                  onChange: (){
                                  } ,
                                ),
                                MButton(onPress: (){

                                }, text: 'REGISTER'.tr(),
                                  type: ButtonType.positive,
                                ),
                                const SizedBox(height: 20,),
                                Row(
                                    children: <Widget>[
                                      Expanded(
                                        child:  Container(
                                            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                                            child:const Divider(
                                              color: Colors.grey,
                                              height: 36,
                                            )),
                                      ),
                                      Text("OR".tr(),style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.w900),),
                                      Expanded(
                                        child:  Container(
                                            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                                            child: const Divider(
                                              color: Colors.grey,
                                              height: 36,
                                            )),
                                      ),
                                    ]
                                ),
                                // const SizedBox(height: 10,),
                                // Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: <Widget>[
                                //
                                //       MButtonLogo(onPress: (){}, icon: FontAwesomeIcons.facebookF,color: Colors.indigoAccent),
                                //       MButtonLogo(onPress: (){}, icon: FontAwesomeIcons.google,color: Colors.blue),
                                //       MButtonLogo(onPress: (){}, icon: FontAwesomeIcons.twitter,color: Colors.blue),
                                //       MButtonLogo(onPress: (){}, icon: FontAwesomeIcons.line,color: Colors.green),
                                //
                                //     ]
                                // ),
                                const SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                                    child: Text('READY_EXIST'.tr(),style: const TextStyle(fontSize: 12,color: Colors.grey),)),
                                    GestureDetector(
                                      onTap: () {
                                        MaterialPageRoute materialPageRoute = MaterialPageRoute(
                                          builder: (context) => Login(),
                                        );
                                        Navigator.of(context).push(materialPageRoute);

                                      },
                                      child:  Text('LOGIN'.tr(),style: const TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w900),)
                                    )
                                  ],
                                ),

                              ],

                            )),
                      ]),
                ),
              ),
            ),
          ),
        ));

  }
}