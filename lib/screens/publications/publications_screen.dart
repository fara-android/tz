import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tz/logic/publications/cubit/publications_cubit.dart';
import 'package:tz/screens/publications/components/custom_image_container.dart';
import 'package:tz/widgets/custom_loading.dart';

class PublicationsScreen extends StatelessWidget {
  PublicationsScreen({Key? key}) : super(key: key);

  final PublicationsCubit publicationsCubit = PublicationsCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => publicationsCubit..getPublications(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<PublicationsCubit, PublicationsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox(),
                  loading: () => const Center(
                    child: CustomLoading(),
                  ),
                  loaded: (publications) => RefreshIndicator(
                    onRefresh: _refreshData,
                    child: ListView.builder(
                      itemCount: publications.length,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return CustomImageContainer(
                          image: publications[index].image,
                          likeCount: publications[index].likeCount,
                        );
                      }),
                    ),
                  ),
                  failed: (error) => Center(
                    child: Text(error),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future _refreshData() async {
    publicationsCubit.getPublications();
    await Future.delayed(
      Duration(seconds: 1),
    );
    
  }
}
