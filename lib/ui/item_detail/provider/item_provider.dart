import 'package:coffeehome/model/product.dart';
import 'package:flutter/material.dart';

enum Sizes { M, L }
enum Types { Hot, Cold }
enum Ice { Ice50, Ice70, Ice100 }
enum Sugar { Sugar50, Sugar70, Sugar100 }

class ItemProvider with ChangeNotifier {
  Product? _product;
  double? _priceIn;
  double _amount = 0;
  int _quantity = 1;
  Types _type = Types.Cold;
  Sizes _size = Sizes.M;
  Ice _ice = Ice.Ice100;
  Sugar _sugar = Sugar.Sugar100;

  Product? get product => _product;
  double? get priceIn => _priceIn;
  int get quantity => _quantity;
  Types get type => _type;
  Sizes get size => _size;
  Ice get ice => _ice;
  Sugar get sugar => _sugar;
  double get amount => _amount;

  void init(Product product) {
    _product = product;
    _priceIn = product.price;
    _quantity = 1;
    _type = Types.Cold;
    _size = Sizes.M;
    _ice = Ice.Ice100;
    _sugar = Sugar.Sugar100;
    _amount = _priceIn! * _quantity;
    notifyListeners();
  }

  void setProduct(Product product) {
    _product = product;
    notifyListeners();
  }

  void setAmount() {
    if (_product != null && _priceIn != null) {
      _amount = (_priceIn! * _quantity);
      notifyListeners();
    }
  }

  void decreseQuantity() {
    if (_quantity > 1) {
      _quantity -= 1;
      setAmount();
    }
  }

  void increseQuantity() {
    _quantity += 1;
    setAmount();
  }

  void setType(Types type) {
    _type = type;
    notifyListeners();
  }

  void setSize(Sizes size) {
    _size = size;
    if (_product != null) {
      switch (size) {
        case Sizes.M:
          _priceIn = _product!.price;
          setAmount();
          break;

        case Sizes.L:
          _priceIn = _product!.price + 10000;
          setAmount();
          break;
        default:
          _priceIn = _product!.price;
          setAmount();
          break;
      }
    }
  }

  void setIce(Ice ice) {
    _ice = ice;
    notifyListeners();
  }

  void setSugar(Sugar sugar) {
    _sugar = sugar;
    notifyListeners();
  }
}
