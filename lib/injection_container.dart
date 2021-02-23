import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:meu_cep/core/network/network_info.dart';
import 'package:meu_cep/features/consulta_cep/data/datasources/via_cep_remote_datasource.dart';
import 'package:meu_cep/features/consulta_cep/data/repositores/via_cep_repository_impl.dart';
import 'package:meu_cep/features/consulta_cep/domain/repositores/via_cep_repository.dart';
import 'package:meu_cep/features/consulta_cep/domain/usecases/get_via_cep.dart';
import 'package:meu_cep/features/consulta_cep/presentation/mobx/via_cep.dart';

final sl = GetIt.instance;

void init() {
  _initFeatures();

  _initCore();

  _initExternal();
}

void _initFeatures() {
  //use mobx
  sl.registerFactory(() => ViaCepStore(getViaCep: sl()));

  //use Case
  sl.registerLazySingleton(() => GetViaCep(sl()));

  // repository
  sl.registerLazySingleton<ViaCepRepository>(() => ViaCepRepositoryImpl(
        viaCepRemoteDatasource: sl(),
        networkInfo: sl(),
      ));

  // Data Source
  sl.registerLazySingleton<ViaCepDataSource>(
      () => ViaCepRemoteDataSourceImpl(client: sl()));
}

void _initCore() {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
}

void _initExternal() {
  sl.registerLazySingleton(() => http.Client());
}
