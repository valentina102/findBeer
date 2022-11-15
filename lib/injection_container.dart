import 'package:find_beer/features/bottom_navigation/presentation/bloc/bottom_navigation_cubit.dart';
import 'package:find_beer/features/home/presentation/bloc/home_cubit.dart';
import 'package:find_beer/features/login/presentation/bloc/login_cubit.dart';
import 'package:find_beer/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:find_beer/features/qr/presentation/bloc/qr_cubit.dart';
import 'package:find_beer/features/scanner/presentation/bloc/scanner_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  //Cubit
  sl.registerFactory<LoginCubit>(
    () => LoginCubit(),
  );
  sl.registerFactory<BottomNavigationCubit>(
    () => BottomNavigationCubit(),
  );
  sl.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
  sl.registerFactory<ProfileCubit>(
    () => ProfileCubit(),
  );
  sl.registerFactory<QrCubit>(
    () => QrCubit(),
  );
  sl.registerFactory<ScannerCubit>(
    () => ScannerCubit(),
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
