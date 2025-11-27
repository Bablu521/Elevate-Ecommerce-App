import 'dart:convert';
import 'package:elevate_ecommerce_app/api/models/area_dto.dart';
import 'package:elevate_ecommerce_app/api/models/city_dto.dart';
import 'package:elevate_ecommerce_app/data/data_source/address_local_data_source.dart';
import 'package:elevate_ecommerce_app/domin/entities/area_entity.dart';
import 'package:elevate_ecommerce_app/domin/entities/city_entity.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddressLocalDataSource)
class AddressLocalDataSourceImpl implements AddressLocalDataSource{

  @override
  Future<List<CityEntity>> loadAllCities() async {
     try {
      final jsonString = await rootBundle.loadString('assets/files/cities.json');
      final List<dynamic> data = json.decode(jsonString)[2]['data'];
      return data.map((e) => CityDto.fromJson(e).toEntity()).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<AreaEntity>> loadAllAreas() async {
     try {
      final jsonString = await rootBundle.loadString('assets/files/states.json');
      final List<dynamic> data = json.decode(jsonString)[2]['data'];
      return data.map((e) => AreaDto.fromJson(e).toEntity()).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}