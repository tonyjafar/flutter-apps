import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  final Function setFilters;
  final Map<String, bool> filters;
  const FiltersScreen(this.filters, this.setFilters, {super.key});
  static const routeName = "/filters";

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  Widget _buildSwitchTile({
    required String title,
    required String subTitle,
    required bool currentValue,
    required updateValue,
  }) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
          color: Colors.black45,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
        actions: [
          IconButton(
            onPressed: () {
              widget.setFilters(widget.filters);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchTile(
                  title: "Gluten-Free",
                  subTitle: "Only include gluten-free meals.",
                  currentValue: widget.filters['gluten'] as bool,
                  updateValue: (value) => {
                    setState(() {
                      widget.filters['gluten'] = value;
                    })
                  },
                ),
                _buildSwitchTile(
                  title: "Vegetarian",
                  subTitle: "Only include Vegetarian meals.",
                  currentValue: widget.filters['vegetarian'] as bool,
                  updateValue: (value) => {
                    setState(() {
                      widget.filters['vegetarian'] = value;
                    })
                  },
                ),
                _buildSwitchTile(
                  title: "Lactose-Free",
                  subTitle: "Only include Lactose-Free meals.",
                  currentValue: widget.filters['lactose'] as bool,
                  updateValue: (value) => {
                    setState(() {
                      widget.filters['lactose'] = value;
                    })
                  },
                ),
                _buildSwitchTile(
                  title: "Vegan",
                  subTitle: "Only include Vegan meals.",
                  currentValue: widget.filters['vegan'] as bool,
                  updateValue: (value) => {
                    setState(() {
                      widget.filters['vegan'] = value;
                    })
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
