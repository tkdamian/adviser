import 'package:adviser/domain/repositories/advice_repository.dart';
import 'package:adviser/domain/usecases/advice_usecase.dart';
import 'package:adviser/infrastructure/datasources/advice_remote_datasource.dart';
import 'package:adviser/infrastructure/repositories/advice_repository_impl.dart';
import 'package:adviser/presentation/application/bloc/advice_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; // sl == service Locator

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => AdviceBloc(usecase: sl()));

  // Usecases
  sl.registerLazySingleton(() => AdviceUsecase(adviceRepository: sl()));

  // Repositories
  sl.registerLazySingleton<AdviceRepository>(
      () => AdviceRepositoryImpl(adviceRemoteDatasource: sl()));

  // Datasource
  sl.registerLazySingleton<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

  // Extern
  sl.registerLazySingleton(() => http.Client());
}
