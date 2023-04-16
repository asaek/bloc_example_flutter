import 'package:bloc/bloc.dart';
import 'package:gif_repository/gif_repository.dart';

part 'homete_state.dart';

class HometeCubit extends Cubit<HometeState> {
  HometeCubit(this.gifRepository) : super(HometeState());
  final GifRepository gifRepository;

  Future getData() async {
    try {
      final gitUrls = await gifRepository.getUrls();
      emit(
        state.copyWith(status: HometeStatus.success, gifs: gitUrls),
      );
    } catch (_) {
      emit(state.copyWith(status: HometeStatus.error));
    }
  }
}
