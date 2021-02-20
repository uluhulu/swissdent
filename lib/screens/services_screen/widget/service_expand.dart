import 'package:flutter/material.dart';
import 'package:swissdent/screens/services_screen/widget/player/player.dart';
import 'package:swissdent/widget/expandable/expand_with_header.dart';
import 'package:swissdent/screens/services_screen/widget/service_item/service_item.dart';
import 'package:video_player/video_player.dart';

///service expand
///https://www.figma.com/file/esZIIKJ4Hb7I4at0WqUKx1/%D0%A1%D1%82%D0%BE%D0%BC%D0%B0%D1%82%D0%BE%D0%BB%D0%BE%D0%B3%D0%B8%D1%8F?node-id=169%3A279
class ServiceExpand extends StatefulWidget {
  ///title of expand
  final String title;

  final String videoUrl;

  const ServiceExpand({
    Key key,
    this.title,
    this.videoUrl,
  }) : super(key: key);

  @override
  _ServiceExpandState createState() => _ServiceExpandState();
}

class _ServiceExpandState extends State<ServiceExpand> {
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController = VideoPlayerController.network(
      widget.videoUrl,
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 12),
      child: ExpandWithHeader(
        cardName: widget.title,
        expandableBody: _buildBody(),
        onCollapseListener: () {
          _stopPlayer();
        },
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Player(
            videoPlayerController: _videoPlayerController,
          ),
          SizedBox(height: 8),
          ServiceItem(
            serviceName: "Пряммые реставрации",
            serviceDescription:
                'Восстановление зуба при помощи реставрации материалом Enamel  (до 50% зуба)',
            serviceCostAmount: 12900,
          ),
          ServiceItem(
            serviceName: "Кариес",
            serviceDescription:
            'Восстановление зуба при помощи реставрации материалом Enamel  (до 50% зуба)',
            serviceCostAmount: 10900,
          ),
        ],
      ),
    );
  }

  void _stopPlayer() {
    setState(() {
      _videoPlayerController.pause();
    });
  }
}
