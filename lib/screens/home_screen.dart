import 'package:flutter/material.dart';
import 'package:navoiy/data/data.dart';
import 'package:navoiy/models/author_model.dart';
import 'package:navoiy/models/data_model.dart';
import 'package:navoiy/service/data_service.dart';
import 'package:navoiy/utils/colors.dart';
import 'package:navoiy/utils/consts.dart';
import 'package:navoiy/utils/styles.dart';
import 'package:navoiy/widgets/footer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              height(8),

              // HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Alisher Navoiy",
                          style: extraLargeTextStyle(color: btnColor)),
                      Text("lirik merosi",
                          style: extraLargeTextStyle(color: btnColor)),
                    ],
                  ),
                  const Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/images/navoiy.png',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  const Spacer(),
                ],
              ),

              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: DataService().getData().length,
                    separatorBuilder: (context, index) {
                      return height(10);
                    },
                    itemBuilder: (context, index) {
                      final data = DataService().getData()[index];
                      return Item(
                          data: data,
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('/chapter', arguments: [data.title, data.data]);
                          });
                    }),
              ),
              height(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Item(
                  author:
                      Author(name: 'Mualliflar', category: Category.student, description: 'Mualliflar'),
                  onTap: () {
                    Navigator.pushNamed(context, '/authors',
                        arguments: DataService().getAuthors());
                  },
                ),
              ),
              const Spacer(),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  const Item({super.key, this.data, this.onTap, this.author});

  final Data? data;
  final Author? author;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Transform(
        transform: Matrix4.skewX(-0.3),
        child: Container(
          width: 400,
          height: 40,
          color: gold,
          child: Center(
            child: Text(
              data?.title?? author?.name ?? "",
              style: smallTextStyle(color: dark),
            ),
          ),
        ),
      ),
    );
  }
}
