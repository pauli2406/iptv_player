// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetChannelItemCollection on Isar {
  IsarCollection<ChannelItem> get channelItems => this.collection();
}

const ChannelItemSchema = CollectionSchema(
  name: r'ChannelItem',
  id: -6294985922036714573,
  properties: {
    r'added': PropertySchema(
      id: 0,
      name: r'added',
      type: IsarType.dateTime,
    ),
    r'categoryId': PropertySchema(
      id: 1,
      name: r'categoryId',
      type: IsarType.long,
    ),
    r'categoryIds': PropertySchema(
      id: 2,
      name: r'categoryIds',
      type: IsarType.longList,
    ),
    r'customSid': PropertySchema(
      id: 3,
      name: r'customSid',
      type: IsarType.long,
    ),
    r'directSource': PropertySchema(
      id: 4,
      name: r'directSource',
      type: IsarType.string,
    ),
    r'epgChannelId': PropertySchema(
      id: 5,
      name: r'epgChannelId',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 6,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'lastWatched': PropertySchema(
      id: 7,
      name: r'lastWatched',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'num': PropertySchema(
      id: 9,
      name: r'num',
      type: IsarType.long,
    ),
    r'streamIcon': PropertySchema(
      id: 10,
      name: r'streamIcon',
      type: IsarType.string,
    ),
    r'streamType': PropertySchema(
      id: 11,
      name: r'streamType',
      type: IsarType.string,
    ),
    r'streamUrl': PropertySchema(
      id: 12,
      name: r'streamUrl',
      type: IsarType.string,
    ),
    r'thumbnail': PropertySchema(
      id: 13,
      name: r'thumbnail',
      type: IsarType.string,
    ),
    r'tvArchive': PropertySchema(
      id: 14,
      name: r'tvArchive',
      type: IsarType.long,
    ),
    r'tvArchiveDuration': PropertySchema(
      id: 15,
      name: r'tvArchiveDuration',
      type: IsarType.long,
    )
  },
  estimateSize: _channelItemEstimateSize,
  serialize: _channelItemSerialize,
  deserialize: _channelItemDeserialize,
  deserializeProp: _channelItemDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'iptvServer': LinkSchema(
      id: 7146038963453038645,
      name: r'iptvServer',
      target: r'IptvServer',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _channelItemGetId,
  getLinks: _channelItemGetLinks,
  attach: _channelItemAttach,
  version: '3.1.8',
);

int _channelItemEstimateSize(
  ChannelItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoryIds.length * 8;
  {
    final value = object.directSource;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.epgChannelId;
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
    final value = object.streamIcon;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.streamType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.streamUrl.length * 3;
  {
    final value = object.thumbnail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _channelItemSerialize(
  ChannelItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.added);
  writer.writeLong(offsets[1], object.categoryId);
  writer.writeLongList(offsets[2], object.categoryIds);
  writer.writeLong(offsets[3], object.customSid);
  writer.writeString(offsets[4], object.directSource);
  writer.writeString(offsets[5], object.epgChannelId);
  writer.writeBool(offsets[6], object.isFavorite);
  writer.writeDateTime(offsets[7], object.lastWatched);
  writer.writeString(offsets[8], object.name);
  writer.writeLong(offsets[9], object.num);
  writer.writeString(offsets[10], object.streamIcon);
  writer.writeString(offsets[11], object.streamType);
  writer.writeString(offsets[12], object.streamUrl);
  writer.writeString(offsets[13], object.thumbnail);
  writer.writeLong(offsets[14], object.tvArchive);
  writer.writeLong(offsets[15], object.tvArchiveDuration);
}

ChannelItem _channelItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ChannelItem(
    added: reader.readDateTimeOrNull(offsets[0]),
    categoryId: reader.readLongOrNull(offsets[1]),
    categoryIds: reader.readLongList(offsets[2]) ?? [],
    customSid: reader.readLongOrNull(offsets[3]),
    directSource: reader.readStringOrNull(offsets[4]),
    epgChannelId: reader.readStringOrNull(offsets[5]),
    id: id,
    isFavorite: reader.readBoolOrNull(offsets[6]) ?? false,
    name: reader.readStringOrNull(offsets[8]),
    num: reader.readLongOrNull(offsets[9]),
    streamIcon: reader.readStringOrNull(offsets[10]),
    streamType: reader.readStringOrNull(offsets[11]),
    streamUrl: reader.readString(offsets[12]),
    thumbnail: reader.readStringOrNull(offsets[13]),
    tvArchive: reader.readLongOrNull(offsets[14]),
    tvArchiveDuration: reader.readLongOrNull(offsets[15]),
  );
  object.lastWatched = reader.readDateTimeOrNull(offsets[7]);
  return object;
}

P _channelItemDeserializeProp<P>(
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
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 7:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readLongOrNull(offset)) as P;
    case 15:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _channelItemGetId(ChannelItem object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _channelItemGetLinks(ChannelItem object) {
  return [object.iptvServer];
}

void _channelItemAttach(
    IsarCollection<dynamic> col, Id id, ChannelItem object) {
  object.id = id;
  object.iptvServer
      .attach(col, col.isar.collection<IptvServer>(), r'iptvServer', id);
}

extension ChannelItemQueryWhereSort
    on QueryBuilder<ChannelItem, ChannelItem, QWhere> {
  QueryBuilder<ChannelItem, ChannelItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ChannelItemQueryWhere
    on QueryBuilder<ChannelItem, ChannelItem, QWhereClause> {
  QueryBuilder<ChannelItem, ChannelItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterWhereClause> idBetween(
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

extension ChannelItemQueryFilter
    on QueryBuilder<ChannelItem, ChannelItem, QFilterCondition> {
  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> addedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'added',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      addedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'added',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> addedEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'added',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> addedLessThan(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> addedBetween(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      categoryIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoryId',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      categoryIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoryId',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      categoryIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryId',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      categoryIdBetween(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      categoryIdsElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryIds',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      customSidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customSid',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      customSidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customSid',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      customSidEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customSid',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      customSidGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customSid',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      customSidLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customSid',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      customSidBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customSid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      directSourceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'directSource',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      directSourceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'directSource',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      directSourceContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'directSource',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      directSourceMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'directSource',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      directSourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'directSource',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      directSourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'directSource',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'epgChannelId',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'epgChannelId',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'epgChannelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'epgChannelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'epgChannelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'epgChannelId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'epgChannelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'epgChannelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'epgChannelId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'epgChannelId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'epgChannelId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      epgChannelIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'epgChannelId',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> idEqualTo(
      Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      isFavoriteEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      lastWatchedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastWatched',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      lastWatchedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastWatched',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      lastWatchedEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastWatched',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> nameContains(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> numIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'num',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> numIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'num',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> numEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> numGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> numLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'num',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> numBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'num',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'streamIcon',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'streamIcon',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streamIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streamIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streamIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streamIcon',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'streamIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'streamIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'streamIcon',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'streamIcon',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streamIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamIconIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'streamIcon',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'streamType',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'streamType',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streamType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streamType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streamType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streamType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'streamType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'streamType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'streamType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'streamType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streamType',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'streamType',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
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

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'streamUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'streamUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streamUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      streamUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'streamUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thumbnail',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thumbnail',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbnail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbnail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbnail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      thumbnailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbnail',
        value: '',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tvArchive',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tvArchive',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tvArchive',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tvArchive',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tvArchive',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tvArchive',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveDurationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tvArchiveDuration',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveDurationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tvArchiveDuration',
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveDurationEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tvArchiveDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveDurationGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tvArchiveDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveDurationLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tvArchiveDuration',
        value: value,
      ));
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      tvArchiveDurationBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tvArchiveDuration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ChannelItemQueryObject
    on QueryBuilder<ChannelItem, ChannelItem, QFilterCondition> {}

extension ChannelItemQueryLinks
    on QueryBuilder<ChannelItem, ChannelItem, QFilterCondition> {
  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition> iptvServer(
      FilterQuery<IptvServer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'iptvServer');
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterFilterCondition>
      iptvServerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'iptvServer', 0, true, 0, true);
    });
  }
}

extension ChannelItemQuerySortBy
    on QueryBuilder<ChannelItem, ChannelItem, QSortBy> {
  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByCustomSid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSid', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByCustomSidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSid', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByDirectSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directSource', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy>
      sortByDirectSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directSource', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByEpgChannelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epgChannelId', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy>
      sortByEpgChannelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epgChannelId', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByLastWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByLastWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByStreamIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamIcon', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByStreamIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamIcon', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByStreamType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamType', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByStreamTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamType', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByStreamUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamUrl', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByStreamUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamUrl', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByTvArchive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvArchive', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> sortByTvArchiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvArchive', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy>
      sortByTvArchiveDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvArchiveDuration', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy>
      sortByTvArchiveDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvArchiveDuration', Sort.desc);
    });
  }
}

extension ChannelItemQuerySortThenBy
    on QueryBuilder<ChannelItem, ChannelItem, QSortThenBy> {
  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByAddedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'added', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByCategoryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryId', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByCustomSid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSid', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByCustomSidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customSid', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByDirectSource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directSource', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy>
      thenByDirectSourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'directSource', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByEpgChannelId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epgChannelId', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy>
      thenByEpgChannelIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'epgChannelId', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByLastWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByLastWatchedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastWatched', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByNumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'num', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByStreamIcon() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamIcon', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByStreamIconDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamIcon', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByStreamType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamType', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByStreamTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamType', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByStreamUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamUrl', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByStreamUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streamUrl', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByThumbnail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByThumbnailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnail', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByTvArchive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvArchive', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy> thenByTvArchiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvArchive', Sort.desc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy>
      thenByTvArchiveDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvArchiveDuration', Sort.asc);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QAfterSortBy>
      thenByTvArchiveDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tvArchiveDuration', Sort.desc);
    });
  }
}

extension ChannelItemQueryWhereDistinct
    on QueryBuilder<ChannelItem, ChannelItem, QDistinct> {
  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByAdded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'added');
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByCategoryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryId');
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByCategoryIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryIds');
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByCustomSid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customSid');
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByDirectSource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'directSource', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByEpgChannelId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'epgChannelId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByLastWatched() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastWatched');
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByNum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'num');
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByStreamIcon(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streamIcon', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByStreamType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streamType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByStreamUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streamUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByThumbnail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbnail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct> distinctByTvArchive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tvArchive');
    });
  }

  QueryBuilder<ChannelItem, ChannelItem, QDistinct>
      distinctByTvArchiveDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tvArchiveDuration');
    });
  }
}

extension ChannelItemQueryProperty
    on QueryBuilder<ChannelItem, ChannelItem, QQueryProperty> {
  QueryBuilder<ChannelItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ChannelItem, DateTime?, QQueryOperations> addedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'added');
    });
  }

  QueryBuilder<ChannelItem, int?, QQueryOperations> categoryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryId');
    });
  }

  QueryBuilder<ChannelItem, List<int>, QQueryOperations> categoryIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryIds');
    });
  }

  QueryBuilder<ChannelItem, int?, QQueryOperations> customSidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customSid');
    });
  }

  QueryBuilder<ChannelItem, String?, QQueryOperations> directSourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'directSource');
    });
  }

  QueryBuilder<ChannelItem, String?, QQueryOperations> epgChannelIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'epgChannelId');
    });
  }

  QueryBuilder<ChannelItem, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<ChannelItem, DateTime?, QQueryOperations> lastWatchedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastWatched');
    });
  }

  QueryBuilder<ChannelItem, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<ChannelItem, int?, QQueryOperations> numProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'num');
    });
  }

  QueryBuilder<ChannelItem, String?, QQueryOperations> streamIconProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streamIcon');
    });
  }

  QueryBuilder<ChannelItem, String?, QQueryOperations> streamTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streamType');
    });
  }

  QueryBuilder<ChannelItem, String, QQueryOperations> streamUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streamUrl');
    });
  }

  QueryBuilder<ChannelItem, String?, QQueryOperations> thumbnailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbnail');
    });
  }

  QueryBuilder<ChannelItem, int?, QQueryOperations> tvArchiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tvArchive');
    });
  }

  QueryBuilder<ChannelItem, int?, QQueryOperations>
      tvArchiveDurationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tvArchiveDuration');
    });
  }
}
