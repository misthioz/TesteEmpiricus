import 'package:empiricus_teste/components/feature.dart';
import 'package:flutter/material.dart';

class SubscriptionDetails extends StatefulWidget{
  final String name;
  final String description;
  final String imageLarge;
  final List<String> authorNames;
  final List<Feature> features;

  const SubscriptionDetails({super.key, required this.name, required this.description, required this.imageLarge, required this.authorNames, required this.features});

  @override
  State<SubscriptionDetails> createState() => _SubscriptionDetailsState();
}

class _SubscriptionDetailsState extends State<SubscriptionDetails> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Container(color: Colors.white,
            child: IconButton(onPressed:(){
              print("clicando na assinatura");
              Navigator.pop(context);
              print("indo para a pagina de detalhes");
            }, icon: const Icon(Icons.close, size: 30,))
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
             Text(widget.name, style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
            ClipRRect(borderRadius: BorderRadius.circular(15),
              child: Image.network(widget.imageLarge)),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SizedBox(width: 250, child:
                Text(widget.description,style: const TextStyle(fontSize: 18),),),
            ),
            const Divider(thickness: 2),
            const Text("Autores", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Wrap(
                spacing: 15,
                children:
                widget.authorNames.map((authorName) => Text(
                  '$authorName\t',
                  style: const TextStyle(fontSize: 18),
                )).toList()
              ),
            ),
            const Divider(thickness: 2),
            const Text("Features", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            for (var feature in widget.features)
              Padding(padding: const EdgeInsets.only(top: 10),
                  child: Feature(title: feature.title, description: feature.description))


          ],
        ),
      )
    );
  }
}
