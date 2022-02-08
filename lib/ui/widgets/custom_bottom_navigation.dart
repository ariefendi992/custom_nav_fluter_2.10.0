import 'package:custom_bottom_navigation/cubit/page_cubit.dart';
import 'package:custom_bottom_navigation/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigation extends StatelessWidget {
  final String iconUrl;
  final int index;

  const CustomBottomNavigation({
    Key? key,
    required this.iconUrl,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<PageCubit>().setPage(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Image.asset(
                iconUrl,
                width: 24,
                height: 24,
                color: context.read<PageCubit>().state == index
                    ? kPrimaryColor
                    : kGreyColor,
              ),
              Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: context.read<PageCubit>().state == index
                      ? kPrimaryColor
                      : kTransparentColor,
                  borderRadius: BorderRadius.circular(18),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
