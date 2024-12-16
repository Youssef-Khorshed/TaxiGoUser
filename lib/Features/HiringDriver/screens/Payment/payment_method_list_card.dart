import 'package:flutter/material.dart';
import 'package:taxi_go_user_version/Features/HiringDriver/screens/Payment/payment_method_card.dart';

class PaymentMethodList extends StatefulWidget {
  const PaymentMethodList({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PaymentMethodListState createState() => _PaymentMethodListState();
}

class _PaymentMethodListState extends State<PaymentMethodList> {
  int _selectedIndex = -1;

  // Sample data for the payment methods
  final List<Map<String, String>> paymentMethods = [
    {
      'title': 'My Wallet ',
      'subtitle': 'Online payments',
      'image': 'assets/images/paymentimg2.png'
    },
    {'title': 'Cash', 'subtitle': '', 'image': 'assets/images/paymentimg.png'},
  ];

  void _handleSelection(int index, bool isSelected) {
    setState(() {
      // Update the selection state for the tapped card
      _selectedIndex = isSelected ? index : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: paymentMethods.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: PaymentMethodCard(
            image: Image.asset(paymentMethods[index]['image']!),
            title: paymentMethods[index]['title']!,
            subtitle: paymentMethods[index]['subtitle']!,
            isSelected: _selectedIndex == index,
            onSelected: (isSelected) => _handleSelection(index, isSelected),
          ),
        );
      },
    );
  }
}
