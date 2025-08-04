import 'package:flutter_bloc/flutter_bloc.dart';

class MyjobCubit extends Cubit<int> {
  MyjobCubit() : super(0);

  void indexchange(int index) {
    emit(index);
  }
}
