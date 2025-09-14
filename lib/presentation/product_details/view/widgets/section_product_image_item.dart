import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:elevate_ecommerce_app/core/constants/app_colors.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/view_model/product_details_event.dart';
import 'package:elevate_ecommerce_app/presentation/product_details/view_model/product_details_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SectionProductImageItem extends StatefulWidget {
  const SectionProductImageItem({super.key, required this.items});
  final List<String> items;
  @override
  State<SectionProductImageItem> createState() =>
      _SectionProductImageItemState();
}

class _SectionProductImageItemState extends State<SectionProductImageItem> {
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();
  final PageController pageController = PageController();
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return BlocBuilder<
      ProductDetailsViewModelCubit,
      ProductDetailsViewModelState
    >(
      builder: (context, state) {
        return SizedBox(
          height: mediaQueryHeight * 0.45,
          child: Stack(
            children: [
              CarouselSlider(
                carouselController: carouselSliderController,
                items: List.generate(
                  widget.items.length,
                  (index) => CachedNetworkImage(
                    imageUrl: widget.items[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
                options: CarouselOptions(
                  height: mediaQueryHeight * 0.45,
                  aspectRatio: 1,
                  viewportFraction: 1.0,
                  initialPage: currentImage,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    currentImage = index;
                    context.read<ProductDetailsViewModelCubit>().doIntent(
                      ProductDetailsUpdateImageCover(currentIndex: index),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 18,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios_new),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  AnimatedSmoothIndicator(
                    activeIndex: currentImage,
                    count: widget.items.length,
                    effect: SlideEffect(
                      spacing: 8.0,
                      radius: 4.0,
                      dotWidth: 10,
                      dotHeight: 10,
                      dotColor: AppColors.white[70]!,
                      activeDotColor: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
