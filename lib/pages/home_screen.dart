import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_ui/coffee_model.dart';
import 'package:coffee_ui/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(Icons.account_circle),
          )
        ],
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("Welcome, Khaleel 👋\nHere, You'll find best coffee for you. ☕😊", style: GoogleFonts.nunito(fontSize: 30.0, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15.0,),
            CarouselSlider.builder(
                itemCount: UrlImage.length,
                itemBuilder: (context, index, realIndex){
                  final images = UrlImage[index];
                  return BuildCarousel(images, index);
                },
                options: CarouselOptions(
                    height: 260.0,
                    viewportFraction: 1,
                    autoPlay: true,
                    reverse: true,
                    autoPlayInterval: Duration(seconds: 4),
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enlargeCenterPage: true
                )
            ),
            const SizedBox(height: 20.0,),
            Container(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorPadding: const EdgeInsets.only(top: 10.0),
                isScrollable: true,
                physics: const BouncingScrollPhysics(),
                labelPadding: const EdgeInsets.only(bottom: 10.0, right: 20.0, left: 20.0),
                controller: _tabController,
                  labelColor: btnClr,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: btnClr,
                  labelStyle: GoogleFonts.roboto(fontSize: 25.0),
                  indicator: CircleTabIndustor(color: btnClr, radius: 4),
                  tabs: const [
                    Text('Coffee'),
                    Text('Cappuccino'),
                    Text('Macchiao'),
                    Text('Nescafe'),
                  ],
              ),
            ),
            const SizedBox(height: 15.0,),
            Container(
              width: double.maxFinite,
              height: 300.0,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.separated(
                    itemBuilder: (context, index)=> BuildCard(coffeeListItems![index], context),
                    itemCount: coffeeListItems!.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index)=> SizedBox(width: 5.0,),
                  ),
                  ListView.separated(
                    itemBuilder: (context, index)=> BuildCard(cappuListItems[index], context),
                    itemCount: cappuListItems.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index)=> SizedBox(width: 5.0,),
                  ),
                  ListView.separated(
                    itemBuilder: (context, index)=> BuildCard(macchListItems[index], context),
                    itemCount: macchListItems.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index)=> SizedBox(width: 5.0,),
                  ),
                  ListView.separated(
                    itemBuilder: (context, index)=> BuildCard(nesListItems[index], context),
                    itemCount: nesListItems.length,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (BuildContext context, int index)=> SizedBox(width: 5.0,),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('Tips and Tracks ThisDay! ☕', style: GoogleFonts.raleway(fontSize: 25.0, fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20.0),
              child: Container(
                width: double.infinity,
                height: 200.0,
                child: Card(
                  child: Row(
                    children: [
                      Image.asset('assets/images/tips.jpg', width: 140.0, height: double.maxFinite, fit: BoxFit.fill),
                      SizedBox(width: 5.0,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5.0,),
                          Text("DON'T UNDERESTIMATE ROASTING!", style: GoogleFonts.raleway(fontSize: 11.0, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5.0,),
                          Text('People underestimate \nroasting. Which is, if you ask \nme, the most fundamental \npart of the whole [coffee] \nchain. Also they should be \nknowledgeable about \ntechnical aspects such \nas how the roasting machine \nworks.', style: GoogleFonts.raleway(fontSize: 14.0, fontWeight: FontWeight.w400),),
                          SizedBox(height: 5.0,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.house, color: Colors.white), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.cartShopping, color: Colors.white), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.heart, color: Colors.white), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.user, color: Colors.white), label: 'Home'),
      ]),
    );
  }
}