import 'package:flutter_application/Models/AppCubitmodels.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilesettingCubit extends Cubit<ProfileState> {
  ProfilesettingCubit() : super(ProfileState(0, false, false, false, false));

  void indexchange(int index) {
    emit(
      ProfileState(
        index,
        state.showqualificationcontent,
        state.showpreferencecontent,
        state.showavailablecontent,
        state.availabletowork,
      ),
    );
  }

  void showqualification(bool value) {
    emit(
      ProfileState(
        state.selectedindex,
        value,
        state.showpreferencecontent,
        state.showavailablecontent,
        state.availabletowork,
      ),
    );
  }

  void showjobpreference(bool value) {
    emit(
      ProfileState(
        state.selectedindex,
        state.showqualificationcontent,
        value,
        state.showavailablecontent,
        state.availabletowork,
      ),
    );
  }

  void showavailable(bool value) {
    emit(
      ProfileState(
        state.selectedindex,
        state.showqualificationcontent,
        state.showpreferencecontent,
        value,
        state.availabletowork,
      ),
    );
  }

  void availablecheck(bool value) {
    emit(
      ProfileState(
        state.selectedindex,
        state.showqualificationcontent,
        state.showpreferencecontent,
        state.showavailablecontent,
        value,
      ),
    );
  }
}
