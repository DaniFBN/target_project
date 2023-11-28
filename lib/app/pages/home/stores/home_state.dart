class HomeState {
  final List<String> data;
  final int? editingIndex;

  const HomeState({
    required this.data,
    this.editingIndex,
  });

  factory HomeState.initState() {
    return const HomeState(data: []);
  }

  HomeState clearEditing() {
    return HomeState(data: data, editingIndex: null);
  }

  HomeState copyWith({
    List<String>? data,
    int? editingIndex,
  }) {
    return HomeState(
      data: data ?? this.data,
      editingIndex: editingIndex ?? this.editingIndex,
    );
  }
}
