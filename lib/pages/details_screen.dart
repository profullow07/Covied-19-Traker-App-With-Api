import 'package:covied_19/Services/Utillites/reuseable_button.dart';
import "package:flutter/material.dart";

class DetailScreen extends StatelessWidget {
  var countriesList;
  DetailScreen({super.key, required this.countriesList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(countriesList["country"]),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundImage:
                    NetworkImage(countriesList["countryInfo"]["flag"]),
              ),
            ),
            ReuseableButton(
                title: countriesList["country"],
                value: countriesList["cases"].toString()),
            ReuseableButton(
                title: "Recovred",
                value: countriesList["recovered"].toString()),
            ReuseableButton(
                title: "population",
                value: countriesList["population"].toString()),
            ReuseableButton(
                title: "deaths", value: countriesList["deaths"].toString()),
          ],
        ),
      ),
    );
  }
}
