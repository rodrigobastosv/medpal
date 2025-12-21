import 'package:bloc/bloc.dart';
import 'package:medpal/features/auth/domain/entities/user.dart';
import 'package:medpal/features/auth/domain/use_cases/get_user_use_case.dart';
import 'package:medpal/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required GetUserUseCase getUserUseCase}) : super(HomeState.initial(user: getUserUseCase() as AuthenticatedUser));
}
