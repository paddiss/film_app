import 'package:film_app/card.dart';
import 'package:film_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class FilterMinMax extends StatefulWidget {
  const FilterMinMax({Key? key}) : super(key: key);

  @override
  _FilterMinMaxState createState() => _FilterMinMaxState();
}

class _FilterMinMaxState extends State<FilterMinMax> {
  final _formKey = GlobalKey<FormState>();
  final minController = TextEditingController();
  final maxController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var styleActive = const TextStyle(color: Colors.black);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Filter',
          style: styleActive,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 100,
                  margin: const EdgeInsets.all(16),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(12),
                  //   color: Colors.white,
                  //   border: Border.all(color: Colors.black26),
                  // ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    maxLength: 4,
                    controller: minController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: "Min",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return value = 'Nhập year';
                      }
                    },
                  ),
                ),
                Container(
                  height: 60,
                  width: 100,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextFormField(
                    maxLength: 4,
                    controller: maxController,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      labelText: "Max",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return value = 'Nhập year';
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12),
                  child: TextButton(
                      onPressed: () {
                        movieController.filtMinYean(
                            int.parse(minController.text),
                            int.parse(maxController.text));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      child: Text(
                        'Tìm',
                        style: styleActive,
                      )),
                )
              ],
            ),
            Expanded(
              child: ListView(children: [
                Container(
                  color: Colors.grey[300],
                  child: Obx(
                    () => StaggeredGrid.count(
                      crossAxisCount: 2,
                      children: movieController.movieListFilter
                          .map((movie) => MovieCard(movie: movie))
                          .toList(),
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
