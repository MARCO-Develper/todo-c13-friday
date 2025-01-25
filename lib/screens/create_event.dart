import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_friday/firebase/firebase_manger.dart';
import 'package:todo_c13_friday/models/task_model.dart';
import 'package:todo_c13_friday/providers/create_event_provider.dart';
import 'package:todo_c13_friday/widgets/category_event_item.dart';

class CreateEvent extends StatelessWidget {
  static const String routeName = "CreateEventScreen";

  CreateEvent({super.key});

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateEventProvider(),
      builder: (context, child) {
        var provider = Provider.of<CreateEventProvider>(context);
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            title: Text(
              "Create Event",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        "assets/images/${provider.eventCategories[provider.selectedCategory]}.png",
                        height: 220,
                        fit: BoxFit.fill,
                      )),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 16,
                      ),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            provider.changeCategory(index);
                          },
                          child: CategoryEventItem(
                              text: provider.eventCategories[index],
                              isSelected: provider.selectedCategory == index),
                        );
                      },
                      itemCount: provider.eventCategories.length,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: titleController,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).focusColor),
                    decoration: InputDecoration(
                      labelText: "Title",
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).focusColor),
                      prefixIcon: const Icon(Icons.edit_note),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Theme.of(context).focusColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Theme.of(context).focusColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Theme.of(context).focusColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextField(
                    controller: descriptionController,
                    maxLines: 3,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Theme.of(context).focusColor),
                    decoration: InputDecoration(
                      labelText: "Description",
                      labelStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Theme.of(context).focusColor),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Theme.of(context).focusColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Theme.of(context).focusColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2, color: Theme.of(context).focusColor),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Select Time",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: Theme.of(context).focusColor),
                      ),
                      InkWell(
                        onTap: () async {
                          var date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 7300)),
                            lastDate: DateTime.now().add(const Duration(days: 365)),
                          );
                          if (date != null) {
                            provider.changeDate(date);
                          }
                        },
                        child: Text(
                          provider.selectedDate.toString().substring(0, 10),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(color: Theme.of(context).focusColor),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        TaskModel model = TaskModel(
                            title: titleController.text,
                            category: provider.selectedCategoryName,
                            description: descriptionController.text,
                            date: provider.selectedDate.millisecondsSinceEpoch);
                        FirebaseManger.addEvent(model).then(
                          (value) {
                            Navigator.pop(context);
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Theme.of(context).primaryColor),
                      child: Text(
                        "Add Event",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
