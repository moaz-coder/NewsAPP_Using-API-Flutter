import 'package:flutter/material.dart';
import 'package:newsapp/Core/Sourcesresponse/Source.dart';

class SourceTab extends StatelessWidget {
  Sources sources;
  bool isSelected;

  SourceTab(this.sources, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Theme.of(context).primaryColor, width: 1),
      ),
      child: Text(
        sources.name ?? "",
        style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor),
      ),
    );
  }
}
