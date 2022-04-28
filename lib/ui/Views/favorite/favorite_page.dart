import 'package:e_commers/Bloc/product/product_bloc.dart';
import 'package:e_commers/Helpers/helpers.dart';
import 'package:e_commers/Models/Response/response_products_home.dart';
import 'package:e_commers/service/product_services.dart';
import 'package:e_commers/ui/Views/favorite/widgets/list_favorite.dart';
import 'package:e_commers/ui/widgets/shimmer_custom.dart';
import 'package:e_commers/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  @override
  Widget build(BuildContext context) {

    final size =  MediaQuery.of(context).size;

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state){
        if( state is LoadingProductState ){
          modalLoadingShort(context);
        }else if( state is FailureProductState ){
          Navigator.pop(context);
          errorMessageSnack(context, state.error);
        }else if( state is SuccessProductState ){
          Navigator.pop(context);
          setState(() {});
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffF5F5F5),
        appBar: AppBar(
          title: const Custom_Text(text: 'Favorites', color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500 ),
          centerTitle: true,
          backgroundColor: Color(0xfff2f2f2),
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: Stack(
          children: [
    
            FutureBuilder<List<ListProducts>>(
              future: productServices.allFavoriteProducts(),
              builder: (context, snapshot)
              => !snapshot.hasData
              ? Column(
                  children: const [
                    CustomShimmer(),
                    SizedBox(height: 10.0),
                    CustomShimmer(),
                    SizedBox(height: 10.0),
                    CustomShimmer(),
                  ],
                )
              : ListFavoriteProduct(products: snapshot.data! )
            ),
            
            Positioned(
              bottom: 20,
              child: Container(
                width: size.width,
                child: Align(
                  child: BottomNavigation(index: 2)
                )
              ),
            ),
    
            
          ],
        ),
       ),
    );
  }
}



