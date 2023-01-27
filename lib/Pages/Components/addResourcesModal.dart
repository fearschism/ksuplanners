import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ksuplanners/core/Database/resource_schema.dart';
import 'package:ksuplanners/core/Services/db_controllers.dart';

TextEditingController $PerHrCtrl = TextEditingController();
TextEditingController $OvtPerHrCtrl = TextEditingController();
TextEditingController maxPercCtrl = TextEditingController();

TextEditingController qtyCtrl = TextEditingController();
TextEditingController $PerQtyCtrl = TextEditingController();

TextEditingController costCtrl = TextEditingController();
final _formKey = GlobalKey<FormState>();

class AddResourcesModal extends StatefulWidget {
  final SaadDBCoreCalls db;

  const AddResourcesModal({Key? key, required this.db}) : super(key: key);

  @override
  _AddResourcesModalState createState() => _AddResourcesModalState();
}

class _AddResourcesModalState extends State<AddResourcesModal> {
  late int defaultChoiceIndex;
  late String? _name;

  //States Controlling the Conditional Handling of the type of task.
  late double? _perhrState;
  late double? _OvtperhrState;
  late double? _MaxpercState;
  late int? _QtyState;
  late double? _perQtyState;
  late double? _CostState;
  late TextEditingController $PerHrCtrl = TextEditingController();
  late TextEditingController $OvtPerHrCtrl = TextEditingController();
  late TextEditingController maxPercCtrl = TextEditingController();

  late TextEditingController qtyCtrl = TextEditingController();
  late TextEditingController $PerQtyCtrl = TextEditingController();

  TextEditingController costCtrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    defaultChoiceIndex = 0;
    _name = null;

    _perhrState = null;
    _OvtperhrState = null;
    _MaxpercState = null;
    _QtyState = null;
    _perQtyState = null;
    _CostState = null;

    $PerHrCtrl.clear();
    $OvtPerHrCtrl.clear();
    maxPercCtrl.clear();

    qtyCtrl.clear();

    $PerQtyCtrl.clear();

    costCtrl.clear();

    print("State init");
  }

  @override
  Widget build(BuildContext context) {
    var _choicesList = ["Work", "Material", "Cost"];
    return Dialog(
      insetPadding: EdgeInsets.all(MediaQuery.of(context).size.width / 10),
      elevation: 10,
      child: Padding(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              width: MediaQuery.of(context).size.width / 5,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      offset: Offset(2.0, 2.0),
                      blurRadius: 30.0,
                      color: Colors.blueGrey,
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Add Resources",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color.fromARGB(156, 255, 255, 255),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("You must pick a name,Type and prices to add!"),
            SizedBox(
              height: 15,
            ),
            Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              onChanged: (value) {
                                String regex = r'^[a-zA-Z0-9_ ]*$';
                                RegExp match = RegExp(regex);
                                if (value.characters.length >= 3 &&
                                    match.hasMatch(value)) {
                                  setState(() {
                                    _name = value.trim();
                                  });
                                } else {
                                  setState(() {
                                    _name = null;
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: 'Enter your resource name',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Wrap(
                      spacing: 8,
                      children: List.generate(_choicesList.length, (index) {
                        return RawChip(
                          showCheckmark: false,
                          labelPadding: EdgeInsets.all(2.0),
                          label: Text(
                            _choicesList[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.white, fontSize: 14),
                          ),
                          selected: defaultChoiceIndex == index,
                          selectedColor: Colors.blueGrey,
                          onSelected: (value) {
                            setState(() {
                              defaultChoiceIndex =
                                  value ? index : defaultChoiceIndex;

                              if (defaultChoiceIndex == 0) {}
                            });
                          },
                          backgroundColor: Colors.blueGrey.withOpacity(0.3),
                          elevation: 1,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                        );
                      }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (defaultChoiceIndex == 0) ...[
                            Flexible(
                              child: TextFormField(
                                controller: $PerHrCtrl,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    setState(() {
                                      _perhrState = null;
                                    });
                                  } else {
                                    setState(() {
                                      _perhrState = double.parse(value);
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Price/hr",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: TextFormField(
                                controller: $OvtPerHrCtrl,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    setState(() {
                                      _OvtperhrState = null;
                                    });
                                  } else {
                                    setState(() {
                                      _OvtperhrState = double.parse(value);
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Overtime hours",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: TextFormField(
                                controller: maxPercCtrl,
                                onChanged: (value) {
                                  if (value.isEmpty ||
                                      (value.length > 2 && value != "100")) {
                                    setState(() {
                                      _MaxpercState = null;
                                    });
                                  } else {
                                    setState(() {
                                      _MaxpercState = double.parse(value);
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Maxiumum %",
                                ),
                              ),
                            )
                          ] else if (defaultChoiceIndex == 1) ...[
                            Flexible(
                              child: TextFormField(
                                controller: qtyCtrl,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    setState(() {
                                      _QtyState = null;
                                    });
                                  } else {
                                    setState(() {
                                      _QtyState = int.parse(value);
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Quantity of resources",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              child: TextFormField(
                                controller: $PerQtyCtrl,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    setState(() {
                                      _perQtyState = null;
                                    });
                                  } else {
                                    setState(() {
                                      _perQtyState = double.parse(value);
                                    });
                                  }
                                },
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Price/Qty",
                                ),
                              ),
                            ),
                          ] else ...[
                            Flexible(
                              child: TextFormField(
                                controller: costCtrl,
                                onChanged: (value) {
                                  if (value.isEmpty) {
                                    setState(() {
                                      _CostState = null;
                                    });
                                  } else {
                                    setState(() {
                                      _CostState = double.parse(value);
                                    });
                                  }
                                },
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: "Cost of Resource",
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ),
                    if (defaultChoiceIndex == 0 &&
                        _name != null &&
                        _perhrState != null &&
                        _OvtperhrState != null &&
                        _MaxpercState != null)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton.icon(
                              icon: Icon(Icons.add),
                              label: Text("Add Work"),
                              onPressed: () {
                                work wTemp = work()
                                  ..$_per_hr = _perhrState
                                  ..ovt$_per_hr = _OvtperhrState
                                  ..percentage_avaliablity = _MaxpercState;

                                Resource res = Resource()
                                  ..w = wTemp
                                  ..label = _name;

                                widget.db.insertResource(res);

                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    if (defaultChoiceIndex == 1 &&
                        _name != null &&
                        _QtyState != null &&
                        _perQtyState != null)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton.icon(
                              icon: Icon(Icons.add),
                              label: Text("Add Material"),
                              onPressed: () {
                                material materialTemp = material()
                                  ..cost_per_quant = _perQtyState
                                  ..quantity = _QtyState;

                                Resource res = Resource()
                                  ..m = materialTemp
                                  ..label = _name;

                                widget.db.insertResource(res);

                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    if (defaultChoiceIndex == 2 &&
                        _name != null &&
                        _CostState != null)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton.icon(
                              icon: Icon(Icons.add),
                              label: Text("Add Cost"),
                              onPressed: () {
                                cost costTemp = cost()..price = _CostState;
                                Resource res_temp = Resource()
                                  ..c = costTemp
                                  ..label = _name;
                                widget.db.insertResource(res_temp);

                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                  ],
                )),
          ])),
    );
  }
}
