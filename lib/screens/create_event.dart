import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c13_friday/providers/create_event_provider.dart';
import 'package:todo_c13_friday/widgets/category_event_item.dart';

class CreateEvent extends StatelessWidget {
  static const String routeName = "CreateEventScreen";

  const CreateEvent({super.key});

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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
