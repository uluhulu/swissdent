import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swissdent/constants/colors.dart';
import 'package:swissdent/constants/mocks.dart';
import 'package:swissdent/constants/paths.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';
import 'package:swissdent/screens/cart_screen/bloc/cart_screen_bloc.dart';
import 'package:swissdent/screens/cart_screen/bloc/cart_screen_event.dart';
import 'package:swissdent/screens/cart_screen/bloc/cart_screen_state.dart';
import 'package:swissdent/screens/cart_screen/widget/product_card/product_card.dart';
import 'package:swissdent/screens/cart_screen/widget/cart_total_board.dart';
import 'package:swissdent/screens/personal_cabinet/widget/expand_treatment/schedule_treatment/widget/separator.dart';
import 'package:swissdent/util/money_formatter.dart';
import 'package:swissdent/widget/appbar.dart';

/// cart screen
/// https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=3%3A5893
class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return CartScreenBloc();
      },
      child: BlocConsumer<CartScreenBloc, CartScreenState>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return Scaffold(
            backgroundColor: cartBackgroundColor,
            appBar: buildAppbar(
              titleText: cart,
              onBackCallback: () => Navigator.of(context).pop(),
              action: _buildChatButton(),
            ),
            body: _buildBody(context, state),
          );
        },
      ),
    );
  }

  Widget _buildChatButton() {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 10,
          right: 16,
        ),
        child: Image.asset(
          iconChat,
          width: 24,
          height: 24,
        ),
      ),
    );
  }

  Widget _buildBody(
    BuildContext context,
    CartScreenState state,
  ) {
    return Container(
      child: Stack(
        children: [
          _buildList(context),
          Positioned(
            bottom: 0,
            child: CartTotalBoard(amount: state.cost,),
          ),
        ],
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return ProductCard(
          productCost: 1200,
          productDescription: 'Зубная щетка (АБСТРАКЦИОНИСТ) 0,15 SOFT',
          productAmount: 2,
          photoPath: 'https://cdn1.ozone.ru/s3/multimedia-5/6027797585.jpg',
          onMinusTap: (amount) {
            print('ass');
            BlocProvider.of<CartScreenBloc>(context).add(TapOnMinus(amount));
          },
          onPlusTap: (amount) {
            BlocProvider.of<CartScreenBloc>(context).add(TapOnPlus(amount));
          },
        );
      },
    );
  }

// List<Widget> _buildTemplates() {
//   final templateList = <Widget>[];
//   for (var index = 0; index < cartItemsMockList.length; index++) {
//     final template = cartItemsMockList[index];
//     templateList.add(template);
//
//     if (index != cartItemsMockList.length - 1) {
//       templateList.add(Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 17.0),
//         child: Separator(),
//       ));
//     }
//   }
//   templateList.add(SizedBox(height: 300));
//   return templateList;
// }
}
