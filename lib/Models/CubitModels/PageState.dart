class PageState {
  final Map<String, dynamic> page;
  final String internetstatus;
  PageState(this.page, this.internetstatus);
}

class LoginState {
  String person, loginid;
  List<bool> value;
  LoginState(this.value, this.person, this.loginid);
}

class ProfileState {
  final int selectedindex;
  final bool showqualificationcontent,
      showpreferencecontent,
      showavailablecontent;

  ProfileState(
    this.selectedindex,
    this.showqualificationcontent,
    this.showpreferencecontent,
    this.showavailablecontent,
  );
}
