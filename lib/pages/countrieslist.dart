import 'package:covied_19/Model/world_state_model.dart';
import 'package:covied_19/Services/Utillites/reuseable_button.dart';
import 'package:covied_19/Services/services.dart';
import 'package:covied_19/pages/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ServicesState servicesState = ServicesState();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Countries List"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Container(
              child: TextFormField(
                controller: searchController,
                
                onChanged: (value) {
                  setState(() {
                    
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search your countries?",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            
            Expanded(
              child: FutureBuilder(
                future: servicesState.getWroldCountriesApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade600,
                        highlightColor: Colors.grey.shade100,
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Card(
                                color: Colors.white,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    child: Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Container(
                                    color: Colors.white,
                                    width: 360,
                                    height: 55,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name =
                            snapshot.data![index]["country"];
                            var dataList = snapshot.data![index];

                        if (searchController.text.isEmpty) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => DetailScreen(countriesList: dataList),));
                              },
                              child: Card(
                                color: Colors.white,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(snapshot
                                        .data![index]["countryInfo"]["flag"]
                                        .toString()),
                                  ),
                                  title: Text(
                                    snapshot.data![index]["country"].toString(),
                                  ),
                                  subtitle: Text(
                                    "Recovred " +
                                        snapshot.data![index]["recovered"]
                                            .toString(),
                                  ),
                                  trailing: Text(
                                    "Cases " +
                                        snapshot.data![index]["cases"]
                                            .toString(),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: InkWell(
                               onTap: () {
                                Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => DetailScreen(countriesList: dataList),));
                              },
                              child: Card(
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(snapshot
                                            .data![index]["countryInfo"]["flag"]
                                            .toString()),
                                      ),
                                      title: Text(
                                        snapshot.data![index]["country"].toString(),
                                      ),
                                      subtitle: Text(
                                        "Recovred " +
                                            snapshot.data![index]["recovered"]
                                                .toString(),
                                      ),
                                      trailing: Text(
                                        "Cases " +
                                            snapshot.data![index]["cases"]
                                                .toString(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
