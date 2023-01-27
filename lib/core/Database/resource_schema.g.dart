// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetResourceCollection on Isar {
  IsarCollection<Resource> get resources => this.collection();
}

const ResourceSchema = CollectionSchema(
  name: r'Resource',
  id: -7004763161446477611,
  properties: {
    r'c': PropertySchema(
      id: 0,
      name: r'c',
      type: IsarType.object,
      target: r'cost',
    ),
    r'label': PropertySchema(
      id: 1,
      name: r'label',
      type: IsarType.string,
    ),
    r'm': PropertySchema(
      id: 2,
      name: r'm',
      type: IsarType.object,
      target: r'material',
    ),
    r'repeat': PropertySchema(
      id: 3,
      name: r'repeat',
      type: IsarType.long,
    ),
    r'w': PropertySchema(
      id: 4,
      name: r'w',
      type: IsarType.object,
      target: r'work',
    )
  },
  estimateSize: _resourceEstimateSize,
  serialize: _resourceSerialize,
  deserialize: _resourceDeserialize,
  deserializeProp: _resourceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {
    r'work': WorkSchema,
    r'material': MaterialSchema,
    r'cost': CostSchema
  },
  getId: _resourceGetId,
  getLinks: _resourceGetLinks,
  attach: _resourceAttach,
  version: '3.0.5',
);

int _resourceEstimateSize(
  Resource object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.c;
    if (value != null) {
      bytesCount +=
          3 + CostSchema.estimateSize(value, allOffsets[cost]!, allOffsets);
    }
  }
  {
    final value = object.label;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.m;
    if (value != null) {
      bytesCount += 3 +
          MaterialSchema.estimateSize(value, allOffsets[material]!, allOffsets);
    }
  }
  {
    final value = object.w;
    if (value != null) {
      bytesCount +=
          3 + WorkSchema.estimateSize(value, allOffsets[work]!, allOffsets);
    }
  }
  return bytesCount;
}

void _resourceSerialize(
  Resource object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<cost>(
    offsets[0],
    allOffsets,
    CostSchema.serialize,
    object.c,
  );
  writer.writeString(offsets[1], object.label);
  writer.writeObject<material>(
    offsets[2],
    allOffsets,
    MaterialSchema.serialize,
    object.m,
  );
  writer.writeLong(offsets[3], object.repeat);
  writer.writeObject<work>(
    offsets[4],
    allOffsets,
    WorkSchema.serialize,
    object.w,
  );
}

Resource _resourceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Resource();
  object.c = reader.readObjectOrNull<cost>(
    offsets[0],
    CostSchema.deserialize,
    allOffsets,
  );
  object.id = id;
  object.label = reader.readStringOrNull(offsets[1]);
  object.m = reader.readObjectOrNull<material>(
    offsets[2],
    MaterialSchema.deserialize,
    allOffsets,
  );
  object.repeat = reader.readLongOrNull(offsets[3]);
  object.w = reader.readObjectOrNull<work>(
    offsets[4],
    WorkSchema.deserialize,
    allOffsets,
  );
  return object;
}

P _resourceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<cost>(
        offset,
        CostSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<material>(
        offset,
        MaterialSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readObjectOrNull<work>(
        offset,
        WorkSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _resourceGetId(Resource object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _resourceGetLinks(Resource object) {
  return [];
}

void _resourceAttach(IsarCollection<dynamic> col, Id id, Resource object) {
  object.id = id;
}

extension ResourceQueryWhereSort on QueryBuilder<Resource, Resource, QWhere> {
  QueryBuilder<Resource, Resource, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ResourceQueryWhere on QueryBuilder<Resource, Resource, QWhereClause> {
  QueryBuilder<Resource, Resource, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Resource, Resource, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Resource, Resource, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Resource, Resource, QAfterWhereClause> idBetween(
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

extension ResourceQueryFilter
    on QueryBuilder<Resource, Resource, QFilterCondition> {
  QueryBuilder<Resource, Resource, QAfterFilterCondition> cIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'c',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> cIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'c',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Resource, Resource, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Resource, Resource, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'label',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelEqualTo(
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

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelGreaterThan(
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

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelLessThan(
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

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelBetween(
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

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelStartsWith(
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

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelEndsWith(
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

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'label',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'label',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> labelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'label',
        value: '',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> mIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'm',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> mIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'm',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> repeatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'repeat',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> repeatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'repeat',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> repeatEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repeat',
        value: value,
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> repeatGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repeat',
        value: value,
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> repeatLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repeat',
        value: value,
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> repeatBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repeat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> wIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'w',
      ));
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> wIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'w',
      ));
    });
  }
}

extension ResourceQueryObject
    on QueryBuilder<Resource, Resource, QFilterCondition> {
  QueryBuilder<Resource, Resource, QAfterFilterCondition> c(
      FilterQuery<cost> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'c');
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> m(
      FilterQuery<material> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'm');
    });
  }

  QueryBuilder<Resource, Resource, QAfterFilterCondition> w(
      FilterQuery<work> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'w');
    });
  }
}

extension ResourceQueryLinks
    on QueryBuilder<Resource, Resource, QFilterCondition> {}

extension ResourceQuerySortBy on QueryBuilder<Resource, Resource, QSortBy> {
  QueryBuilder<Resource, Resource, QAfterSortBy> sortByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<Resource, Resource, QAfterSortBy> sortByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<Resource, Resource, QAfterSortBy> sortByRepeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat', Sort.asc);
    });
  }

  QueryBuilder<Resource, Resource, QAfterSortBy> sortByRepeatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat', Sort.desc);
    });
  }
}

extension ResourceQuerySortThenBy
    on QueryBuilder<Resource, Resource, QSortThenBy> {
  QueryBuilder<Resource, Resource, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Resource, Resource, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Resource, Resource, QAfterSortBy> thenByLabel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.asc);
    });
  }

  QueryBuilder<Resource, Resource, QAfterSortBy> thenByLabelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'label', Sort.desc);
    });
  }

  QueryBuilder<Resource, Resource, QAfterSortBy> thenByRepeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat', Sort.asc);
    });
  }

  QueryBuilder<Resource, Resource, QAfterSortBy> thenByRepeatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeat', Sort.desc);
    });
  }
}

extension ResourceQueryWhereDistinct
    on QueryBuilder<Resource, Resource, QDistinct> {
  QueryBuilder<Resource, Resource, QDistinct> distinctByLabel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'label', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Resource, Resource, QDistinct> distinctByRepeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeat');
    });
  }
}

extension ResourceQueryProperty
    on QueryBuilder<Resource, Resource, QQueryProperty> {
  QueryBuilder<Resource, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Resource, cost?, QQueryOperations> cProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'c');
    });
  }

  QueryBuilder<Resource, String?, QQueryOperations> labelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'label');
    });
  }

  QueryBuilder<Resource, material?, QQueryOperations> mProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'm');
    });
  }

  QueryBuilder<Resource, int?, QQueryOperations> repeatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeat');
    });
  }

  QueryBuilder<Resource, work?, QQueryOperations> wProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'w');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const WorkSchema = Schema(
  name: r'work',
  id: -5231014332543981642,
  properties: {
    r'$_per_hr': PropertySchema(
      id: 0,
      name: r'$_per_hr',
      type: IsarType.double,
    ),
    r'ovt$_per_hr': PropertySchema(
      id: 1,
      name: r'ovt$_per_hr',
      type: IsarType.double,
    ),
    r'percentage_avaliablity': PropertySchema(
      id: 2,
      name: r'percentage_avaliablity',
      type: IsarType.double,
    )
  },
  estimateSize: _workEstimateSize,
  serialize: _workSerialize,
  deserialize: _workDeserialize,
  deserializeProp: _workDeserializeProp,
);

int _workEstimateSize(
  work object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _workSerialize(
  work object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.$_per_hr);
  writer.writeDouble(offsets[1], object.ovt$_per_hr);
  writer.writeDouble(offsets[2], object.percentage_avaliablity);
}

work _workDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = work();
  object.$_per_hr = reader.readDoubleOrNull(offsets[0]);
  object.ovt$_per_hr = reader.readDoubleOrNull(offsets[1]);
  object.percentage_avaliablity = reader.readDoubleOrNull(offsets[2]);
  return object;
}

P _workDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension workQueryFilter on QueryBuilder<work, work, QFilterCondition> {
  QueryBuilder<work, work, QAfterFilterCondition> $_per_hrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'$_per_hr',
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> $_per_hrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'$_per_hr',
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> $_per_hrEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'$_per_hr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> $_per_hrGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'$_per_hr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> $_per_hrLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'$_per_hr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> $_per_hrBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'$_per_hr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> ovt$_per_hrIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ovt$_per_hr',
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> ovt$_per_hrIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ovt$_per_hr',
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> ovt$_per_hrEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ovt$_per_hr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> ovt$_per_hrGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ovt$_per_hr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> ovt$_per_hrLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ovt$_per_hr',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> ovt$_per_hrBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ovt$_per_hr',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition>
      percentage_avaliablityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'percentage_avaliablity',
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition>
      percentage_avaliablityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'percentage_avaliablity',
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> percentage_avaliablityEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'percentage_avaliablity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition>
      percentage_avaliablityGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'percentage_avaliablity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition>
      percentage_avaliablityLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'percentage_avaliablity',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<work, work, QAfterFilterCondition> percentage_avaliablityBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'percentage_avaliablity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension workQueryObject on QueryBuilder<work, work, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const MaterialSchema = Schema(
  name: r'material',
  id: -5372905036179028125,
  properties: {
    r'cost_per_quant': PropertySchema(
      id: 0,
      name: r'cost_per_quant',
      type: IsarType.double,
    ),
    r'quantity': PropertySchema(
      id: 1,
      name: r'quantity',
      type: IsarType.long,
    )
  },
  estimateSize: _materialEstimateSize,
  serialize: _materialSerialize,
  deserialize: _materialDeserialize,
  deserializeProp: _materialDeserializeProp,
);

int _materialEstimateSize(
  material object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _materialSerialize(
  material object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.cost_per_quant);
  writer.writeLong(offsets[1], object.quantity);
}

material _materialDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = material();
  object.cost_per_quant = reader.readDoubleOrNull(offsets[0]);
  object.quantity = reader.readLongOrNull(offsets[1]);
  return object;
}

P _materialDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension materialQueryFilter
    on QueryBuilder<material, material, QFilterCondition> {
  QueryBuilder<material, material, QAfterFilterCondition>
      cost_per_quantIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cost_per_quant',
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition>
      cost_per_quantIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cost_per_quant',
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition> cost_per_quantEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cost_per_quant',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition>
      cost_per_quantGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cost_per_quant',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition>
      cost_per_quantLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cost_per_quant',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition> cost_per_quantBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cost_per_quant',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition> quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition> quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition> quantityEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition> quantityGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition> quantityLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
      ));
    });
  }

  QueryBuilder<material, material, QAfterFilterCondition> quantityBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension materialQueryObject
    on QueryBuilder<material, material, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const CostSchema = Schema(
  name: r'cost',
  id: -2132755439525103693,
  properties: {
    r'price': PropertySchema(
      id: 0,
      name: r'price',
      type: IsarType.double,
    )
  },
  estimateSize: _costEstimateSize,
  serialize: _costSerialize,
  deserialize: _costDeserialize,
  deserializeProp: _costDeserializeProp,
);

int _costEstimateSize(
  cost object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _costSerialize(
  cost object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.price);
}

cost _costDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = cost();
  object.price = reader.readDoubleOrNull(offsets[0]);
  return object;
}

P _costDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension costQueryFilter on QueryBuilder<cost, cost, QFilterCondition> {
  QueryBuilder<cost, cost, QAfterFilterCondition> priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<cost, cost, QAfterFilterCondition> priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'price',
      ));
    });
  }

  QueryBuilder<cost, cost, QAfterFilterCondition> priceEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<cost, cost, QAfterFilterCondition> priceGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<cost, cost, QAfterFilterCondition> priceLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'price',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<cost, cost, QAfterFilterCondition> priceBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'price',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension costQueryObject on QueryBuilder<cost, cost, QFilterCondition> {}
