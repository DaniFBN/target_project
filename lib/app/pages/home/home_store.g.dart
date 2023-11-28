// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeBase, Store {
  Computed<bool>? _$isEditingComputed;

  @override
  bool get isEditing => (_$isEditingComputed ??=
          Computed<bool>(() => super.isEditing, name: 'HomeBase.isEditing'))
      .value;

  late final _$stateAtom = Atom(name: 'HomeBase.state', context: context);

  @override
  List<String> get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(List<String> value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$editingIndexAtom =
      Atom(name: 'HomeBase.editingIndex', context: context);

  @override
  int? get editingIndex {
    _$editingIndexAtom.reportRead();
    return super.editingIndex;
  }

  @override
  set editingIndex(int? value) {
    _$editingIndexAtom.reportWrite(value, super.editingIndex, () {
      super.editingIndex = value;
    });
  }

  late final _$HomeBaseActionController =
      ActionController(name: 'HomeBase', context: context);

  @override
  void save(String value) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.save');
    try {
      return super.save(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void edit(String newValue) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.edit');
    try {
      return super.edit(newValue);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void delete(int index) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.delete');
    try {
      return super.delete(index);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toEdit(int index) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.toEdit');
    try {
      return super.toEdit(index);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
editingIndex: ${editingIndex},
isEditing: ${isEditing}
    ''';
  }
}
