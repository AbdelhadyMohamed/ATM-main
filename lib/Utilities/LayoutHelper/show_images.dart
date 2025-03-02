import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ShowImagesWidget extends StatefulWidget {
  final List<String> images;
  final ImageProvider? image;
  final int currentIndex;
  const ShowImagesWidget({Key? key,this.images = const [],this.currentIndex = 0,this.image}): super(key: key);



  @override
  State<ShowImagesWidget> createState() => _ShowImagesWidgetState();
}

class _ShowImagesWidgetState extends State<ShowImagesWidget> {

  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(backgroundColor: Colors.black87.withOpacity(0.8),),
      body: PhotoViewGallery.builder(
        enableRotation: true,
        pageController: pageController,
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: widget.image??NetworkImage(widget.images[index]),
            initialScale: PhotoViewComputedScale.contained,
            heroAttributes: PhotoViewHeroAttributes(tag: widget.image??widget.images[index]),
          );
        },
        itemCount: widget.image!=null?1:widget.images.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            color: Colors.grey.shade400,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
            ),
          ),
        ),
      ),
    );
  }
}
