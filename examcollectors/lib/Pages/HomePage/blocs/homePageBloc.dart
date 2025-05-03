import 'package:bloc/bloc.dart';

import 'homePageEvent.dart';
import 'homePageState.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(InitialPageState()) {
    on<BottomNavBarEvent>(bottomNavBarEvent);
    on<BottomTabBarEvent>(bottomTabBarEvent);
    on<CarouselSliderEvent>(carouselSliderEvent);
    on<SliverTabSliderEvent>(sliverTabSliderEvent);
  }

  //they are Event handler

  void bottomNavBarEvent(BottomNavBarEvent event, Emitter emit) {
    emit(BottomNavBarState(SelectedIndex: event.SelectedIndex));
  }

  void carouselSliderEvent(CarouselSliderEvent event, Emitter emit) {
    emit(CarouselSliderState(changedIndex: event.changedIndex));
  }

  void sliverTabSliderEvent(SliverTabSliderEvent event, Emitter emit) {
    emit(SliverTabSliderState(changedIndex: event.changedIndex));
  }

  void bottomTabBarEvent(
    BottomTabBarEvent event,
    Emitter emit,
  ) {
    emit(BottomTabBarState(SelectedTab: event.SelectedTab));
  }
}
