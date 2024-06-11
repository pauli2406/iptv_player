// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSeriesInfoCollection on Isar {
  IsarCollection<SeriesInfo> get seriesInfos => this.collection();
}

const SeriesInfoSchema = CollectionSchema(
  name: r'SeriesInfo',
  id: -4657088700397595861,
  properties: {
    r'backdropPath': PropertySchema(
      id: 0,
      name: r'backdropPath',
      type: IsarType.stringList,
    ),
    r'cast': PropertySchema(
      id: 1,
      name: r'cast',
      type: IsarType.string,
    ),
    r'categoryId': PropertySchema(
      id: 2,
      name: r'categoryId',
      type: IsarType.long,
    ),
    r'categoryIds': PropertySchema(
      id: 3,
      name: r'categoryIds',
      type: IsarType.longList,
    ),
    r'cover': PropertySchema(
      id: 4,
      name: r'cover',
      type: IsarType.string,
    ),
    r'director': PropertySchema(
      id: 5,
      name: r'director',
      type: IsarType.string,
    ),
    r'episodeRunTime': PropertySchema(
      id: 6,
      name: r'episodeRunTime',
      type: IsarType.long,
    ),
    r'genre': PropertySchema(
      id: 7,
      name: r'genre',
      type: IsarType.string,
    ),
    r'lastModified': PropertySchema(
      id: 8,
      name: r'lastModified',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 9,
      name: r'name',
      type: IsarType.string,
    ),
    r'plot': PropertySchema(
      id: 10,
      name: r'plot',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 11,
      name: r'rating',
      type: IsarType.double,
    ),
    r'rating5based': PropertySchema(
      id: 12,
      name: r'rating5based',
      type: IsarType.double,
    ),
    r'releaseDate': PropertySchema(
      id: 13,
      name: r'releaseDate',
      type: IsarType.dateTime,
    ),
    r'title': PropertySchema(
      id: 14,
      name: r'title',
      type: IsarType.string,
    ),
    r'year': PropertySchema(
      id: 15,
      name: r'year',
      type: IsarType.string,
    ),
    r'youtubeTrailer': PropertySchema(
      id: 16,
      name: r'youtubeTrailer',
      type: IsarType.string,
    )
  },
  estimateSize: _seriesInfoEstimateSize,
  serialize: _seriesInfoSerialize,
  deserialize: _seriesInfoDeserialize,
  deserializeProp: _seriesInfoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _seriesInfoGetId,
  getLinks: _seriesInfoGetLinks,
  attach: _seriesInfoAttach,
  version: '3.1.0+1',
);

int _seriesInfoEstimateSize(
  SeriesInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.backdropPath.length * 3;
  {
    for (var i = 0; i < object.backdropPath.length; i++) {
      final value = object.backdropPath[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.cast;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.categoryIds.length * 8;
  {
    final value = object.cover;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.director;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.genre;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.plot;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.year;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.youtubeTrailer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _seriesInfoSerialize(
  SeriesInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.backdropPath);
  writer.writeString(offsets[1], object.cast);
  writer.writeLong(offsets[2], object.categoryId);
  writer.writeLongList(offsets[3], object.categoryIds);
  writer.writeString(offsets[4], object.cover);
  writer.writeString(offsets[5], object.director);
  writer.writeLong(offsets[6], object.episodeRunTime);
  writer.writeString(offsets[7], object.genre);
  writer.writeDateTime(offsets[8], object.lastModified);
  writer.writeString(offsets[9], object.name);
  writer.writeString(offsets[10], object.plot);
  writer.writeDouble(offsets[11], object.rating);
  writer.writeDouble(offsets[12], object.rating5based);
  writer.writeDateTime(offsets[13], object.releaseDate);
  writer.writeString(offsets[14], object.title);
  writer.writeString(offsets[15], object.year);
  writer.writeString(offsets[16], object.youtubeTrailer);
}

SeriesInfo _seriesInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SeriesInfo(
    backdropPath: reader.readStringList(offsets[0]) ?? [],
    cast: reader.readStringOrNull(offsets[1]),
    categoryId: reader.readLongOrNull(offsets[2]),
    categoryIds: reader.readLongList(offsets[3]) ?? [],
    cover: reader.readStringOrNull(offsets[4]),
    director: reader.readStringOrNull(offsets[5]),
    episodeRunTime: reader.readLongOrNull(offsets[6]),
    genre: reader.readStringOrNull(offsets[7]),
    id: id,
    lastModified: reader.readDateTimeOrNull(offsets[8]),
    name: reader.readStringOrNull(offsets[9]),
    plot: reader.readStringOrNull(offsets[10]),
    rating: reader.readDoubleOrNull(offsets[11]),
    rating5based: reader.readDoubleOrNull(offsets[12]),
    releaseDate: reader.readDateTimeOrNull(offsets[13]),
    title: reader.readStringOrNull(offsets[14]),
    year: reader.readStringOrNull(offsets[15]),
    youtubeTrailer: reader.readStringOrNull(offsets[16]),
  );
  return object;
}

P _seriesInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset) ?? []) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readLongList(offset) ?? []) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _seriesInfoGetId(SeriesInfo object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _seriesInfoGetLinks(SeriesInfo object) {
  return [];
}

void _seriesInfoAttach(IsarCollection<dynamic> col, Id id, SeriesInfo object) {
  object.id = id;
}

extension SeriesInfoQueryWhereSort
    on QueryBuilder<SeriesInfo, SeriesInfo, QWhere> {
  QueryBuilder<SeriesInfo, SeriesInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SeriesInfoQueryWhere
    on QueryBuilder<SeriesInfo, SeriesInfo, QWhereClause> {
  QueryBuilder<SeriesInfo, SeriesInfo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterWhereClause> idBetween(
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

extension SeriesInfoQueryFilter
    on QueryBuilder<SeriesInfo, SeriesInfo, QFilterCondition> {
  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'backdropPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'backdropPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'backdropPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'backdropPath',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'backdropPath',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backdropPath',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backdropPath',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backdropPath',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backdropPath',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backdropPath',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      backdropPathLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backdropPath',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cast',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cast',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cast',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cast',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cast',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cast',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cast',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cast',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cast',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cast',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cast',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> castIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cast',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoryId',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoryId',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> categoryIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> categoryIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryIds',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdsElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryIds',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdsElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryIds',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdsElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryIds',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      categoryIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'cover',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'cover',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cover',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'cover',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'cover',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> coverIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cover',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      coverIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'cover',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> directorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'director',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      directorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'director',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> directorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      directorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> directorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> directorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'director',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      directorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> directorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> directorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'director',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> directorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'director',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      directorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'director',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      directorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'director',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      episodeRunTimeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'episodeRunTime',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      episodeRunTimeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'episodeRunTime',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      episodeRunTimeEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'episodeRunTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      episodeRunTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'episodeRunTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      episodeRunTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'episodeRunTime',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      episodeRunTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'episodeRunTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'genre',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'genre',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'genre',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'genre',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'genre',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> genreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'genre',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      genreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'genre',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      lastModifiedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastModified',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      lastModifiedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastModified',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      lastModifiedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastModified',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      lastModifiedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastModified',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      lastModifiedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastModified',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      lastModifiedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastModified',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plot',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plot',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'plot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'plot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'plot',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'plot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'plot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'plot',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plot',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> plotIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plot',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> ratingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      ratingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> ratingEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> ratingGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> ratingLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> ratingBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      rating5basedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rating5based',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      rating5basedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rating5based',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      rating5basedEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating5based',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      rating5basedGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rating5based',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      rating5basedLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rating5based',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      rating5basedBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rating5based',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      releaseDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'releaseDate',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      releaseDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'releaseDate',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      releaseDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      releaseDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'releaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      releaseDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'releaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      releaseDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'releaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleEqualTo(
    String? value, {
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleGreaterThan(
    String? value, {
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleLessThan(
    String? value, {
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleStartsWith(
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleEndsWith(
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleContains(
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleMatches(
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

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'year',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'year',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'year',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'year',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'year',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition> yearIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'year',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'youtubeTrailer',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'youtubeTrailer',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'youtubeTrailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'youtubeTrailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'youtubeTrailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'youtubeTrailer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'youtubeTrailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'youtubeTrailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'youtubeTrailer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'youtubeTrailer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'youtubeTrailer',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterFilterCondition>
      youtubeTrailerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'youtubeTrailer',
        value: '',
      ));
    });
  }
}

extension SeriesInfoQueryObject
    on QueryBuilder<SeriesInfo, SeriesInfo, QFilterCondition> {}

extension SeriesInfoQueryLinks
    on QueryBuilder<SeriesInfo, SeriesInfo, QFilterCondition> {}

extension SeriesInfoQuerySortBy
    on QueryBuilder<SeriesInfo, SeriesInfo, QSortBy> {
  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByCast() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cast', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByCastDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cast', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByDirector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'director', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByDirectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'director', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByEpisodeRunTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeRunTime', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy>
      sortByEpisodeRunTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeRunTime', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByPlot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plot', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByPlotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plot', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByRating5based() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating5based', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByRating5basedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating5based', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByReleaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByReleaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> sortByYoutubeTrailer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeTrailer', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy>
      sortByYoutubeTrailerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeTrailer', Sort.desc);
    });
  }
}

extension SeriesInfoQuerySortThenBy
    on QueryBuilder<SeriesInfo, SeriesInfo, QSortThenBy> {
  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByCast() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cast', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByCastDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cast', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByCover() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByCoverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cover', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByDirector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'director', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByDirectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'director', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByEpisodeRunTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeRunTime', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy>
      thenByEpisodeRunTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeRunTime', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByGenre() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByGenreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'genre', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByLastModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastModified', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByPlot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plot', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByPlotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plot', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByRating5based() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating5based', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByRating5basedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating5based', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByReleaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByReleaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByYear() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByYearDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'year', Sort.desc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy> thenByYoutubeTrailer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeTrailer', Sort.asc);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QAfterSortBy>
      thenByYoutubeTrailerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'youtubeTrailer', Sort.desc);
    });
  }
}

extension SeriesInfoQueryWhereDistinct
    on QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> {
  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByBackdropPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'backdropPath');
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByCast(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cast', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryId');
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByCategoryIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryIds');
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByCover(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cover', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByDirector(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'director', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByEpisodeRunTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'episodeRunTime');
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByGenre(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'genre', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByLastModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastModified');
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByPlot(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plot', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByRating5based() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating5based');
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByReleaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'releaseDate');
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByYear(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'year', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesInfo, SeriesInfo, QDistinct> distinctByYoutubeTrailer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'youtubeTrailer',
          caseSensitive: caseSensitive);
    });
  }
}

extension SeriesInfoQueryProperty
    on QueryBuilder<SeriesInfo, SeriesInfo, QQueryProperty> {
  QueryBuilder<SeriesInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SeriesInfo, List<String>, QQueryOperations>
      backdropPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backdropPath');
    });
  }

  QueryBuilder<SeriesInfo, String?, QQueryOperations> castProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cast');
    });
  }

  QueryBuilder<SeriesInfo, int?, QQueryOperations> categoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryId');
    });
  }

  QueryBuilder<SeriesInfo, List<int>, QQueryOperations> categoryIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryIds');
    });
  }

  QueryBuilder<SeriesInfo, String?, QQueryOperations> coverProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cover');
    });
  }

  QueryBuilder<SeriesInfo, String?, QQueryOperations> directorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'director');
    });
  }

  QueryBuilder<SeriesInfo, int?, QQueryOperations> episodeRunTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'episodeRunTime');
    });
  }

  QueryBuilder<SeriesInfo, String?, QQueryOperations> genreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genre');
    });
  }

  QueryBuilder<SeriesInfo, DateTime?, QQueryOperations> lastModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastModified');
    });
  }

  QueryBuilder<SeriesInfo, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<SeriesInfo, String?, QQueryOperations> plotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plot');
    });
  }

  QueryBuilder<SeriesInfo, double?, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<SeriesInfo, double?, QQueryOperations> rating5basedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating5based');
    });
  }

  QueryBuilder<SeriesInfo, DateTime?, QQueryOperations> releaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'releaseDate');
    });
  }

  QueryBuilder<SeriesInfo, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<SeriesInfo, String?, QQueryOperations> yearProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'year');
    });
  }

  QueryBuilder<SeriesInfo, String?, QQueryOperations> youtubeTrailerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'youtubeTrailer');
    });
  }
}
