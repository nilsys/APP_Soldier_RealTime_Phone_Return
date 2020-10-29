class Unit {
  String code;
  Unit({this.code});
}
class UnitCode {
  Unit _unit;
  Unit get unitGet => _unit;
  set unitSet(Unit unit) {
    _unit = unit;
  }
}
