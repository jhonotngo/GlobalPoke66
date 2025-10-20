import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:global66/src/constants/color.dart';
import 'package:global66/src/widgets/enum_values.dart';

class TypesBottomModal extends StatefulWidget {
  final List<String> selectedTypes;
  final Function(List<String>) onApply;

  const TypesBottomModal({
    super.key,
    required this.selectedTypes,
    required this.onApply,
  });

  @override
  State<TypesBottomModal> createState() => _PokemonFilterModalState();
}

class _PokemonFilterModalState extends State<TypesBottomModal> {
  late List<String> _selectedTypes;
  bool _isExpanded = true;

  @override
  void initState() {
    super.initState();
    _selectedTypes = List.from(widget.selectedTypes);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              Center(
                child: Text(
                  FlutterI18n.translate(
                    context,
                    'widgets.filter_type_bottom_modal.title',
                  ),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          // Types section
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FlutterI18n.translate(
                                    context,
                                    'widgets.filter_type_bottom_modal.type',
                                  ),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  _isExpanded
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                ),
                              ],
                            ),
                          ),
                          Divider(height: 0.5),
                        ],
                      ),
                    ),
                  ),
                  if (_isExpanded)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: PokemonTypeList.values.length,
                      itemBuilder: (context, index) {
                        var pokemonTypeEnumValues = <List>[];
                        for (var value in PokemonTypeList.values) {
                          pokemonTypeEnumValues.add([
                            value.name,
                            FlutterI18n.translate(
                              context,
                              "pokemon_types.${value.name}",
                            ).toLowerCase(),
                          ]);
                        }
                        pokemonTypeEnumValues.sort(
                          (a, b) => (a[0].toLowerCase().compareTo(
                            b[0].toLowerCase(),
                          )),
                        );

                        final type = pokemonTypeEnumValues[index];
                        final isSelected = _selectedTypes.contains(type[0]);

                        return Align(
                          alignment: Alignment.centerRight,
                          child: CheckboxListTile(
                            title: Text(
                              type[1][0].toUpperCase() +
                                  type[1].substring(1).toLowerCase(),
                            ),
                            value: isSelected,
                            activeColor: kCheckboxSelected,
                            checkColor: Colors.white,
                            controlAffinity: ListTileControlAffinity.trailing,
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  _selectedTypes.add(type[0]);
                                } else {
                                  _selectedTypes.remove(type[0]);
                                }
                              });
                            },
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
          Divider(height: 0.5),
          // Buttons
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onApply(_selectedTypes);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      FlutterI18n.translate(
                        context,
                        'widgets.filter_type_bottom_modal.apply',
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _selectedTypes.clear();
                      });
                      widget.onApply([]);
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      FlutterI18n.translate(
                        context,
                        'widgets.filter_type_bottom_modal.cancel',
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
