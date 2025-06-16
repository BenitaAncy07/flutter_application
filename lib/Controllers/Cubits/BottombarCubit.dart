import 'package:flutter_bloc/flutter_bloc.dart';

class BottombarCubit extends Cubit<int> {
  BottombarCubit() : super(0);

  void indexchange(int index) {
    emit(index);
  }
}
