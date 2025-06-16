import 'package:flutter_application/Models/AppCubitmodels.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageState({"page": "introScreen"}, "offline"));

  void nextPage(String newPage) {
    emit(PageState({"page": newPage}, state.internetstatus));
  }

  void internetcheck(String value) {
    emit(PageState(state.page, value));
  }
}
