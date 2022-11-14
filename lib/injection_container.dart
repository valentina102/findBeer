import 'package:find_beer/features/login/presentation/bloc/login_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  //Cubit
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(),
  );
//
//   //Use Case
//   sl.registerFactory<LoginUseCase>(
//         () => LoginUseCase(
//       loginRepository: sl(),
//     ),
//   );
//
// // Repositories
//   sl.registerFactory<LoginRepository>(
//         () => LoginRepositoryImpl(
//       loginDataSource: sl(),
//     ),
//   );
//
//
// //Data Sources
//
//   sl.registerFactory<LoginDataSource>(
//         () => LoginDataSourceImpl(),
//   );
//
}
