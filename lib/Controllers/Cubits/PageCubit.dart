import 'package:flutter_application/Controllers/Constants/Appconstants.dart';
import 'package:flutter_application/Models/CubitModels/PageState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit() : super(PageState({pagetext: introScreen}, onlinetext));

  void nextPage(String newPage) {
    emit(PageState({pagetext: newPage}, state.internetstatus));
  }

  void internetcheck(String value) {
    emit(PageState(state.page, value));
  }
}
