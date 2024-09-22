import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotify_clone/domain/useceses/song/add_or_revome_favorite_song.dart';
import 'package:spotify_clone/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  void favoriteButtonUpdated(String songId) async {
    var result =
        await sl<AddOrRevomeFavoriteSongUseCase>().call(params: songId);

    result.fold((l) {}, (isFavorite) {
      emit(
        FavoriteButtonUpdated(
          isFavorite: isFavorite,
        ),
      );
    });
  }
}
