import 'package:bloc_hey_gonza/home/cubit/homete_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gif_repository/gif_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HometeCubit(context.read<GifRepository>())..getData(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola Kyary '),
      ),
      body: BlocBuilder<HometeCubit, HometeState>(
        builder: (context, state) {
          switch (state.status) {
            case HometeStatus.loading:
              return const CircularProgressIndicator();
            case HometeStatus.success:
              return GridView.count(
                crossAxisCount: 2,
                children: state.gifs
                    .map((gif) => Image.network(
                          gif.url,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
              );
            case HometeStatus.error:
              return const Center(
                child: Text(
                  'Error',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              );
          }
        },
      ),
    );
  }
}
