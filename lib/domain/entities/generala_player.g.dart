// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generala_player.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGeneralaPlayerCollection on Isar {
  IsarCollection<GeneralaPlayer> get generalaPlayers => this.collection();
}

const GeneralaPlayerSchema = CollectionSchema(
  name: r'GeneralaPlayer',
  id: -3515412401657971271,
  properties: {
    r'double': PropertySchema(
      id: 0,
      name: r'double',
      type: IsarType.object,
      target: r'GeneralaCell',
    ),
    r'fiveRow': PropertySchema(
      id: 1,
      name: r'fiveRow',
      type: IsarType.object,
      target: r'GeneralaCell',
    ),
    r'fourRow': PropertySchema(
      id: 2,
      name: r'fourRow',
      type: IsarType.object,
      target: r'GeneralaCell',
    ),
    r'full': PropertySchema(
      id: 3,
      name: r'full',
      type: IsarType.object,
      target: r'GeneralaCell',
    ),
    r'generala': PropertySchema(
      id: 4,
      name: r'generala',
      type: IsarType.object,
      target: r'GeneralaCell',
    ),
    r'globalScore': PropertySchema(
      id: 5,
      name: r'globalScore',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'oneRow': PropertySchema(
      id: 7,
      name: r'oneRow',
      type: IsarType.object,
      target: r'GeneralaCell',
    ),
    r'poker': PropertySchema(
      id: 8,
      name: r'poker',
      type: IsarType.object,
      target: r'GeneralaCell',
    ),
    r'sixRow': PropertySchema(
      id: 9,
      name: r'sixRow',
      type: IsarType.object,
      target: r'GeneralaCell',
    ),
    r'straight': PropertySchema(
      id: 10,
      name: r'straight',
      type: IsarType.object,
      target: r'GeneralaCell',
    ),
    r'threeRow': PropertySchema(
      id: 11,
      name: r'threeRow',
      type: IsarType.object,
      target: r'GeneralaCell',
    ),
    r'twoRow': PropertySchema(
      id: 12,
      name: r'twoRow',
      type: IsarType.object,
      target: r'GeneralaCell',
    )
  },
  estimateSize: _generalaPlayerEstimateSize,
  serialize: _generalaPlayerSerialize,
  deserialize: _generalaPlayerDeserialize,
  deserializeProp: _generalaPlayerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'GeneralaCell': GeneralaCellSchema},
  getId: _generalaPlayerGetId,
  getLinks: _generalaPlayerGetLinks,
  attach: _generalaPlayerAttach,
  version: '3.1.0+1',
);

int _generalaPlayerEstimateSize(
  GeneralaPlayer object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.double, allOffsets[GeneralaCell]!, allOffsets);
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.fiveRow, allOffsets[GeneralaCell]!, allOffsets);
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.fourRow, allOffsets[GeneralaCell]!, allOffsets);
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.full, allOffsets[GeneralaCell]!, allOffsets);
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.generala, allOffsets[GeneralaCell]!, allOffsets);
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.oneRow, allOffsets[GeneralaCell]!, allOffsets);
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.poker, allOffsets[GeneralaCell]!, allOffsets);
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.sixRow, allOffsets[GeneralaCell]!, allOffsets);
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.straight, allOffsets[GeneralaCell]!, allOffsets);
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.threeRow, allOffsets[GeneralaCell]!, allOffsets);
  bytesCount += 3 +
      GeneralaCellSchema.estimateSize(
          object.twoRow, allOffsets[GeneralaCell]!, allOffsets);
  return bytesCount;
}

void _generalaPlayerSerialize(
  GeneralaPlayer object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<GeneralaCell>(
    offsets[0],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.double,
  );
  writer.writeObject<GeneralaCell>(
    offsets[1],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.fiveRow,
  );
  writer.writeObject<GeneralaCell>(
    offsets[2],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.fourRow,
  );
  writer.writeObject<GeneralaCell>(
    offsets[3],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.full,
  );
  writer.writeObject<GeneralaCell>(
    offsets[4],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.generala,
  );
  writer.writeLong(offsets[5], object.globalScore);
  writer.writeString(offsets[6], object.name);
  writer.writeObject<GeneralaCell>(
    offsets[7],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.oneRow,
  );
  writer.writeObject<GeneralaCell>(
    offsets[8],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.poker,
  );
  writer.writeObject<GeneralaCell>(
    offsets[9],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.sixRow,
  );
  writer.writeObject<GeneralaCell>(
    offsets[10],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.straight,
  );
  writer.writeObject<GeneralaCell>(
    offsets[11],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.threeRow,
  );
  writer.writeObject<GeneralaCell>(
    offsets[12],
    allOffsets,
    GeneralaCellSchema.serialize,
    object.twoRow,
  );
}

GeneralaPlayer _generalaPlayerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GeneralaPlayer(
    double: reader.readObjectOrNull<GeneralaCell>(
          offsets[0],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
    fiveRow: reader.readObjectOrNull<GeneralaCell>(
          offsets[1],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
    fourRow: reader.readObjectOrNull<GeneralaCell>(
          offsets[2],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
    full: reader.readObjectOrNull<GeneralaCell>(
          offsets[3],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
    generala: reader.readObjectOrNull<GeneralaCell>(
          offsets[4],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
    name: reader.readStringOrNull(offsets[6]) ?? 'player',
    oneRow: reader.readObjectOrNull<GeneralaCell>(
          offsets[7],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
    poker: reader.readObjectOrNull<GeneralaCell>(
          offsets[8],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
    sixRow: reader.readObjectOrNull<GeneralaCell>(
          offsets[9],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
    straight: reader.readObjectOrNull<GeneralaCell>(
          offsets[10],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
    threeRow: reader.readObjectOrNull<GeneralaCell>(
          offsets[11],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
    twoRow: reader.readObjectOrNull<GeneralaCell>(
          offsets[12],
          GeneralaCellSchema.deserialize,
          allOffsets,
        ) ??
        const GeneralaCell(),
  );
  object.id = id;
  return object;
}

P _generalaPlayerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    case 1:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    case 2:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    case 3:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    case 4:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset) ?? 'player') as P;
    case 7:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    case 8:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    case 9:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    case 10:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    case 11:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    case 12:
      return (reader.readObjectOrNull<GeneralaCell>(
            offset,
            GeneralaCellSchema.deserialize,
            allOffsets,
          ) ??
          const GeneralaCell()) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _generalaPlayerGetId(GeneralaPlayer object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _generalaPlayerGetLinks(GeneralaPlayer object) {
  return [];
}

void _generalaPlayerAttach(
    IsarCollection<dynamic> col, Id id, GeneralaPlayer object) {
  object.id = id;
}

extension GeneralaPlayerQueryWhereSort
    on QueryBuilder<GeneralaPlayer, GeneralaPlayer, QWhere> {
  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GeneralaPlayerQueryWhere
    on QueryBuilder<GeneralaPlayer, GeneralaPlayer, QWhereClause> {
  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterWhereClause> idBetween(
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

extension GeneralaPlayerQueryFilter
    on QueryBuilder<GeneralaPlayer, GeneralaPlayer, QFilterCondition> {
  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      globalScoreEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'globalScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      globalScoreGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'globalScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      globalScoreLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'globalScore',
        value: value,
      ));
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      globalScoreBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'globalScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> idBetween(
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

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      nameEqualTo(
    String value, {
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

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      nameGreaterThan(
    String value, {
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

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      nameLessThan(
    String value, {
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

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      nameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      nameStartsWith(
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

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      nameEndsWith(
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

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension GeneralaPlayerQueryObject
    on QueryBuilder<GeneralaPlayer, GeneralaPlayer, QFilterCondition> {
  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> double(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'double');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> fiveRow(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'fiveRow');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> fourRow(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'fourRow');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> full(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'full');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> generala(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'generala');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> oneRow(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'oneRow');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> poker(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'poker');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> sixRow(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'sixRow');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> straight(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'straight');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> threeRow(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'threeRow');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterFilterCondition> twoRow(
      FilterQuery<GeneralaCell> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'twoRow');
    });
  }
}

extension GeneralaPlayerQueryLinks
    on QueryBuilder<GeneralaPlayer, GeneralaPlayer, QFilterCondition> {}

extension GeneralaPlayerQuerySortBy
    on QueryBuilder<GeneralaPlayer, GeneralaPlayer, QSortBy> {
  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterSortBy>
      sortByGlobalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalScore', Sort.asc);
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterSortBy>
      sortByGlobalScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalScore', Sort.desc);
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GeneralaPlayerQuerySortThenBy
    on QueryBuilder<GeneralaPlayer, GeneralaPlayer, QSortThenBy> {
  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterSortBy>
      thenByGlobalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalScore', Sort.asc);
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterSortBy>
      thenByGlobalScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalScore', Sort.desc);
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension GeneralaPlayerQueryWhereDistinct
    on QueryBuilder<GeneralaPlayer, GeneralaPlayer, QDistinct> {
  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QDistinct>
      distinctByGlobalScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'globalScore');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaPlayer, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension GeneralaPlayerQueryProperty
    on QueryBuilder<GeneralaPlayer, GeneralaPlayer, QQueryProperty> {
  QueryBuilder<GeneralaPlayer, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations>
      doubleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'double');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations>
      fiveRowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fiveRow');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations>
      fourRowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fourRow');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations> fullProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'full');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations>
      generalaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'generala');
    });
  }

  QueryBuilder<GeneralaPlayer, int, QQueryOperations> globalScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'globalScore');
    });
  }

  QueryBuilder<GeneralaPlayer, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations>
      oneRowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oneRow');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations> pokerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'poker');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations>
      sixRowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sixRow');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations>
      straightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'straight');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations>
      threeRowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'threeRow');
    });
  }

  QueryBuilder<GeneralaPlayer, GeneralaCell, QQueryOperations>
      twoRowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'twoRow');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const GeneralaCellSchema = Schema(
  name: r'GeneralaCell',
  id: -3598981277026223026,
  properties: {
    r'isCrossedOut': PropertySchema(
      id: 0,
      name: r'isCrossedOut',
      type: IsarType.bool,
    ),
    r'value': PropertySchema(
      id: 1,
      name: r'value',
      type: IsarType.long,
    )
  },
  estimateSize: _generalaCellEstimateSize,
  serialize: _generalaCellSerialize,
  deserialize: _generalaCellDeserialize,
  deserializeProp: _generalaCellDeserializeProp,
);

int _generalaCellEstimateSize(
  GeneralaCell object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _generalaCellSerialize(
  GeneralaCell object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.isCrossedOut);
  writer.writeLong(offsets[1], object.value);
}

GeneralaCell _generalaCellDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GeneralaCell(
    isCrossedOut: reader.readBoolOrNull(offsets[0]) ?? false,
    value: reader.readLongOrNull(offsets[1]) ?? 0,
  );
  return object;
}

P _generalaCellDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension GeneralaCellQueryFilter
    on QueryBuilder<GeneralaCell, GeneralaCell, QFilterCondition> {
  QueryBuilder<GeneralaCell, GeneralaCell, QAfterFilterCondition>
      isCrossedOutEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCrossedOut',
        value: value,
      ));
    });
  }

  QueryBuilder<GeneralaCell, GeneralaCell, QAfterFilterCondition> valueEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<GeneralaCell, GeneralaCell, QAfterFilterCondition>
      valueGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<GeneralaCell, GeneralaCell, QAfterFilterCondition> valueLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
      ));
    });
  }

  QueryBuilder<GeneralaCell, GeneralaCell, QAfterFilterCondition> valueBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GeneralaCellQueryObject
    on QueryBuilder<GeneralaCell, GeneralaCell, QFilterCondition> {}
