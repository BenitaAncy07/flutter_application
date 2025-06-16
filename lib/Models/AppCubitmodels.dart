class ProfileState {
  final int selectedindex;
  final bool showqualificationcontent,
      showpreferencecontent,
      showavailablecontent,
      availabletowork;

  ProfileState(
    this.selectedindex,
    this.showqualificationcontent,
    this.showpreferencecontent,
    this.showavailablecontent,
    this.availabletowork,
  );
}

class PageState {
  final Map<String, dynamic> page;
  final String internetstatus;
  PageState(this.page, this.internetstatus);
}

