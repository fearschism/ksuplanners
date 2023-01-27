// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTaskCollection on Isar {
  IsarCollection<Task> get tasks => this.collection();
}

const TaskSchema = CollectionSchema(
  name: r'Task',
  id: 2998003626758701373,
  properties: {
    r'F_Date_day': PropertySchema(
      id: 0,
      name: r'F_Date_day',
      type: IsarType.long,
    ),
    r'F_Date_month': PropertySchema(
      id: 1,
      name: r'F_Date_month',
      type: IsarType.long,
    ),
    r'F_Date_year': PropertySchema(
      id: 2,
      name: r'F_Date_year',
      type: IsarType.long,
    ),
    r'S_Date_day': PropertySchema(
      id: 3,
      name: r'S_Date_day',
      type: IsarType.long,
    ),
    r'S_Date_month': PropertySchema(
      id: 4,
      name: r'S_Date_month',
      type: IsarType.long,
    ),
    r'S_Date_year': PropertySchema(
      id: 5,
      name: r'S_Date_year',
      type: IsarType.long,
    ),
    r'label': PropertySchema(
      id: 6,
      name: r'label',
      type: IsarType.string,
    ),
    r'repeatedIds': PropertySchema(
      id: 7,
      name: r'repeatedIds',
      type: IsarType.longList,
    )
  },
  estimateSize: _taskEstimateSize,
  serialize: _taskSerialize,
  deserialize: _taskDeserialize,
  deserializeProp: _taskDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'resources': LinkSchema(
      id: -2241674171509923144,
      name: r'resources',
      target: r'Resource',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _taskGetId,
  getLinks: _taskGetLinks,
  attach: _taskAttach,
  version: '3.0.5',
);

int _taskEstimateSize(
  Task object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.repeatedIds;
    if (value != null) {
      bytesCount += 3 + value.length * 8;
    }
  }
  return bytesCount;
}

void _taskSerialize(
  Task object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.F_Date_day);
  writer.writeLong(offsets[1], object.F_Date_month);
  writer.writeLong(offsets[2], object.F_Date_year);
  writer.writeLong(offsets[3], object.S_Date_day);
  writer.writeLong(offsets[4], object.S_Date_month);
  writer.writeLong(offsets[5], object.S_Date_year);
  writer.writeString(offsets[6], object.label);
  writer.writeLongList(offsets[7], object.repeatedIds);
}

Task _taskDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Task();
  object.F_Date_day = reader.readLongOrNull(offsets[0]);
  object.F_Date_month = reader.readLongOrNull(offsets[1]);
  object.F_Date_year = reader.readLongOrNull(offsets[2]);
  object.S_Date_day = reader.readLongOrNull(offsets[3]);
  object.S_Date_month = reader.readLongOrNull(offsets[4]);
  object.S_Date_year = reader.readLongOrNull(offsets[5]);
  object.id = id;
  object.label = reader.readStringOrNull(offsets[6]);
  object.repeatedIds = reader.readLongList(offsets[7]);
  return object;
}

P _taskDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _taskGetId(Task object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _taskGetLinks(Task object) {
  return [object.resources];
}

void _taskAttach(IsarCollection<dynamic> col, Id id, Task object) {
  object.id = id;
  object.resources
      .attach(col, col.isar.collection<Resource>(), r'resources', id);
}

extension TaskQueryWhereSort on QueryBuilder<Task, Task, QWhere> {
  QueryBuilder<Task, Task, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TaskQueryWhere on QueryBuilder<Task, Task, QWhereClause> {
  QueryBuilder<Task, Task, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Task, Task, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TaskQueryFilter on QueryBuilder<Task, Task, QFilterCondition> {
  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_dayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'F_Date_day',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_dayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'F_Date_day',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_dayEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'F_Date_day',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_dayGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'F_Date_day',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_dayLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'F_Date_day',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_dayBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'F_Date_day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_monthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'F_Date_month',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_monthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'F_Date_month',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_monthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'F_Date_month',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_monthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'F_Date_month',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_monthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'F_Date_month',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_monthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'F_Date_month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'F_Date_year',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'F_Date_year',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_yearEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'F_Date_year',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_yearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'F_Date_year',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_yearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'F_Date_year',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> f_Date_yearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'F_Date_year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_dayIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'S_Date_day',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_dayIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'S_Date_day',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_dayEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'S_Date_day',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_dayGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'S_Date_day',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_dayLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'S_Date_day',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_dayBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'S_Date_day',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_monthIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'S_Date_month',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_monthIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'S_Date_month',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_monthEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'S_Date_month',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_monthGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'S_Date_month',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_monthLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'S_Date_month',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_monthBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'S_Date_month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'S_Date_year',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'S_Date_year',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_yearEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'S_Date_year',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_yearGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'S_Date_year',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_yearLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'S_Date_year',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> s_Date_yearBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'S_Date_year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'label',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'repeatedIds',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'repeatedIds',
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeatedIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repeatedIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repeatedIds',
        value: value,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repeatedIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repeatedIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repeatedIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repeatedIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repeatedIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repeatedIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> repeatedIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'repeatedIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension TaskQueryObject on QueryBuilder<Task, Task, QFilterCondition> {}

extension TaskQueryLinks on QueryBuilder<Task, Task, QFilterCondition> {
  QueryBuilder<Task, Task, QAfterFilterCondition> resources(
      FilterQuery<Resource> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'resources');
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resourcesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'resources', length, true, length, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resourcesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'resources', 0, true, 0, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resourcesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'resources', 0, false, 999999, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resourcesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'resources', 0, true, length, include);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resourcesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'resources', length, include, 999999, true);
    });
  }

  QueryBuilder<Task, Task, QAfterFilterCondition> resourcesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'resources', lower, includeLower, upper, includeUpper);
    });
  }
}

extension TaskQuerySortBy on QueryBuilder<Task, Task, QSortBy> {
  QueryBuilder<Task, Task, QAfterSortBy> sortByF_Date_day() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_day', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByF_Date_dayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_day', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByF_Date_month() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_month', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByF_Date_monthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_month', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByF_Date_year() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_year', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByF_Date_yearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_year', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByS_Date_day() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_day', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByS_Date_dayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_day', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByS_Date_month() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_month', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByS_Date_monthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_month', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByS_Date_year() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_year', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByS_Date_yearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_year', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }
}

extension TaskQuerySortThenBy on QueryBuilder<Task, Task, QSortThenBy> {
  QueryBuilder<Task, Task, QAfterSortBy> thenByF_Date_day() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_day', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByF_Date_dayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_day', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByF_Date_month() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_month', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByF_Date_monthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_month', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByF_Date_year() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_year', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByF_Date_yearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'F_Date_year', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByS_Date_day() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_day', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByS_Date_dayDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_day', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByS_Date_month() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_month', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByS_Date_monthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_month', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByS_Date_year() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_year', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByS_Date_yearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'S_Date_year', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<Task, Task, QAfterSortBy> thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }
}

extension TaskQueryWhereDistinct on QueryBuilder<Task, Task, QDistinct> {
  QueryBuilder<Task, Task, QDistinct> distinctByF_Date_day() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'F_Date_day');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByF_Date_month() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'F_Date_month');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByF_Date_year() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'F_Date_year');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByS_Date_day() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'S_Date_day');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByS_Date_month() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'S_Date_month');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByS_Date_year() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'S_Date_year');
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Task, Task, QDistinct> distinctByRepeatedIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeatedIds');
    });
  }
}

extension TaskQueryProperty on QueryBuilder<Task, Task, QQueryProperty> {
  QueryBuilder<Task, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Task, int?, QQueryOperations> F_Date_dayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'F_Date_day');
    });
  }

  QueryBuilder<Task, int?, QQueryOperations> F_Date_monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'F_Date_month');
    });
  }

  QueryBuilder<Task, int?, QQueryOperations> F_Date_yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'F_Date_year');
    });
  }

  QueryBuilder<Task, int?, QQueryOperations> S_Date_dayProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'S_Date_day');
    });
  }

  QueryBuilder<Task, int?, QQueryOperations> S_Date_monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'S_Date_month');
    });
  }

  QueryBuilder<Task, int?, QQueryOperations> S_Date_yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'S_Date_year');
    });
  }

  QueryBuilder<Task, String?, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<Task, List<int>?, QQueryOperations> repeatedIdsProperty(List<int> repeat) {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeatedIds');
    });
  }
}
