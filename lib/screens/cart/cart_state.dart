// Home Screen Bloc States
// Author: openflutterproject@gmail.com
// Date: 2020-02-06

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openflutterecommerce/config/theme.dart';
import 'package:openflutterecommerce/repos/models/cart_product.dart';
import 'package:openflutterecommerce/repos/models/product.dart';
import 'package:openflutterecommerce/repos/models/product_color.dart';
import 'package:openflutterecommerce/repos/models/promo.dart';

@immutable
abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];
}

@immutable
class CartInitialState extends CartState {
  String toString() => 'HomeInitialState';
}

@immutable
class CartLoadedState extends CartState {
  final List<CartProduct> cartProducts;

  final List<Promo> promos;
  
  final bool showPromoPopup;

  final double totalPrice;

  CartLoadedState({
    @required this.showPromoPopup, 
    @required this.promos,
    this.totalPrice, 
    @required this.cartProducts});

  CartLoadedState copyWith(
      {List<CartProduct> cartProducts,
      double totalPrice,
      List<Promo> promos,
      bool showPromoPopup}) {
    return CartLoadedState(
      promos: promos ?? this.promos,
      cartProducts: cartProducts ?? this.cartProducts,
      totalPrice: totalPrice ?? this.totalPrice,
      showPromoPopup: showPromoPopup ?? this.showPromoPopup
    );
  }
  
  @override
  List<Object> get props => [totalPrice, cartProducts, this.showPromoPopup];
}



@immutable
class CartErrorState extends CartState { }