abstract class HomePageState {}

class BottomNavBarState extends HomePageState {
  int SelectedIndex;
  BottomNavBarState({this.SelectedIndex = 0});
}

class InitialPageState extends HomePageState {
  final String SelectedTab;

  InitialPageState({
    this.SelectedTab = 'all',
  });
}

class BottomTabBarState extends HomePageState {
  final String SelectedTab;
  BottomTabBarState({this.SelectedTab = ''});
}

class CarouselSliderState extends HomePageState {
  final int changedIndex;
  CarouselSliderState({this.changedIndex = 0});
}

class SliverTabSliderState extends HomePageState {
  final int changedIndex;
  SliverTabSliderState({this.changedIndex = 0});
}
