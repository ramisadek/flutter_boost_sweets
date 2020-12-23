import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';

class TabBarScreen extends StatefulWidget {
  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> with SingleTickerProviderStateMixin{

  final List<Tab> tabs = <Tab>[
    new Tab(text: "Featured",),
    new Tab(text: "Popular"),
    new Tab(text: "Latest")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF9267FD),
        title: Text("تفاصيل المنتج",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back,color: Colors.white,),
        ),
        actions: [
          Image.asset("assets/icons/star.png",scale: 4,),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 210,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    padding: EdgeInsets.only(top: 20),
                    color: Color(0xFF9267FD),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.white
                          ),
                          child: TabBar(
                            unselectedLabelColor: Colors.grey,
                            labelColor: Colors.white,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: new BubbleTabIndicator(
                                indicatorHeight: 40.0,
                                indicatorColor: Colors.blueAccent,
                                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                                indicatorRadius: 10
                            ),
                            tabs: tabs,
                            controller: _tabController,
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 1,
                    right: 10,
                    left: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width* 0.9,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage("https://www.extremetech.com/wp-content/uploads/2019/12/SONATA-hero-option1-764A5360-edit.jpg"),
                          fit: BoxFit.cover
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 300,
                child: TabBarView(
                  controller: _tabController,
                  children: tabs.map((Tab tab) {
                    return new Center(
                        child: new Text(
                          tab.text,
                          style: new TextStyle(
                              fontSize: 20.0
                          ),
                        )
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
