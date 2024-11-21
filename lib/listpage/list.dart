import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productlist/Productdetails/productdetails.dart';
import 'package:productlist/component/AppText.dart';
import 'package:productlist/component/hometxt.dart';
import 'package:productlist/component/productbox.dart';
import 'package:productlist/listpage/listdata_cubit.dart';
import 'package:productlist/listpage/listdata_state.dart';

class Listpage extends StatelessWidget {
  const Listpage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListdataCubit(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Icon(Icons.menu),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(CupertinoIcons.cart))
            ]),
        body: SingleChildScrollView(
          child: BlocBuilder<ListdataCubit, ListdataState>(
            // Changed this line
            builder: (context, state) {
              final listdetails = context.read<ListdataCubit>();
              if (state is ListdataLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ListdataError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ListdataCubit>().refresh();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              if (state is ListdataLoaded) {
                print(
                    'Total products: ${listdetails.apiResponse?.products?.length}');
                print('API Response: ${listdetails.apiResponse}');
                return Column(
                  children: [
                    const Hometxt(),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppText(
                                  txt: 'Headphones',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Show All',
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 250,
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio:
                                    0.7, // Adjust this to control item size
                              ),
                              itemCount:
                                  listdetails.apiResponse?.products?.length ??
                                      0,
                              itemBuilder: (context, index) {
                                final data =
                                    listdetails.apiResponse?.products?[index];
                                return ProductBox(
                                  name: listdetails
                                      .apiResponse?.products?[index].title
                                      .toString(),
                                  price: listdetails
                                      .apiResponse?.products?[index].price,
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Productdetails(
                                        description:
                                            data?.description.toString(),
                                        price: data?.price.toString(),
                                        name: data?.title,

                                      ),
                                    ));
                                  },
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                        children: [
                          const AppText(
                              txt: 'Mobile & Accessories',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                          const SizedBox(width: 92),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Show All',
                                style: TextStyle(color: Colors.blue),
                              ))
                        ],
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProductBox(
                            name: 'product',
                            description: 'descriptio',
                            price: 167),
                        SizedBox(
                          width: 10,
                        ),
                        ProductBox(
                            name: " name",
                            description: "description",
                            price: 167)
                      ],
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
