// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TimerController on _TimerControllerBase, Store {
  final _$isActivedAtom = Atom(name: '_TimerControllerBase.isActived');

  @override
  bool get isActived {
    _$isActivedAtom.reportRead();
    return super.isActived;
  }

  @override
  set isActived(bool value) {
    _$isActivedAtom.reportWrite(value, super.isActived, () {
      super.isActived = value;
    });
  }

  final _$timeAtom = Atom(name: '_TimerControllerBase.time');

  @override
  String get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(String value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  final _$minuteAtom = Atom(name: '_TimerControllerBase.minute');

  @override
  int get minute {
    _$minuteAtom.reportRead();
    return super.minute;
  }

  @override
  set minute(int value) {
    _$minuteAtom.reportWrite(value, super.minute, () {
      super.minute = value;
    });
  }

  final _$secondAtom = Atom(name: '_TimerControllerBase.second');

  @override
  int get second {
    _$secondAtom.reportRead();
    return super.second;
  }

  @override
  set second(int value) {
    _$secondAtom.reportWrite(value, super.second, () {
      super.second = value;
    });
  }

  final _$miliAtom = Atom(name: '_TimerControllerBase.mili');

  @override
  int get mili {
    _$miliAtom.reportRead();
    return super.mili;
  }

  @override
  set mili(int value) {
    _$miliAtom.reportWrite(value, super.mili, () {
      super.mili = value;
    });
  }

  final _$stopAtom = Atom(name: '_TimerControllerBase.stop');

  @override
  bool get stop {
    _$stopAtom.reportRead();
    return super.stop;
  }

  @override
  set stop(bool value) {
    _$stopAtom.reportWrite(value, super.stop, () {
      super.stop = value;
    });
  }

  final _$startAsyncAction = AsyncAction('_TimerControllerBase.start');

  @override
  Future<void> start() {
    return _$startAsyncAction.run(() => super.start());
  }

  final _$_TimerControllerBaseActionController =
      ActionController(name: '_TimerControllerBase');

  @override
  void save() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.save');
    try {
      return super.save();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isActived: ${isActived},
time: ${time},
minute: ${minute},
second: ${second},
mili: ${mili},
stop: ${stop}
    ''';
  }
}
