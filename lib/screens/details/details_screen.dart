
import 'package:category_app2/bloc/details/details_bloc.dart';
import 'package:category_app2/screens/details/details_item.dart';
import 'package:category_app2/screens/retry_again.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details'),
      ),
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          if (state is DetailsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is DetailsSuccess) {
            return DetailsItem(details: state.details!);
          }  else {
            return  Center(
              child: RetryWidget(
                onRetry: ()async {
                  await Future.delayed(Duration(seconds: 2));
                  // Add your retry logic here
                  print('Retry clicked');
                },
              ),
            );
          }
        },
      ),
    );
  }
}
