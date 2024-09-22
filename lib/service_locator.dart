import 'package:get_it/get_it.dart';

import 'data/repositories/auth/auth_repository_impl.dart';
import 'data/repositories/song/song_repository_impl.dart';
import 'data/sources/auth/auth_firebase_service.dart';
import 'data/sources/song/song_firebase_service.dart';
import 'domain/repositories/auth/auth.dart';
import 'domain/repositories/song/song.dart';
import 'domain/useceses/auth/signin.dart';
import 'domain/useceses/auth/signup.dart';
import 'domain/useceses/song/get_news_songs.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

//Firebase service related
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());


// data & domains related
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());


// use cases related
  sl.registerSingleton<SignupUseCase>(SignupUseCase());

  sl.registerSingleton<SignInUseCase>(SignInUseCase());

  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
}