import 'package:flutter/material.dart';
import '../../../widgets/vertical_space.dart';

import '../pizza.dart';
import '../pizza_menu.dart';
import '../pizza_topping_data.dart';
import 'custom_pizza_selection_widget.dart';
import 'pizza_information_widget.dart';
import 'pizza_selection_widget.dart';

class DecoratorPatternWidget extends StatefulWidget {
  @override
  _DecoratorPatternWidgetState createState() => _DecoratorPatternWidgetState();
}

class _DecoratorPatternWidgetState extends State<DecoratorPatternWidget> {
  PizzaMenu pizzaMenu = PizzaMenu();

  late final Map<int, PizzaToppingData> _pizzaToppingsDataMap;
  late Pizza _pizza;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pizzaToppingsDataMap = pizzaMenu.getPizzaToppingDataMap();
    _pizza = pizzaMenu.getPizza(0, _pizzaToppingsDataMap);
  }

  void _setSelectedIndex(int index) {
    setState((){
      _selectedIndex = index;
    });
  }

  void _setSelectedPizza(int index) {
    setState((){
      _pizza = pizzaMenu.getPizza(index, _pizzaToppingsDataMap);
    });
  }

  void _setChipSelected(int index, bool selected) {
    setState(() {
      _pizzaToppingsDataMap[index]!.setSelected(selected);
    });
  }

  void _onSelectedIndexChanged(int index) {
    _setSelectedIndex(index);
    _setSelectedPizza(index);
  }

  void _onCustomPizzaChipSelected(int index, bool selected) {
    _setChipSelected(index, selected);
    _setSelectedPizza(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Select your pizza:',
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          PizzaSelectionWidget(
            selectedIndex: _selectedIndex,
            onChanged: (index) => _onSelectedIndexChanged(index!),
          ),
          PizzaInformationWidget(pizza: _pizza),
          VerticalSpace(16),
          AnimatedOpacity(
            opacity: _selectedIndex == 2 ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: CustomPizzaSelectionWidget(
              pizzaToppingsDataMap: _pizzaToppingsDataMap,
              onSelected: _onCustomPizzaChipSelected,
            ),
          ),
        ],
      ),
    );
  }
}
