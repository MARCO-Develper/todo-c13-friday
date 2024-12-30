import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: SizedBox(
        height: 260,
        child: Stack(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      "assets/images/birthday.png",
                      fit: BoxFit.fill,
                      height: double.infinity,
                    )),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("This is a Birthday Party ",
                          style: Theme.of(context).textTheme.titleSmall),
                      const Icon(Icons.favorite_border)
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, top: 8),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "20",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    "Dec",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
