import 'dart:ui';

import 'package:coffee_ui/coffee_model.dart';
import 'package:coffee_ui/components.dart';
import 'package:coffee_ui/pages/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardPage extends StatefulWidget {
  final CoffeeModel? model;

  const CardPage({Key? key, this.model}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [true, false, false];
    bool isFavourite = true;

    void toggleFavourite() {
      setState(() {
        isFavourite = !isFavourite;
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(4.5),
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF303634),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(width: 4.0, color: Color(0xFF434C49))),
              child: IconButton(
                  onPressed: () => NavTo(context, HomePage()),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xFF4D4F52),
                  ))),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(4.5),
            child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFF303634),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(width: 4.0, color: Color(0xFF434C49))),
                child: IconButton(
                    onPressed: toggleFavourite,
                    icon: isFavourite
                        ? Icon(
                            Icons.favorite_rounded,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border,
                            color: Color(0xFF4D4F52),
                          ))),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0)),
                    child: Image.asset(
                      '${widget.model!.assetImage!}',
                      height: 450.0,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )),
                Container(
                    width: double.infinity,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                        border: Border.all(
                            width: 2, color: Colors.white.withOpacity(0.3))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8.0,
                          ),
                          Text('${widget.model!.name!}',
                              style: GoogleFonts.nunito(
                                  fontSize: 35.0, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('${widget.model!.subname!}',
                              style: GoogleFonts.nunito(
                                  fontSize: 30.0, fontWeight: FontWeight.w400)),
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.star_rounded,
                                    size: 30.0, color: Color(0xFFD17842)),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text('${widget.model!.rating!}',
                                    style: GoogleFonts.rubik(fontSize: 28.0)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
            CardTitle(size: 25.0, title: 'Description', left: 18.0),
            CardTitle(
                size: 18.0,
                left: 22.0,
                title:
                    "is a drink prepared from roasted coffee beans. Darkly colored, bitter, and slightly acidic, coffee has a stimulating effect on humans, primarily due to its caffeine content."),
            SizedBox(
              height: 35.0,
            ),
            ToggleButtons(
              fillColor: btnClr,
              selectedColor: Colors.white,
              renderBorder: false,
              borderRadius: BorderRadius.circular(20.0),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'S',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'M',
                      style: TextStyle(fontSize: 15.0),
                    )),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'L',
                      style: TextStyle(fontSize: 15.0),
                    )),
              ],
              isSelected: isSelected,
              onPressed: (int newIndex) {
                setState(() {
                  for (int index = 0; index < isSelected.length; index++) {
                    if (index == newIndex) {
                      isSelected[index] = true;
                    } else {
                      isSelected[index] = false;
                    }
                  }
                });
              },
            ),
            SizedBox(
              height: 45.0,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Price',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w300, fontSize: 26.0),
                      ),
                      Row(
                        children: [
                          Text(
                            '\$',
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold,
                                color: btnClr,
                                fontSize: 35.0),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${widget.model!.price!}',
                            style: GoogleFonts.rubik(
                                fontWeight: FontWeight.bold, fontSize: 35.0),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                      height: 70.0,
                      width: 200.0,
                      child: CardButton(onPressed: () {}, text: 'Buy Now'))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
