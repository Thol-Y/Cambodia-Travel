import 'package:cambodia_travel/model/recommend.dart';
import 'package:cambodia_travel/model/tourism.dart';
import 'package:cambodia_travel/provider/plan_provider.dart';
import 'package:cambodia_travel/provider/tour_provi.dart';
import 'package:flutter/material.dart';

class Planning extends StatefulWidget {
  const Planning({super.key});

  @override
  State<Planning> createState() => _PlanningState();
}

class _PlanningState extends State<Planning> {
  @override
  Widget build(BuildContext context) {
    final planProvider = PlanProvider.of(context);
    final tourProvider = TourProvider.of(context);

    final userPlans = planProvider.plan; 
    final tourPlans =
        tourProvider.tourplan; 

   
    final allPlans = [...userPlans, ...tourPlans];

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: const Text(
          'Your Planning',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: allPlans.isEmpty
          ? const Center(
              child: Text(
                'No plans yet!',
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            )
          : ListView.builder(
              itemCount: allPlans.length,
              itemBuilder: (context, index) {
                final plan = allPlans[index];

                // Initialize properties
                String name = '';
                String location = '';
                String img = '';

                
                if (plan is Recommend) {
                  name = plan.name;
                  location = plan.location;
                  img = plan.img;
                } else if (plan is Tourism) {
                  name = plan.nameTour;
                  location = plan.location;
                  img = plan.img;
                }

                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(img),
                      radius: 30,
                    ),
                    title: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          location,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: List.generate(4, (index) {
                            return const Icon(
                              Icons.star,
                              size: 10,
                              color: Colors.yellowAccent,
                            );
                          })
                            ..add(const Icon(
                              Icons.star_border,
                              size: 10,
                              color: Colors.white,
                            )),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                  "Do you want to delete this plan?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context); 
                                  },
                                  child: const Text("No"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      // Remove the plan from the correct list
                                      if (plan is Recommend) {
                                        planProvider.plan.remove(plan);
                                      } else if (plan is Tourism) {
                                        tourProvider.tourplan.remove(plan);
                                      }
                                    });

                                    // Show Snackbar message
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Enjoy Your Travel!'),
                                      ),
                                    );

                                    Navigator.pop(context); 
                                  },
                                  child: const Text("Yes"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
