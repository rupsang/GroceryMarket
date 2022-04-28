import 'package:e_commers/Bloc/product/product_bloc.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetails extends StatelessWidget {

  const OrderDetails({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return Container(
     
    );
  }
}