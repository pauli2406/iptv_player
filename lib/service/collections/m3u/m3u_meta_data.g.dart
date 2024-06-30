// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm3u_meta_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetM3UMetaDataCollection on Isar {
  IsarCollection<M3UMetaData> get m3UMetaDatas => this.collection();
}

const M3UMetaDataSchema = CollectionSchema(
  name: r'M3UMetaData',
  id: -9011800802008902984,
  properties: {
    r'starred': PropertySchema(
      id: 0,
      name: r'starred',
      type: IsarType.bool,
    ),
    r'title': PropertySchema(
      id: 1,
      name: r'title',
      type: IsarType.string,
    ),
    r'tvgId': PropertySchema(
      id: 2,
      name: r'tvgId',
      type: IsarType.string,
    ),
    r'watched': PropertySchema(
      id: 3,
      name: r'watched',
      type: IsarType.bool,
    )
  },
  estimateSize: _m3UMetaDataEstimateSize,
  serialize: _m3UMetaDataSerialize,
  deserialize: _m3UMetaDataDeserialize,
  deserializeProp: _m3UMetaDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _m3UMetaDataGetId,
  getLinks: _m3UMetaDataGetLinks,
  attach: _m3UMetaDataAttach,
  version: '3.1.7',
);

int _m3UMetaDataEstimateSize(
  M3UMetaData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.title.length * 3;
  {
    final value = object.tvgId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _m3UMetaDataSerialize(
  M3UMetaData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.starred);
  writer.writeString(offsets[1], object.title);
  writer.writeString(offsets[2], object.tvgId);
  writer.writeBool(offsets[3], object.watched);
}

M3UMetaData _m3UMetaDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = M3UMetaData(
    reader.readString(offsets[1]),
    reader.readStringOrNull(offsets[2]),
    starred: reader.readBoolOrNull(offsets[0]) ?? false,
    watched: reader.readBoolOrNull(offsets[3]) ?? false,
  );
  object.id = id;
  return object;
}

P _m3UMetaDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _m3UMetaDataGetId(M3UMetaData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _m3UMetaDataGetLinks(M3UMetaData object) {
  return [];
}

void _m3UMetaDataAttach(
    IsarCollection<dynamic> col, Id id, M3UMetaData object) {
  object.id = id;
}

extension M3UMetaDataQueryWhereSort
    on QueryBuilder<M3UMetaData, M3UMetaData, QWhere> {
  QueryBuilder<M3UMetaData, M3UMetaData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension M3UMetaDataQueryWhere
    on QueryBuilder<M3UMetaData, M3UMetaData, QWhereClause> {
  QueryBuilder<M3UMetaData, M3UMetaData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterWhereClause> idBetween(
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

extension M3UMetaDataQueryFilter
    on QueryBuilder<M3UMetaData, M3UMetaData, QFilterCondition> {
  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> starredEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'starred',
        value: value,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> tvgIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tvgId',
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition>
      tvgIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tvgId',
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> tvgIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition>
      tvgIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> tvgIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> tvgIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tvgId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> tvgIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> tvgIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> tvgIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tvgId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> tvgIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tvgId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> tvgIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tvgId',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition>
      tvgIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tvgId',
        value: '',
      ));
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterFilterCondition> watchedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watched',
        value: value,
      ));
    });
  }
}

extension M3UMetaDataQueryObject
    on QueryBuilder<M3UMetaData, M3UMetaData, QFilterCondition> {}

extension M3UMetaDataQueryLinks
    on QueryBuilder<M3UMetaData, M3UMetaData, QFilterCondition> {}

extension M3UMetaDataQuerySortBy
    on QueryBuilder<M3UMetaData, M3UMetaData, QSortBy> {
  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> sortByStarred() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starred', Sort.asc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> sortByStarredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starred', Sort.desc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> sortByTvgId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvgId', Sort.asc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> sortByTvgIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvgId', Sort.desc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> sortByWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watched', Sort.asc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> sortByWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watched', Sort.desc);
    });
  }
}

extension M3UMetaDataQuerySortThenBy
    on QueryBuilder<M3UMetaData, M3UMetaData, QSortThenBy> {
  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> thenByStarred() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starred', Sort.asc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> thenByStarredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'starred', Sort.desc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> thenByTvgId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvgId', Sort.asc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> thenByTvgIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvgId', Sort.desc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> thenByWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watched', Sort.asc);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QAfterSortBy> thenByWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watched', Sort.desc);
    });
  }
}

extension M3UMetaDataQueryWhereDistinct
    on QueryBuilder<M3UMetaData, M3UMetaData, QDistinct> {
  QueryBuilder<M3UMetaData, M3UMetaData, QDistinct> distinctByStarred() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'starred');
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QDistinct> distinctByTvgId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tvgId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<M3UMetaData, M3UMetaData, QDistinct> distinctByWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'watched');
    });
  }
}

extension M3UMetaDataQueryProperty
    on QueryBuilder<M3UMetaData, M3UMetaData, QQueryProperty> {
  QueryBuilder<M3UMetaData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<M3UMetaData, bool, QQueryOperations> starredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'starred');
    });
  }

  QueryBuilder<M3UMetaData, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<M3UMetaData, String?, QQueryOperations> tvgIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tvgId');
    });
  }

  QueryBuilder<M3UMetaData, bool, QQueryOperations> watchedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watched');
    });
  }
}
