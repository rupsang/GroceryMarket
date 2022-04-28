import 'package:e_commers/Bloc/user/user_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/ui/Views/cart/delivery_street_page.dart';
import 'package:e_commers/ui/widgets/shimmer_custom.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StreetAddressCheckout extends StatelessWidget {

  const StreetAddressCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        color: Colors.white,
        height: 96,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Custom_Text(text: 'Shipping Address', fontSize: 19, fontWeight: FontWeight.w600),
                BlocBuilder<UserBloc, UserState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) 
                  => state.user != null 
                  ? GestureDetector(
                    child: Custom_Text(text: state.user!.address == '' ? 'Add' : 'Change', color: Colors.blue, fontSize: 18 ),
                    onTap: () => Navigator.push(context, routeSlide(page: DeliveryPage())),
                  )
                  : const CustomShimmer()
                ),
              ],
            ),
            const Divider(),
            const SizedBox(height: 5.0),
            BlocBuilder<UserBloc, UserState>(
              builder: (_, state) 
              => state.user != null
                ? state.user!.address == '' 
                  ? const Custom_Text(text: 'Without Street Address', fontSize: 18)
                  : Custom_Text(text: '${state.user!.address}', fontSize: 18)
                : const CustomShimmer()
            )
          ],
        ),
      ),
    );
  }
}