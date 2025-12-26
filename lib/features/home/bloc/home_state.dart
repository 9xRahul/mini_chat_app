class HomeState {
  final int selectedTab;
  const HomeState({required this.selectedTab});

  HomeState copyWith({int? selectedTab}) {
    return HomeState(selectedTab: selectedTab ?? this.selectedTab);
  }
}
