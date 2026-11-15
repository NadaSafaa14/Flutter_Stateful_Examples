import 'package:flutter/material.dart';
import 'package:flutter_application_dio_intro/Providers/prayer_time_provider.dart';
import 'package:flutter_application_dio_intro/Widgets/custom_listTile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Prayer Time"),
        centerTitle: true,
        leading: Icon(Icons.mosque),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.mosque),
          ),
        ],
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Consumer<PrayerTimeProvider>(
                builder: (context, value, child) {
                  if (value.prayerTimeModel == null) {
                    value.getPrayerTimeData();
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.pinkAccent,
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: value.prayerTimeModel!.timings.length,
                    itemBuilder: (context, index) => CustomListtile(
                      subtitle: value.prayerTimeModel!.timings.values.elementAt(
                        index,
                      ),
                      title: value.prayerTimeModel!.timings.keys.elementAt(
                        index,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
