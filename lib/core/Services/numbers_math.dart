import 'package:flutter/material.dart';

import '../Database/resource_schema.dart';

class SaadMath {
  double calcWork(DateTime start, DateTime end, work w) {
    //calculates business days total
    int days = DateTimeRange(start: start, end: end).duration.inDays;

    int hours = days * 8;

    return ((w.$_per_hr! * hours) + ((w.$_per_hr! * 1.5) * w.ovt$_per_hr!)) *
        (w.percentage_avaliablity! / 100);
  }
}
