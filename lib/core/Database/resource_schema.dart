import 'package:isar/isar.dart';

part 'resource_schema.g.dart';

@collection
class Resource {
  Id id = Isar.autoIncrement;
  String? label;

  work? w;
  material? m;
  cost? c;

  int? repeat;
}

//Embedded work,cost,material on Resource.
@embedded
class work {
  double? $_per_hr;
  double? ovt$_per_hr;
  double? percentage_avaliablity;
}

@embedded
class material {
  int? quantity;
  double? cost_per_quant;
}

@embedded
class cost {
  double? price;
}
