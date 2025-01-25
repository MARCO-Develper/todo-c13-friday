import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_c13_friday/firebase/firebase_manger.dart';
import 'package:todo_c13_friday/models/task_model.dart';
import 'package:todo_c13_friday/screens/create_event.dart';
import 'package:todo_c13_friday/screens/home/tabs/home_tab/edit_task_screen.dart';

class EventItem extends StatelessWidget {
  TaskModel model;

  EventItem({super.key, required this.model});

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
                      "assets/images/${model.category}.png",
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
                      Expanded(
                        child: Text("${model.title} ",
                            style: Theme.of(context).textTheme.titleSmall),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditTaskScreen(model: model),
                              ),
                            );
                          },
                          child: const Icon(Icons.edit),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: InkWell(
                            onTap: () {
                              FirebaseManger.deleteTask(model.id);
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.favorite_rounded,
                          color: Colors.deepPurple,
                        ),
                      ),
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
                    formatDateTime(model.date).split(",")[0].substring(8, 10),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    formatDateTime(model.date)
                        .split(",")[2]
                        .trim()
                        .substring(0, 3),
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

  String formatDateTime(int milliseconds) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);

    DateFormat formatter = DateFormat("yyyy-MM-dd, EEE, MMMM");

    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }
}
