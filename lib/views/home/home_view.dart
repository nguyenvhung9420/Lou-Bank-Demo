// @dart=2.9
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loubank/models/card_data.dart';
import 'package:loubank/views/home/home_view_model.dart';
import 'package:loubank/views/home/tiles/card_data_tile.dart';
import 'package:loubank/views/home/tiles/currency_tile.dart';
import 'package:loubank/views/home/tiles/financial_tile.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeViewModel viewModel = HomeViewModel();
  NumberFormat numberformatter = NumberFormat("#,##0");

  List<CurrencyTile> currencyTiles = [];
  List<CurrencyTile> metals = [];

  @override
  void initState() {
    super.initState();
    currencyTiles = this.viewModel.currencies.map((e) {
      String imageName = "usd";
      switch (e.name.toLowerCase().trim()) {
        case "usd":
          imageName = "usd";
          break;
        case "eur":
          imageName = "euro";
          break;
        default:
          imageName = "euro";
          break;
      }
      return CurrencyTile(data: e, imageName: imageName);
    }).toList();

    metals = this.viewModel.metals.map((e) {
      String imageName = "usd";
      switch (e.name.toLowerCase().trim()) {
        case "gold":
          imageName = "gold";
          break;
        case "silver":
          imageName = "silver";
          break;
        default:
          imageName = "silver";
          break;
      }
      return CurrencyTile(data: e, imageName: imageName);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1F1F),
      body: Stack(
        children: [
          GradientBloom(195, -206, [Color(0xff433D48), Color(0xff1E1F1F)]),
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: AppBarRepresentation(),
              ),
              Container(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BalanceTile(7891.0),
              ),
              Container(height: 26),
              Container(
                height: 171,
                child: CardsListView(),
              ),
              Container(height: 39),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'FINANCE',
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.caption.fontSize),
                ),
              ),
              Container(height: 12),
              Container(
                height: 101,
                child: FinancialTilesListView(),
              ),
              Container(height: 36),
              Container(
                decoration: new BoxDecoration(
                    color: Color(0xff252626),
                    borderRadius: BorderRadius.circular(40)),
                child: Stack(
                  children: [
                    GradientBloom(
                      287,
                      -72,
                      [Color(0xff433D48).withOpacity(0.5), Colors.transparent],
                    ),
                    GradientBloom(
                      -80,
                      388,
                      [Color(0xff433D48), Colors.transparent],
                    ),
                    ListView(
                      shrinkWrap: true,
                      primary: false,
                      children: [
                        LoansListView(),
                        CurrenciesAndMetalsListView(),
                      ],
                    ),
                    Container(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget GradientBloom(double left, double top, List<Color> colors) {
    return Positioned(
      left: left,
      top: top,
      child: SizedBox(
        width: 308,
        height: 308,
        child: Container(
          decoration: new BoxDecoration(
              gradient: RadialGradient(
            colors: colors,
          )),
        ),
      ),
    );
  }

  Widget BalanceTile(double balance) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your balance"),
            Text(
              "\$ ${numberformatter.format(balance)}",
              style: new TextStyle(
                fontSize: Theme.of(context).textTheme.headline5.fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Spacer(),
        Container(
          decoration: new BoxDecoration(),
          child: Image.asset("assets/logo/loupe.png", height: 32, width: 32),
        )
      ],
    );
  }

  Widget AppBarRepresentation() {
    return Row(
      children: [
        Container(
          height: 32,
          width: 32,
          child: Image.asset("assets/logo/avatar.png"),
        ),
        Spacer(),
        Image.asset("assets/logo/loubank_logo.png", width: 72),
        Spacer(),
        Container(width: 32),
      ],
    );
  }

  Widget CardsListView() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (BuildContext context, int i) {
          return Container(width: 13, height: 1);
        },
        scrollDirection: Axis.horizontal,
        itemCount: this.viewModel.cardsData.length,
        itemBuilder: (BuildContext context, int i) {
          CardData cardData = this.viewModel.cardsData[i];
          CardDataTile cardTile = CardDataTile(data: cardData);
          return Container(
            padding: EdgeInsets.only(top: 30, bottom: 20, right: 16, left: 16),
            height: 170,
            width: 148,
            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: cardTile.getColorGradient())),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  cardTile.getBrandImageLocation(),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  width: 40,
                  height: 40,
                ),
                Spacer(),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    cardData.category,
                    style: new TextStyle(color: Colors.black),
                  ),
                  Text(
                    cardData.getAmountAsString(this.numberformatter),
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: Theme.of(context).textTheme.headline5.fontSize,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ]),
                Spacer(),
                Text(
                  "** " + cardData.last4Digits,
                  style: new TextStyle(color: Colors.black),
                ),
              ],
            ),
          );
        });
  }

  Widget FinancialTilesListView() {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: this.viewModel.financialTiles.length,
        separatorBuilder: (BuildContext context, int i) {
          return Container(width: 13, height: 1);
        },
        itemBuilder: (BuildContext context, int i) {
          FinancialTile tile =
              FinancialTile(data: this.viewModel.financialTiles[i]);
          return Container(
            padding: EdgeInsets.all(16),
            height: 100,
            width: 100,
            decoration: new BoxDecoration(
              color: Color(0xff252626),
              borderRadius: BorderRadius.circular(26),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                tile.getImageForType(),
                Spacer(),
                Text(
                  tile.data.category,
                  style: new TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget LoansListView() {
    return ExpansionTile(
      initiallyExpanded: true,
      tilePadding: EdgeInsets.symmetric(horizontal: 22),
      title: new Text(
        "CURRENT LOANS",
        style: new TextStyle(
          fontSize: Theme.of(context).textTheme.caption.fontSize,
        ),
      ),
      textColor: Colors.white,
      collapsedTextColor: Colors.white,
      children: <Widget>[
        new ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          primary: false,
          itemCount: this.viewModel.loans.length + 1,
          itemBuilder: (BuildContext cxt, int i) {
            if (i == this.viewModel.loans.length) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    decoration: new BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color(0xffEAEAEA), Color(0xffB2D0CE)]),
                        borderRadius: BorderRadius.circular(26)),
                    child: ListTile(
                      dense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      leading: Container(
                        width: 32,
                        height: 32,
                        decoration: new BoxDecoration(
                          color: Color(0xff242727),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text("⚡️"),
                      ),
                      horizontalTitleGap: 12,
                      title: Row(
                        children: [
                          Text(
                            "Start investing now",
                            style: new TextStyle(
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .fontSize,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            "Protected savings and investment plans",
                            style: new TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 17,
                    right: 17,
                    child: Icon(Icons.close, size: 12, color: Colors.black),
                  ),
                ],
              );
            }
            return Container(
              decoration: new BoxDecoration(
                  color: Color(0xff212121).withOpacity(0.7),
                  borderRadius: BorderRadius.circular(26)),
              child: ListTile(
                dense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                leading: Container(
                  width: 32,
                  height: 32,
                  decoration: new BoxDecoration(
                    color: Color(0xffB2D0CE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/logo/analysis.png",
                    width: 13.3,
                    height: 13.3,
                  ),
                ),
                horizontalTitleGap: 12,
                title: Row(
                  children: [
                    Text("Account № " + this.viewModel.loans[i].accountNum),
                    Spacer(),
                    Text("\$ " +
                        this
                            .viewModel
                            .loans[i]
                            .getAmountAsString(NumberFormat("#,##0.00"))),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text("Expires " +
                        this.viewModel.loans[i].getExpiryDateAsString()),
                    Spacer(),
                    Text("Rate " +
                        this.viewModel.loans[i].rate.toStringAsFixed(1) +
                        "%"),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext cxt, int i) {
            return Container(height: 16);
          },
        ),
      ],
    );
  }

  Widget CurrenciesAndMetalsListView() {
    return ExpansionTile(
      initiallyExpanded: true,
      tilePadding: EdgeInsets.symmetric(horizontal: 22),
      title: new Text(
        "CURRENCIES AND METALS",
        style: new TextStyle(
          fontSize: Theme.of(context).textTheme.caption.fontSize,
        ),
      ),
      textColor: Colors.white,
      collapsedTextColor: Colors.white,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: new Column(children: [
            CurrencyTable(this.currencyTiles),
            Container(height: 12),
            CurrencyTable(this.metals),
          ]),
        ),
      ],
    );
  }

  Widget CurrencyTable(List<CurrencyTile> list) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: new BoxDecoration(
          color: Color(0xff212121).withOpacity(0.7),
          borderRadius: BorderRadius.circular(26)),
      child: Table(
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(1),
          2: FlexColumnWidth(1),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: Iterable<int>.generate(list.length + 1).toList().map((int i) {
          if (i == 0) {
            return TableRow(
              children: <Widget>[
                TableCell(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text("Currency",
                            style: TextStyle(color: Color(0xff79767D)),
                            textAlign: TextAlign.left))),
                TableCell(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text("Buy",
                            style: TextStyle(color: Color(0xff79767D)),
                            textAlign: TextAlign.right))),
                TableCell(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Text("Sell",
                            style: TextStyle(color: Color(0xff79767D)),
                            textAlign: TextAlign.right))),
              ],
            );
          }

          return TableRow(
            children: <Widget>[
              TableCell(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: new BoxDecoration(
                        color: Color(0xffB2D0CE),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Image.asset(list[i - 1].getIconLocation(),
                          height: 10),
                    ),
                    Container(width: 12),
                    Text(list[i - 1].data.name),
                  ],
                ),
              ),
              TableCell(
                  child: Text(
                      "\$ ${list[i - 1].data.priceBuy.toStringAsFixed(2)}",
                      textAlign: TextAlign.right)),
              TableCell(
                  child: Text(
                      "\$ ${list[i - 1].data.priceSell.toStringAsFixed(2)}",
                      textAlign: TextAlign.right)),
            ],
          );
        }).toList(),
      ),
    );
  }
}
