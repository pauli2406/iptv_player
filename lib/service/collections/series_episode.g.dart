// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_episode.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSeriesEpisodeCollection on Isar {
  IsarCollection<SeriesEpisode> get seriesEpisodes => this.collection();
}

const SeriesEpisodeSchema = CollectionSchema(
  name: r'SeriesEpisode',
  id: -4012771310722763260,
  properties: {
    r'added': PropertySchema(
      id: 0,
      name: r'added',
      type: IsarType.dateTime,
    ),
    r'bitrate': PropertySchema(
      id: 1,
      name: r'bitrate',
      type: IsarType.long,
    ),
    r'containerExtension': PropertySchema(
      id: 2,
      name: r'containerExtension',
      type: IsarType.string,
    ),
    r'coverBig': PropertySchema(
      id: 3,
      name: r'coverBig',
      type: IsarType.string,
    ),
    r'customSid': PropertySchema(
      id: 4,
      name: r'customSid',
      type: IsarType.string,
    ),
    r'directSource': PropertySchema(
      id: 5,
      name: r'directSource',
      type: IsarType.string,
    ),
    r'duration': PropertySchema(
      id: 6,
      name: r'duration',
      type: IsarType.string,
    ),
    r'durationSecs': PropertySchema(
      id: 7,
      name: r'durationSecs',
      type: IsarType.long,
    ),
    r'episodeNum': PropertySchema(
      id: 8,
      name: r'episodeNum',
      type: IsarType.long,
    ),
    r'lastWatched': PropertySchema(
      id: 9,
      name: r'lastWatched',
      type: IsarType.dateTime,
    ),
    r'movieImage': PropertySchema(
      id: 10,
      name: r'movieImage',
      type: IsarType.string,
    ),
    r'plot': PropertySchema(
      id: 11,
      name: r'plot',
      type: IsarType.string,
    ),
    r'rating': PropertySchema(
      id: 12,
      name: r'rating',
      type: IsarType.double,
    ),
    r'releaseDate': PropertySchema(
      id: 13,
      name: r'releaseDate',
      type: IsarType.dateTime,
    ),
    r'season': PropertySchema(
      id: 14,
      name: r'season',
      type: IsarType.long,
    ),
    r'streamId': PropertySchema(
      id: 15,
      name: r'streamId',
      type: IsarType.long,
    ),
    r'streamUrl': PropertySchema(
      id: 16,
      name: r'streamUrl',
      type: IsarType.string,
    ),
    r'subtitles': PropertySchema(
      id: 17,
      name: r'subtitles',
      type: IsarType.stringList,
    ),
    r'title': PropertySchema(
      id: 18,
      name: r'title',
      type: IsarType.string,
    ),
    r'tmdbId': PropertySchema(
      id: 19,
      name: r'tmdbId',
      type: IsarType.long,
    ),
    r'watchedDuration': PropertySchema(
      id: 20,
      name: r'watchedDuration',
      type: IsarType.double,
    )
  },
  estimateSize: _seriesEpisodeEstimateSize,
  serialize: _seriesEpisodeSerialize,
  deserialize: _seriesEpisodeDeserialize,
  deserializeProp: _seriesEpisodeDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _seriesEpisodeGetId,
  getLinks: _seriesEpisodeGetLinks,
  attach: _seriesEpisodeAttach,
  version: '3.1.8',
);

int _seriesEpisodeEstimateSize(
  SeriesEpisode object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.containerExtension;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.coverBig;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.customSid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.directSource;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.duration;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.movieImage;
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
  bytesCount += 3 + object.streamUrl.length * 3;
  bytesCount += 3 + object.subtitles.length * 3;
  {
    for (var i = 0; i < object.subtitles.length; i++) {
      final value = object.subtitles[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.title;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _seriesEpisodeSerialize(
  SeriesEpisode object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.added);
  writer.writeLong(offsets[1], object.bitrate);
  writer.writeString(offsets[2], object.containerExtension);
  writer.writeString(offsets[3], object.coverBig);
  writer.writeString(offsets[4], object.customSid);
  writer.writeString(offsets[5], object.directSource);
  writer.writeString(offsets[6], object.duration);
  writer.writeLong(offsets[7], object.durationSecs);
  writer.writeLong(offsets[8], object.episodeNum);
  writer.writeDateTime(offsets[9], object.lastWatched);
  writer.writeString(offsets[10], object.movieImage);
  writer.writeString(offsets[11], object.plot);
  writer.writeDouble(offsets[12], object.rating);
  writer.writeDateTime(offsets[13], object.releaseDate);
  writer.writeLong(offsets[14], object.season);
  writer.writeLong(offsets[15], object.streamId);
  writer.writeString(offsets[16], object.streamUrl);
  writer.writeStringList(offsets[17], object.subtitles);
  writer.writeString(offsets[18], object.title);
  writer.writeLong(offsets[19], object.tmdbId);
  writer.writeDouble(offsets[20], object.watchedDuration);
}

SeriesEpisode _seriesEpisodeDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SeriesEpisode(
    added: reader.readDateTimeOrNull(offsets[0]),
    bitrate: reader.readLongOrNull(offsets[1]),
    containerExtension: reader.readStringOrNull(offsets[2]),
    coverBig: reader.readStringOrNull(offsets[3]),
    customSid: reader.readStringOrNull(offsets[4]),
    directSource: reader.readStringOrNull(offsets[5]),
    duration: reader.readStringOrNull(offsets[6]),
    durationSecs: reader.readLongOrNull(offsets[7]),
    episodeNum: reader.readLongOrNull(offsets[8]),
    id: id,
    lastWatched: reader.readDateTimeOrNull(offsets[9]),
    movieImage: reader.readStringOrNull(offsets[10]),
    plot: reader.readStringOrNull(offsets[11]),
    rating: reader.readDoubleOrNull(offsets[12]),
    releaseDate: reader.readDateTimeOrNull(offsets[13]),
    season: reader.readLongOrNull(offsets[14]),
    streamId: reader.readLongOrNull(offsets[15]),
    streamUrl: reader.readString(offsets[16]),
    subtitles: reader.readStringList(offsets[17]) ?? const [],
    title: reader.readStringOrNull(offsets[18]),
    tmdbId: reader.readLongOrNull(offsets[19]),
    watchedDuration: reader.readDoubleOrNull(offsets[20]),
  );
  return object;
}

P _seriesEpisodeDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readDoubleOrNull(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readStringList(offset) ?? const []) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readLongOrNull(offset)) as P;
    case 20:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _seriesEpisodeGetId(SeriesEpisode object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _seriesEpisodeGetLinks(SeriesEpisode object) {
  return [];
}

void _seriesEpisodeAttach(
    IsarCollection<dynamic> col, Id id, SeriesEpisode object) {
  object.id = id;
}

extension SeriesEpisodeQueryWhereSort
    on QueryBuilder<SeriesEpisode, SeriesEpisode, QWhere> {
  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SeriesEpisodeQueryWhere
    on QueryBuilder<SeriesEpisode, SeriesEpisode, QWhereClause> {
  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterWhereClause> idBetween(
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

extension SeriesEpisodeQueryFilter
    on QueryBuilder<SeriesEpisode, SeriesEpisode, QFilterCondition> {
  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      addedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'added',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      addedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'added',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      addedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'added',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      addedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'added',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      addedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'added',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      addedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'added',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      bitrateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bitrate',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      bitrateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bitrate',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      bitrateEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bitrate',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      bitrateGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bitrate',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      bitrateLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bitrate',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      bitrateBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bitrate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'containerExtension',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'containerExtension',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'containerExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'containerExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'containerExtension',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'containerExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'containerExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'containerExtension',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'containerExtension',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'containerExtension',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      containerExtensionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'containerExtension',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'coverBig',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'coverBig',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverBig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coverBig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coverBig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coverBig',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coverBig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coverBig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coverBig',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coverBig',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coverBig',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      coverBigIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coverBig',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customSid',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customSid',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customSid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customSid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customSid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customSid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'customSid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'customSid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'customSid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'customSid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customSid',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      customSidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'customSid',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'directSource',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'directSource',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'directSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'directSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'directSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'directSource',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'directSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'directSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'directSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'directSource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'directSource',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      directSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'directSource',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'duration',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'duration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationSecsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'durationSecs',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationSecsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'durationSecs',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationSecsEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'durationSecs',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationSecsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'durationSecs',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationSecsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'durationSecs',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      durationSecsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'durationSecs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      episodeNumIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'episodeNum',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      episodeNumIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'episodeNum',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      episodeNumEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'episodeNum',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      episodeNumGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'episodeNum',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      episodeNumLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'episodeNum',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      episodeNumBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'episodeNum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      lastWatchedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWatched',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      lastWatchedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWatched',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      lastWatchedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      lastWatchedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      lastWatchedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      lastWatchedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastWatched',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'movieImage',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'movieImage',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'movieImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'movieImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'movieImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'movieImage',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'movieImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'movieImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'movieImage',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'movieImage',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'movieImage',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      movieImageIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'movieImage',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      plotIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'plot',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      plotIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'plot',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition> plotEqualTo(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      plotGreaterThan(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      plotLessThan(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition> plotBetween(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      plotStartsWith(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      plotEndsWith(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      plotContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'plot',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition> plotMatches(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      plotIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'plot',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      plotIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'plot',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      ratingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      ratingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rating',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      ratingEqualTo(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      ratingGreaterThan(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      ratingLessThan(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      ratingBetween(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      releaseDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'releaseDate',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      releaseDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'releaseDate',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      releaseDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'releaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      seasonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'season',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      seasonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'season',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      seasonEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'season',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      seasonGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'season',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      seasonLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'season',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      seasonBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'season',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'streamId',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'streamId',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streamId',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streamId',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streamId',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streamId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streamUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streamUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streamUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streamUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'streamUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'streamUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'streamUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'streamUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streamUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      streamUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'streamUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subtitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subtitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subtitles',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subtitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subtitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subtitles',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subtitles',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subtitles',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subtitles',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtitles',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtitles',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtitles',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtitles',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtitles',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      subtitlesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'subtitles',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'title',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleEqualTo(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleGreaterThan(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleLessThan(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleBetween(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleStartsWith(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleEndsWith(
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

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      tmdbIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tmdbId',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      tmdbIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tmdbId',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      tmdbIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tmdbId',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      tmdbIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tmdbId',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      tmdbIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tmdbId',
        value: value,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      tmdbIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tmdbId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      watchedDurationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'watchedDuration',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      watchedDurationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'watchedDuration',
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      watchedDurationEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'watchedDuration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      watchedDurationGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'watchedDuration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      watchedDurationLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'watchedDuration',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterFilterCondition>
      watchedDurationBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'watchedDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension SeriesEpisodeQueryObject
    on QueryBuilder<SeriesEpisode, SeriesEpisode, QFilterCondition> {}

extension SeriesEpisodeQueryLinks
    on QueryBuilder<SeriesEpisode, SeriesEpisode, QFilterCondition> {}

extension SeriesEpisodeQuerySortBy
    on QueryBuilder<SeriesEpisode, SeriesEpisode, QSortBy> {
  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByBitrate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bitrate', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByBitrateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bitrate', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByContainerExtension() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerExtension', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByContainerExtensionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerExtension', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByCoverBig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverBig', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByCoverBigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverBig', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByCustomSid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSid', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByCustomSidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSid', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByDirectSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directSource', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByDirectSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directSource', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByDurationSecs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSecs', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByDurationSecsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSecs', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByEpisodeNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeNum', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByEpisodeNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeNum', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByLastWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByLastWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByMovieImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movieImage', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByMovieImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movieImage', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByPlot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plot', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByPlotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plot', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByReleaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByReleaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByStreamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamId', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByStreamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamId', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByStreamUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamUrl', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByStreamUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamUrl', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByTmdbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbId', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> sortByTmdbIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbId', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByWatchedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchedDuration', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      sortByWatchedDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchedDuration', Sort.desc);
    });
  }
}

extension SeriesEpisodeQuerySortThenBy
    on QueryBuilder<SeriesEpisode, SeriesEpisode, QSortThenBy> {
  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByBitrate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bitrate', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByBitrateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bitrate', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByContainerExtension() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerExtension', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByContainerExtensionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'containerExtension', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByCoverBig() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverBig', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByCoverBigDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coverBig', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByCustomSid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSid', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByCustomSidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSid', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByDirectSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directSource', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByDirectSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directSource', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByDurationSecs() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSecs', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByDurationSecsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'durationSecs', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByEpisodeNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeNum', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByEpisodeNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'episodeNum', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByLastWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByLastWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByMovieImage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movieImage', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByMovieImageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'movieImage', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByPlot() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plot', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByPlotDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plot', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByReleaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByReleaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'releaseDate', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenBySeasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'season', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByStreamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamId', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByStreamIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamId', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByStreamUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamUrl', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByStreamUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamUrl', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByTmdbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbId', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy> thenByTmdbIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tmdbId', Sort.desc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByWatchedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchedDuration', Sort.asc);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QAfterSortBy>
      thenByWatchedDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'watchedDuration', Sort.desc);
    });
  }
}

extension SeriesEpisodeQueryWhereDistinct
    on QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> {
  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'added');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByBitrate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bitrate');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct>
      distinctByContainerExtension({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'containerExtension',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByCoverBig(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coverBig', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByCustomSid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customSid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByDirectSource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'directSource', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByDuration(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct>
      distinctByDurationSecs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'durationSecs');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByEpisodeNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'episodeNum');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct>
      distinctByLastWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWatched');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByMovieImage(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'movieImage', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByPlot(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plot', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct>
      distinctByReleaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'releaseDate');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctBySeason() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'season');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByStreamId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streamId');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByStreamUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streamUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctBySubtitles() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subtitles');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct> distinctByTmdbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tmdbId');
    });
  }

  QueryBuilder<SeriesEpisode, SeriesEpisode, QDistinct>
      distinctByWatchedDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'watchedDuration');
    });
  }
}

extension SeriesEpisodeQueryProperty
    on QueryBuilder<SeriesEpisode, SeriesEpisode, QQueryProperty> {
  QueryBuilder<SeriesEpisode, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SeriesEpisode, DateTime?, QQueryOperations> addedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'added');
    });
  }

  QueryBuilder<SeriesEpisode, int?, QQueryOperations> bitrateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bitrate');
    });
  }

  QueryBuilder<SeriesEpisode, String?, QQueryOperations>
      containerExtensionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'containerExtension');
    });
  }

  QueryBuilder<SeriesEpisode, String?, QQueryOperations> coverBigProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coverBig');
    });
  }

  QueryBuilder<SeriesEpisode, String?, QQueryOperations> customSidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customSid');
    });
  }

  QueryBuilder<SeriesEpisode, String?, QQueryOperations>
      directSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'directSource');
    });
  }

  QueryBuilder<SeriesEpisode, String?, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<SeriesEpisode, int?, QQueryOperations> durationSecsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'durationSecs');
    });
  }

  QueryBuilder<SeriesEpisode, int?, QQueryOperations> episodeNumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'episodeNum');
    });
  }

  QueryBuilder<SeriesEpisode, DateTime?, QQueryOperations>
      lastWatchedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWatched');
    });
  }

  QueryBuilder<SeriesEpisode, String?, QQueryOperations> movieImageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'movieImage');
    });
  }

  QueryBuilder<SeriesEpisode, String?, QQueryOperations> plotProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plot');
    });
  }

  QueryBuilder<SeriesEpisode, double?, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<SeriesEpisode, DateTime?, QQueryOperations>
      releaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'releaseDate');
    });
  }

  QueryBuilder<SeriesEpisode, int?, QQueryOperations> seasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'season');
    });
  }

  QueryBuilder<SeriesEpisode, int?, QQueryOperations> streamIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streamId');
    });
  }

  QueryBuilder<SeriesEpisode, String, QQueryOperations> streamUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streamUrl');
    });
  }

  QueryBuilder<SeriesEpisode, List<String>, QQueryOperations>
      subtitlesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subtitles');
    });
  }

  QueryBuilder<SeriesEpisode, String?, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<SeriesEpisode, int?, QQueryOperations> tmdbIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tmdbId');
    });
  }

  QueryBuilder<SeriesEpisode, double?, QQueryOperations>
      watchedDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'watchedDuration');
    });
  }
}
