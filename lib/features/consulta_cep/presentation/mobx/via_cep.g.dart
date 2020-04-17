// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'via_cep.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ViaCepStore on ViaCepStoreBase, Store {
  final _$inputCepAtom = Atom(name: 'ViaCepStoreBase.inputCep');

  @override
  String get inputCep {
    _$inputCepAtom.context.enforceReadPolicy(_$inputCepAtom);
    _$inputCepAtom.reportObserved();
    return super.inputCep;
  }

  @override
  set inputCep(String value) {
    _$inputCepAtom.context.conditionallyRunInAction(() {
      super.inputCep = value;
      _$inputCepAtom.reportChanged();
    }, _$inputCepAtom, name: '${_$inputCepAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: 'ViaCepStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$viaCepAtom = Atom(name: 'ViaCepStoreBase.viaCep');

  @override
  ViaCep get viaCep {
    _$viaCepAtom.context.enforceReadPolicy(_$viaCepAtom);
    _$viaCepAtom.reportObserved();
    return super.viaCep;
  }

  @override
  set viaCep(ViaCep value) {
    _$viaCepAtom.context.conditionallyRunInAction(() {
      super.viaCep = value;
      _$viaCepAtom.reportChanged();
    }, _$viaCepAtom, name: '${_$viaCepAtom.name}_set');
  }

  final _$ViaCepStoreBaseActionController =
      ActionController(name: 'ViaCepStoreBase');

  @override
  void setText(String newState) {
    final _$actionInfo = _$ViaCepStoreBaseActionController.startAction();
    try {
      return super.setText(newState);
    } finally {
      _$ViaCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool newState) {
    final _$actionInfo = _$ViaCepStoreBaseActionController.startAction();
    try {
      return super.setLoading(newState);
    } finally {
      _$ViaCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCep(ViaCep newState) {
    final _$actionInfo = _$ViaCepStoreBaseActionController.startAction();
    try {
      return super.setCep(newState);
    } finally {
      _$ViaCepStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'inputCep: ${inputCep.toString()},loading: ${loading.toString()},viaCep: ${viaCep.toString()}';
    return '{$string}';
  }
}
