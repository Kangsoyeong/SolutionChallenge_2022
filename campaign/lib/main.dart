import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CampaignUI.dart';
import 'package:campaign/CampaignData.dart';

void main() {
  runApp(const Campaign());
}

CampaignData campaignData = CampaignData();

class Campaign extends StatelessWidget {
  const Campaign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CampaignMain(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Bar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              Text('1'),
              CampaignMain(),
              Text('3'),
              Text('4'),
            ],
          ),
          bottomNavigationBar: Container(
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 2,
              tabs: [
                Tab(
                  icon: Icon(Icons.adb),
                  text: 'one',
                ),
                Tab(
                  icon: Icon(Icons.adb),
                  text: 'Campaign',
                ),
                Tab(
                  icon: Icon(Icons.adb),
                  text: 'three',
                ),
                Tab(
                  icon: Icon(Icons.adb),
                  text: 'four',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

  class CampaignMain extends StatelessWidget {
    const CampaignMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Campaign',
          style: TextStyle(
              color: Color(0xff615E5C),
              fontWeight: FontWeight.bold,
              fontSize: 30
          ),
      ),
      backgroundColor: Colors.white24,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          color: Colors.lightBlue,
          iconSize: 40,
          onPressed: (){},
        ),
      ),
      body:ListView.builder(
        itemCount: campaignData.getCampaignNum(),
        itemBuilder: (BuildContext context, int index) => CampaignUI(
          campaigntitle: campaignData.getCampaignTitle(index),
          like: campaignData.getLike(index),
          scrap: campaignData.getScrap(index),
          info: campaignData.getInfo(index),
        ),
      )
    );
  }
}