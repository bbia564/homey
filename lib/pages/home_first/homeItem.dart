import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_restoratives/db_restorative/home_entity.dart';
import 'package:styled_widget/styled_widget.dart';

class HomeItem extends StatelessWidget {
  const HomeItem(this.entity, {Key? key}) : super(key: key);
  final HomeEntity entity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      child: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.memory(
            entity.image,
            width: 109,
            height: 85,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: <Widget>[
          Text(
            entity.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 20,),
          <Widget>[
            const Text(
              'Shelf life',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              entity.finishTimeString,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            )
          ].toColumn(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start)
        ].toColumn(mainAxisAlignment: MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.start))
      ].toRow(),
    )
        .decorated(color: Colors.white, borderRadius: BorderRadius.circular(15))
        .marginOnly(bottom: 10);
  }
}
