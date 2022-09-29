// Remove todos valores "null" de List ou Map
// A função precisa ser recursiva para considerar "nested values"
// Todo: _value.isNotEmpty
dynamic removeNull(dynamic params) {
  if (params is Map) {
    final Map<dynamic, dynamic> map = <dynamic, dynamic>{};
    params.forEach((dynamic key, dynamic value) {
      final dynamic _value = removeNull(value);
      if (_value != null) {
        map[key] = _value;
      }
    });
    if (map.isNotEmpty) {
      return map;
    }
  } else if (params is List) {
    final dynamic list = <dynamic>[];
    for (final dynamic value in params) {
      final dynamic _value = removeNull(value);
      if (_value != null) {
        list.add(_value);
      }
    }
    if (list.isNotEmpty) {
      return list;
    }
  } else if (params != null) {
    return params;
  }
  return null;
}
