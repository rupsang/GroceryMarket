// import 'package:email_validator/email_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:e_commers/constants.dart';
// import 'package:e_commers/Screens2/login_signup/signup_screen.dart';
// import 'package:e_commers/Screens2/Home/home_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// // now it is responsive
// //now we make our app home screen
// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Size _size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: kWhiteColor,
//       body: SafeArea(
//         child: SizedBox(
//           width: double.infinity,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 40),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Image.asset("assets/images/logo.png"),
//                   ),
//                   const Text(
//                     "Grocery Market",
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w900,
//                         color: kPrimaryColor),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   const Text(
//                     "Log in",
//                     style: TextStyle(
//                       fontSize: 36,
//                       fontWeight: FontWeight.bold,
//                       color: kPrimaryColor,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 30,
//                   ),
//                   const TextFields(),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Don't have an account ?",
//                         style: TextStyle(
//                           color: kTextGrayColor,
//                           fontSize: 18,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 10,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const SignUpScreen()));
//                         },
//                         child: const Text(
//                           "Sign Up",
//                           style: TextStyle(
//                               color: kPrimaryColor,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 20),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: _size.height * 0.1,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class TextFields extends StatefulWidget {
//   const TextFields({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<TextFields> createState() => _TextFieldsState();
// }

// class _TextFieldsState extends State<TextFields> {
//   final _formKey = GlobalKey<FormState>();
//   var emailTextController = TextEditingController();
//   var passwordTextController = TextEditingController();
//   bool isvisible = true;
//   @override
//   Widget build(BuildContext context) {
//  child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title: const TextFrave(text: 'Add New Product', fontSize: 20, fontWeight: FontWeight.bold ),
//           elevation: 0,
//           centerTitle: true,
//           leading: IconButton(
//             splashRadius: 20,
//             onPressed: () => Navigator.pop(context),
//             icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 if(_keyForm.currentState!.validate()){
    
//                   productBloc.add( OnSaveNewProductEvent(
//                     _nameProductController.text.trim(), 
//                     _descriptionProductController.text.trim(), 
//                     _stockController.text.trim(), 
//                     _priceController.text.trim(), 
//                     categoryBloc.state.uidCategory.toString(), 
//                     productBloc.state.pathImage!
//                   ));
    
//                 }
//               }, 
//               child: const TextFrave(text: 'Save', color: ColorsFrave.primaryColorFrave, fontWeight: FontWeight.w500 )
//             )
//           ],
//         ),
//         body: Form(
//           key: _keyForm,
//           child: ListView(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//             children: [
        
//               InkWell(
//                 onTap: () => modalSelectPicture(
//                   context: context,
//                   onPressedImage: () async {
//                     Navigator.pop(context);
//                     AccessPermission().permissionAccessGalleryOrCameraForProduct(
//                       await Permission.storage.request(),
//                       context,
//                       ImageSource.gallery
//                     );
//                   },
//                   onPressedPhoto: () async {
//                     Navigator.pop(context);
//                     AccessPermission().permissionAccessGalleryOrCameraForProduct(
//                       await Permission.camera.request(),
//                       context,
//                       ImageSource.camera
//                     );
//                   },
//                 ),
//                 child: BlocBuilder<ProductBloc, ProductState>(
//                   builder: (_, state) 
//                     => state.pathImage != null
//                     ? Container(
//                         height: 190,
//                         width: size.width,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(12.0),
//                           image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image: FileImage(File(state.pathImage!))
//                           )
//                         ),
//                     )
//                     : Container(
//                         height: 190,
//                         width: size.width,
//                         decoration: BoxDecoration(
//                           color: Color(0xfff3f3f3),
//                           borderRadius: BorderRadius.circular(12.0)
//                         ),
//                         child: const Icon(Icons.wallpaper_rounded, size: 80),
//                     ),
//                 ),
//               ),
        
//               const SizedBox(height: 20.0),
//               TextFormFrave(
//                 controller: _nameProductController, 
//                 prefixIcon: const Icon(Icons.add),
//                 hintText: 'Name Product',
//                 validator: RequiredValidator(errorText: 'name is required'),
//               ),
        
//               const SizedBox(height: 20.0),
//               TextFormFrave(
//                 controller: _descriptionProductController, 
//                 prefixIcon: const Icon(Icons.add),
//                 hintText: 'Description Product',
//                 validator: RequiredValidator(errorText: 'Description is required'),
//               ),
        
//               const SizedBox(height: 20.0),
//               TextFormFrave(
//                 controller: _stockController, 
//                 prefixIcon: const Icon(Icons.add),
//                 hintText: 'Stock',
//                 keyboardType: TextInputType.number,
//                 validator: RequiredValidator(errorText: 'Stock is required'),
//               ),
        
//               const SizedBox(height: 20.0),
//               TextFormFrave(
//                 controller: _priceController, 
//                 prefixIcon: const Icon(Icons.add),
//                 hintText: 'Price',
//                 keyboardType: TextInputType.number,
//                 validator: RequiredValidator(errorText: 'Price is required'),
//               ),
        
//               const SizedBox(height: 20.0),
//               InkWell(
//                 onTap: () => modalCategoies(context, size),
//                 borderRadius: BorderRadius.circular(10.0),
//                 child: Container(
//                   alignment: Alignment.centerLeft,
//                   padding: const EdgeInsets.only(left: 20.0),
//                   height: 50,
//                   width: size.width,
//                   decoration: BoxDecoration(
//                     color: Color(0xfff3f3f3),
//                     borderRadius: BorderRadius.circular(10.0)
//                   ),
//                   child: BlocBuilder<CategoryBloc, CategoryState>(
//                     builder: (_, state) 
//                     => state.uidCategory != null
//                     ? TextFrave(text: state.nameCategory!, color: Colors.black54)
//                     : TextFrave(text: 'Select Category', color: Colors.black54)
//                   )
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//   }
// }
