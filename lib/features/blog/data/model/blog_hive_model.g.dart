// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BlogPostHiveModelAdapter extends TypeAdapter<BlogPostHiveModel> {
  @override
  final int typeId = 0;

  @override
  BlogPostHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BlogPostHiveModel(
      id: fields[0] as String,
      title: fields[1] as String,
      desc: fields[2] as String,
      photo: fields[3] as String?,
      username: fields[4] as String,
      userId: fields[5] as String,
      categories: (fields[6] as List).cast<String>(),
      createdAt: fields[7] as String,
      updatedAt: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BlogPostHiveModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.username)
      ..writeByte(5)
      ..write(obj.userId)
      ..writeByte(6)
      ..write(obj.categories)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BlogPostHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
