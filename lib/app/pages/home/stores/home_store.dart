import 'package:mobx/mobx.dart';

import '../../../core/shared/services/local_storage/i_local_storage_service.dart';
import 'home_state.dart';

part 'home_store.g.dart';

class HomeStore = HomeBase with _$HomeStore;

abstract class HomeBase with Store {
  final ILocalStorageService _localStorage;

  HomeBase(
    this._localStorage,
  ) : state = HomeState.initState();

  @observable
  HomeState state;

  @computed
  bool get isEditing => state.editingIndex != null;

  @action
  Future<void> load() async {
    final data = await _localStorage.get('texts');
    state = HomeState(data: data);
  }

  @action
  Future<void> save(String value) async {
    if (value.isEmpty) return;

    final newData = [...state.data, value];
    await _localStorage.save('texts', newData);
    state = state.copyWith(data: newData);
  }

  @action
  Future<void> edit(String newValue) async {
    final index = state.editingIndex;
    if (newValue.isEmpty || index == null) return;

    state.data[index] = newValue;
    await _localStorage.save('texts', state.data);

    state = state.clearEditing();
  }

  @action
  void delete(int index) {
    state.data.removeAt(index);

    state = state.copyWith();
  }

  @action
  void toEdit(int index) {
    state = state.copyWith(editingIndex: index);
  }
}
