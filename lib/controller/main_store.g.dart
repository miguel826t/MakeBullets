// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainStore on _MainStore, Store {
  final _$dataBaseAtom = Atom(name: '_MainStore.dataBase');

  @override
  Data get dataBase {
    _$dataBaseAtom.reportRead();
    return super.dataBase;
  }

  @override
  set dataBase(Data value) {
    _$dataBaseAtom.reportWrite(value, super.dataBase, () {
      super.dataBase = value;
    });
  }

  final _$perksAtom = Atom(name: '_MainStore.perks');

  @override
  List<Perk> get perks {
    _$perksAtom.reportRead();
    return super.perks;
  }

  @override
  set perks(List<Perk> value) {
    _$perksAtom.reportWrite(value, super.perks, () {
      super.perks = value;
    });
  }

  final _$_MainStoreActionController = ActionController(name: '_MainStore');

  @override
  void setMoney(int money) {
    final _$actionInfo =
        _$_MainStoreActionController.startAction(name: '_MainStore.setMoney');
    try {
      return super.setMoney(money);
    } finally {
      _$_MainStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dataBase: ${dataBase},
perks: ${perks}
    ''';
  }
}
