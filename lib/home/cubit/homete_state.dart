part of 'homete_cubit.dart';

enum HometeStatus { loading, success, error }

class HometeState {
  HometeState({
    this.status = HometeStatus.loading,
    this.gifs = const <GifModel>[],
  });

  final List<GifModel> gifs;
  final HometeStatus status;

  HometeState copyWith({
    HometeStatus? status,
    List<GifModel>? gifs,
  }) {
    return HometeState(status: status ?? this.status, gifs: gifs ?? this.gifs);
  }
}
