import 'package:flutter/material.dart';
import 'package:swissdent/constants/strings.dart';
import 'package:swissdent/constants/styles.dart';

///service item for service expand card
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=169%3A279
class ServiceItem extends StatelessWidget {
  ///name of service
  final String serviceName;

  ///description of service
  final String serviceDescription;

  ///cost of service
  final double serviceCostAmount;

  const ServiceItem({
    Key key,
    this.serviceName,
    this.serviceDescription,
    this.serviceCostAmount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24),
        _buildTitle(),
        SizedBox(height: 8),
        _buildDescription(),
        SizedBox(height: 8),
        _buildCost(),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        serviceName,
        style: bold17BlackStyle,
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        serviceDescription,
        style: normal15Style,
      ),
    );
  }

  Widget _buildCost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Text(
        serviceCost(serviceCostAmount),
        style: bold15StyleBlue,
      ),
    );
  }
}
