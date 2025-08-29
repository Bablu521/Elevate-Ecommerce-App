import 'package:elevate_ecommerce_app/generated/l10n.dart';
import 'package:elevate_ecommerce_app/presentation/home/view_models/home_states.dart';
import 'package:elevate_ecommerce_app/presentation/home/view_models/home_view_model.dart';
import 'package:elevate_ecommerce_app/presentation/home/views/widgets/Category_item.dart';
import 'package:elevate_ecommerce_app/presentation/home/views/widgets/occasion_item.dart';
import 'package:elevate_ecommerce_app/presentation/home/views/widgets/proudect_item.dart';
import 'package:elevate_ecommerce_app/presentation/home/views/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/di/di.dart';
import '../view_models/home_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeViewModel>()..doIntent(OnLoadHomeListEvent()),

      child: Scaffold(
        backgroundColor: AppColors.white,

        body: BlocBuilder<HomeViewModel,HomeStates>(
          builder: (context, state) {
          return
          SingleChildScrollView(
            padding: const EdgeInsets.only(left:10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      Text(
                        "🌸 Flowery",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child:
                        TextField(
                          decoration: InputDecoration(

                            hintText: AppLocalizations.of(context).search,
                            prefixIcon: Icon(Icons.search,color: AppColors.gray.withAlpha(120),),
                            filled: true,
                            fillColor: AppColors.white,
                            contentPadding: const EdgeInsets.symmetric(vertical: 1),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),

                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:  BorderSide(color: AppColors.gray),
                          ),
                        ),
                            ) ),
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                // Location
                Row(
                  children:  [
                    Icon(Icons.location_on_outlined, color:AppColors.gray),
                    SizedBox(width: 3),
                    Text(
                      AppLocalizations.of(context).delivertosheikhzayed,
                      style: TextStyle(color:AppColors.black),
                    ),
                    Icon(Icons.keyboard_arrow_down, color: AppColors.mainColor,size: 30,)

                  ],
                ),
                const SizedBox(height: 16),

                // Categories
                SectionHeader(title: AppLocalizations.of(context).categories,onTap: (){},),
               const  SizedBox(height: 16,),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.categoriesListSuccess.length,
                    itemBuilder: (context,index){
                      final categories = state.categoriesListSuccess[index];
                      return CategoryItem(image: categories.image ?? "", label: categories.name??"");
                    },

                  ),
                ),

                const SizedBox(height: 16),

                // Best Seller
                SectionHeader(title: AppLocalizations.of(context).bestseller,onTap: (){}),
                SizedBox(height: 16,),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.bestSellerListSuccess.length,
                    itemBuilder: (context,index){
                      final categories = state.bestSellerListSuccess[index]; //
                      return  ProductItem(
                        imageUrl:categories.imgCover??"",
                        title: categories.title??"",
                        price: "${categories.price}" ?? "" ,
                      );
                    },
                  ),
                ),

                const SizedBox(height: 24),

                // Occasion
                SectionHeader(title: AppLocalizations.of(context).occasion,onTap: (){},),
                SizedBox(height: 16,),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      final occasion= state.occasionListSuccess[index];
                      return OccasionItem(
                          imageUrl:occasion.image??"",
                          label: occasion.name??"" );
                    },
                    itemCount: state.occasionListSuccess.length,

                  ),
                ),
              ],
            ),
          );},
        ),
      ),
    );
  }
}








