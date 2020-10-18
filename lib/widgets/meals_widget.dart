import 'package:flutter/material.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave_demo_app/models/cart.dart';
import 'package:flutterwave_demo_app/models/meal.dart';
import 'package:flutterwave_demo_app/widgets/item_meal.dart';

class MealsWidget extends StatefulWidget {
  final List<Meal> meals;

  MealsWidget(this.meals);

  @override
  _MealsWidgetState createState() => _MealsWidgetState();
}

class _MealsWidgetState extends State<MealsWidget> {
  Cart cart = Cart();
  int cartLength;
  int cartTotal;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    this.cartLength = this.cart.items.length;
    this.cartTotal = this.cart.getTotal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Meals",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: this._showCart,
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart_rounded, size: 30),
                    Text(
                      "${this.cartLength}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: ListView.separated(
          itemCount: this.widget.meals.length,
          itemBuilder: (context, index) {
            final Meal meal = this.widget.meals[index];
            return MealItem(
                meal, this._handleMealClick, this.cart.items.contains(meal));
          },
          separatorBuilder: (context, index) => Container(
            margin: EdgeInsets.all(5),
            child: Divider(color: Colors.black),
          ),
        ),
      ),
    );
  }

  void _handleMealClick(final Meal meal) {
    this._showToast("${meal.name} added to cart.");
    this.cart.addMealToCart(meal);
    this.setState(() {
      this.cartLength = this.cart.items.length;
      this.cartTotal = this.cart.getTotal();
    });
  }

  Widget _cartItems() {
    final itemSize = this.cart.items.isEmpty ? 1 : this.cart.items.length;
    return Container(
      width: double.infinity,
      height: this.cart.items.length == 1 ? 150 : (150 * itemSize).toDouble(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: Text(
              "Cart",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          Container(
            height: (60 * itemSize).toDouble(),
            child: ListView.separated(
              itemCount: this.cart.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          this.cart.items[index].name,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete_rounded),
                    onPressed: () =>
                        {this._removeItemFromCart(this.cart.items[index])},
                  ),
                );
              },
              separatorBuilder: (context, index) => Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Divider(color: Colors.black),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
              child: RaisedButton(
                onPressed: this._checkout,
                child: Text(
                  "PAY TOTAL ${FlutterwaveCurrency.NGN}${this.cartTotal}.00",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _showCartEmpty() {
    return Container(
        height: 100,
        width: double.infinity,
        child: Center(
          child: Text(
            "Cart is empty!",
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ));
  }

  void _showCart() {
    showModalBottomSheet(
      context: this.context,
      builder: (BuildContext context) {
        return this.cart.items.isEmpty
            ? this._showCartEmpty()
            : this._cartItems();
      },
    );
  }

  void _showToast(final String message) {
    this._scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: (Text(message)),
            duration: Duration(milliseconds: 1000),
          ),
        );
  }

  void _removeItemFromCart(Meal meal) {
    this.setState(() {
      this.cart.items = this.cart.removeMealFromCart(meal);
      this.cartLength = this.cart.items.length;
    });
    this._refreshCart();
  }

  void _refreshCart() {
    Navigator.of(this.context).pop();
    this._showCart();
  }

  void _checkout() async {
    final Flutterwave flutterwave = Flutterwave.forUIPayment(
        context: this.context,
        publicKey: "FLWPUBK_TEST-6f008dca68dc8988715b929f2861da41-X",
        encryptionKey: "FLWSECK_TESTc2fa0b524ee1",
        currency: FlutterwaveCurrency.NGN,
        amount: this.cartTotal.toString(),
        email: "user@email.com",
        fullName: "Restaurant Customer",
        txRef: "shopper_${DateTime.now()}",
        isDebugMode: true,
        phoneNumber: "0123456789",
        acceptCardPayment: true,
        acceptAccountPayment: true,
        acceptUSSDPayment: true);
    final response = await flutterwave.initializeForUiPayments();
    if(response != null) {
      print("response is $response");
    }
  }
}
