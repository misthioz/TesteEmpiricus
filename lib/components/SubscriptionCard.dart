import 'package:empiricus_teste/components/feature.dart';
import 'package:empiricus_teste/data/subscriptionInherited.dart';
import 'package:empiricus_teste/screens/subscriptionDetails.dart';
import 'package:flutter/material.dart';

class SubscriptionCard extends StatelessWidget {
  const SubscriptionCard.SubscriptionCard({super.key});

  @override
  Widget build(BuildContext context) {
    final subscription = SubscriptionInherited.of(context);

    return Padding(
        padding: const EdgeInsets.all(18),
        child: Center(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubscriptionDetails(name: subscription.name,
                          description: subscription.description,
                          imageLarge: subscription.imageLarge,
                          authorNames: subscription.authorNames,
                          features: subscription.features)
                  )
              );
            },
            child: Card(
              child: Stack(
                children: [
                  Container(
                    width: 330,
                    height: 330,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(255, 255, 255, 0.8),
                        borderRadius: BorderRadius.circular(14)),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 330,
                        height: 210,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child:
                            FittedBox(
                                fit: BoxFit.cover,
                                child: Image.network(
                                  subscription.imageSmall,
                                  width: 330,
                                  height: 250,
                                )
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 8),
                        child: SizedBox(
                            width: 320,
                            child: Text(
                              subscription.name,
                              style: const TextStyle(
                                  fontSize: 23, fontFamily: 'Araboto'),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SizedBox(
                          width: 320,
                          child: Text(
                            subscription.shortDescription,
                            style:
                            const TextStyle(fontSize: 15, fontFamily: 'Araboto'),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
