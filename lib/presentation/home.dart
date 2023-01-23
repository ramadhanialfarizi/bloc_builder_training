import 'package:bloc_builder_training/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Builder'),
        centerTitle: true,
      ),
      // MENGGUNAKAN BLOC BUILDER
      // bisa hanya "BlockBuilder" saja atau ditambahkan tipenya seperti contoh dibawah
      body: BlocBuilder<Counter, int>(
        // keyword "bloc" disini artinya sama dengan "stream" di StreamBuilder
        bloc: myCounter,
        // keyword "buildWhen" biasanya digunakan untuk pengkondisian / ada suatu ketentuan yang harus dipenuhi
        buildWhen: (previous, current) {
          /*
            contoh, pada "buildWhen" kita akan memberikan kondisi apabila
            state % 5 == 0 (menggunakan current) maka kita akan tampilkan ke widget
           */

          if (current % 5 == 0) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "$state",
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 22,
                ),
              ],
            ),
          );
        },
      ),

      // StreamBuilder(
      //   // KITA BISA MEMBERIKAN INISIAL DATA DI STREAM
      //   initialData: myCounter.init,
      //   stream: myCounter.stream,
      //   builder: (context, snapshot) {
      //
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => myCounter.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), //
    );
  }
}
