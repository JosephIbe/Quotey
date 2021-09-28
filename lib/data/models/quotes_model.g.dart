// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quotes_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuotesModelAdapter extends TypeAdapter<QuotesModel> {
  @override
  final int typeId = 0;

  @override
  QuotesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuotesModel(
      tags: (fields[0] as List)?.cast<String>(),
      id: fields[1] as String,
      author: fields[2] as String,
      content: fields[3] as String,
      authorSlug: fields[4] as String,
      length: fields[5] as int,
      dateAdded: fields[6] as String,
      dateModified: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QuotesModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.tags)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.content)
      ..writeByte(4)
      ..write(obj.authorSlug)
      ..writeByte(5)
      ..write(obj.length)
      ..writeByte(6)
      ..write(obj.dateAdded)
      ..writeByte(7)
      ..write(obj.dateModified);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuotesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
