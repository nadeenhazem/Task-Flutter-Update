import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

String? stringResponse;
Map? mapResponse;
Map? dataResponse;
List? listResponse;

class _FetchDataState extends State<FetchData> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listResponse == null ? 0 : 1,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                physics: const ScrollPhysics(),
                children: [
                  for (int i = 0; i < listResponse!.length; i++) ...[
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                color: const Color.fromARGB(0, 0, 0, 1))),
                        child: SingleChildScrollView(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Container(
                                  margin: const EdgeInsets.only(bottom: 5),
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            listResponse![i]['images'][0]),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text('')),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(
                                      listResponse![i]['title'],
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  )),
                              const SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.only(left: 15),
                                      decoration: BoxDecoration(
                                          color: const Color(0XFF33907C),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: const Icon(
                                        Icons.shopping_cart_outlined,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Text(
                                          '${listResponse![i]['price']}\$',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0XFF33907C)),
                                        ))
                                  ])
                            ])))
                  ]
                ]),
          );
        });
  }

  Future fetchApi() async {
    http.Response response;
    response = await http.get(Uri.parse("https://dummyjson.com/products"));
    if (response.statusCode == 200) {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse!['products'];
      });
    }
  }

  @override
  void initState() {
    fetchApi();
    super.initState();
  }
}
