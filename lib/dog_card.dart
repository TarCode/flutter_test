import 'package:flutter/material.dart';

import 'dog_model.dart';

import 'dog_detail_page.dart';


class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  _DogCardState createState() => _DogCardState(dog);
}

class _DogCardState extends State<DogCard> {

  void initState() {
    super.initState();
    renderDogPic();
  }

   String renderUrl;
   Dog dog;

   _DogCardState(this.dog);

   void renderDogPic() async {
      // this makes the service call
      await dog.getImageUrl();
      // setState tells Flutter to rerender anything that's been changed.
      // setState cannot be async, so we use a variable that can be overwritten
      setState(() {
          renderUrl = dog.imageUrl;
      });
    }

   Widget get dogImage {
    return Container(
        // You can explicitly set heights and widths on Containers.
        // Otherwise they take up as much space as their children.
      width: 100.0,
      height: 100.0,
        // Decoration is a property that lets you style the container.
        // It expects a BoxDecoration.
      decoration: BoxDecoration(
        // BoxDecorations have many possible properties.
        // Using BoxShape with a background image is the
        // easiest way to make a circle cropped avatar style image.
        shape: BoxShape.circle,
        image: DecorationImage(
          // Just like CSS's `imagesize` property.
          fit: BoxFit.cover,
          // A NetworkImage widget is a widget that
          // takes a URL to an image.
          // ImageProviders (such as NetworkImage) are ideal
          // when your image needs to be loaded or can change.
          // Use the null check to avoid an error.
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }

  Widget get dogCard {
    // A new container
    // The height and width are arbitrary numbers for styling.
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.black87,
        // Wrap children in a Padding widget in order to give padding.
        child: Padding(
          // The class that controls padding is called 'EdgeInsets'
          // The EdgeInsets.only constructor is used to set
          // padding explicitly to each side of the child.
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          // Column is another layout widget -- like stack -- that
          // takes a list of widgets as children, and lays the
          // widgets out from top to bottom.
          child: Column(
            // These alignment properties function exactly like
            // CSS flexbox properties.
            // The main axis of a column is the vertical axis,
            // `MainAxisAlignment.spaceAround` is equivalent of
            // CSS's 'justify-content: space-around' in a vertically
            // laid out flexbox.
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.dog.name,
                  // Themes are set in the MaterialApp widget at the root of your app.
                  // They have default values -- which we're using because we didn't set our own.
                  // They're great for having consistent, app-wide styling that's easily changed.
                  style: Theme.of(context).textTheme.headline),
              Text(widget.dog.location,
                  style: Theme.of(context).textTheme.subhead),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.star,
                  ),
                  Text(': ${widget.dog.rating} / 10')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // InkWell is a special Material widget that makes its children tappable
    // and adds Material Design ink ripple when tapped.
    return InkWell(
      // onTap is a callback that will be triggered when tapped.
      onTap: showDogDetailPage,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 50.0,
                child: dogCard,
              ),
              Positioned(top: 7.5, child: dogImage),
            ],
          ),
        ),
      ),
    );
  }

  // This is the builder method that creates a new page.
  showDogDetailPage() {
    // Navigator.of(context) accesses the current app's navigator.
    // Navigators can 'push' new routes onto the stack,
    // as well as pop routes off the stack.
    //
    // This is the easiest way to build a new page on the fly
    // and pass that page some state from the current page.
    Navigator.of(context).push(
      MaterialPageRoute(
        // builder methods always take context!
        builder: (context) {
          return DogDetailPage(dog);
        },
      ),
    );
  }
}