import 'package:empiricus_teste/data/subscriptionInherited.dart';
import 'package:flutter/material.dart';
import '../components/SubscriptionCard.dart';
import '../data/subscriptionAPI.dart';
import 'package:http/http.dart' as http;
import 'package:empiricus_teste/models/Subscription.dart';

class SubscriptionList extends StatefulWidget {
  const SubscriptionList({super.key});

  @override
  State<SubscriptionList> createState() => _SubscriptionListState();
}

class _SubscriptionListState extends State<SubscriptionList> {
  late Future<List<Subscription>> futureSubscriptions;

  @override
  void initState() {
    super.initState();
    futureSubscriptions = fetchSubscriptions(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      appBar: AppBar(
          leading: Container(color: Colors.black,
              child: Image.network('https://empiricus.com.br/uploads/2022/05/Empiricus-logo-1.jpg')), title: const Text("empiricus",
        style: TextStyle(fontFamily: 'Litera', fontWeight: FontWeight. bold,
            color: Colors.white, fontSize: 35),),
          backgroundColor: Colors.black
      ),
      body: FutureBuilder<List<Subscription>>(
        future: futureSubscriptions,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No subscriptions'));
          } else {
            final subscriptions = snapshot.data!;

            return ListView.builder(
              itemCount: subscriptions.length,
              itemBuilder: (context, index) {
                final subscription = subscriptions[index];

                return SubscriptionInherited(
                  id: subscription.id,
                  name: subscription.name,
                  shortDescription: subscription.shortDescription,
                  imageSmall: subscription.imageSmall,
                  imageLarge: subscription.imageLarge,
                  description: subscription.description,
                  authorNames: subscription.authorNames,
                  features: subscription.features,
                  child: const SubscriptionCard.SubscriptionCard(),
                );
                // return SubscriptionCard.SubscriptionCard(subscription.id, subscription.name,
                //     subscription.shortDescription, subscription.imageSmall, subscription.imageLarge, subscription.description, subscription.authorNames, subscription.features);
              },
            );
          }
        },
      ),
    );
  }
}
