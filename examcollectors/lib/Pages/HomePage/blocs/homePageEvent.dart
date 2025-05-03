abstract class HomePageEvent {}

class BottomNavBarEvent extends HomePageEvent {
  int SelectedIndex;
  BottomNavBarEvent({required this.SelectedIndex});
}

class BottomTabBarEvent extends HomePageEvent {
  final String SelectedTab;
  BottomTabBarEvent({required this.SelectedTab});
}

class CarouselSliderEvent extends HomePageEvent {
  final int changedIndex;
  CarouselSliderEvent({required this.changedIndex});
}

class SliverTabSliderEvent extends HomePageEvent {
  final int changedIndex;
  SliverTabSliderEvent({required this.changedIndex});
}
