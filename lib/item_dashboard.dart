
import 'package:flutter/material.dart';

class ItemDashboard extends StatelessWidget {
  final String title, image;

  const ItemDashboard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text('You just clicked $title'),
          content: Image.asset('assets/images/$image', height: 150,),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context),
              child: const Text('Ok, thanks'),
            )
          ],
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0,5),
                color: Theme.of(context).colorScheme.primary.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 5,
              )
            ]
        ),
        child: Column(
          children: [
            Image.asset('assets/images/$image', height: 40, fit: BoxFit.fill),
            const SizedBox(height: 20),
            Text(title, style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ),
    );
  }
}
