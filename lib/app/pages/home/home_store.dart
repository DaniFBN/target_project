import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeBase with _$HomeStore;

abstract class HomeBase with Store {
  HomeBase()
      : state = [],
        editingIndex = null;

  @observable
  List<String> state;

  @computed
  bool get isEditing => editingIndex != null;

  @observable
  int? editingIndex;

  @action
  void save(String value) {
    if (value.isEmpty) return;

    state = [...state, value];
  }

  @action
  void edit(String newValue) {
    final index = editingIndex;
    if (newValue.isEmpty || index == null) return;

    final newState = [
      ...state,
    ];

    newState[index] = newValue;
    state = newState;

    editingIndex = null;
  }

  @action
  void delete(int index) {
    final newState = [...state];
    newState.removeAt(index);

    state = newState;
  }

  @action
  void toEdit(int index) {
    editingIndex = index;
  }
}
