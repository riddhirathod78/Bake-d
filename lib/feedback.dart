import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: DeliveryRatingPage()));
}

class DeliveryRatingPage extends StatefulWidget {
  @override
  _DeliveryRatingPageState createState() => _DeliveryRatingPageState();
}

class _DeliveryRatingPageState extends State<DeliveryRatingPage> {
  int rating = 0;
  TextEditingController feedbackController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double screenHeight = constraints.maxHeight;
          final double screenWidth = constraints.maxWidth;
          final double paddingVertical = screenHeight * 0.03;
          final double paddingHorizontal = screenWidth * 0.05;
          final double headingFontSize = screenHeight * 0.025;
          final double starSize = screenWidth * 0.12;
          final double emoticonSize = screenWidth * 0.2;
          final double ratingFontSize = screenHeight * 0.04;
          final double buttonFontSize = screenHeight * 0.02;
          final double feedbackBoxHeight = screenHeight * 0.15;

          Widget _buildEmoticon(double size) {
            IconData iconData;
            String semanticLabel;
            switch (rating) {
              case 1:
                iconData = Icons.sentiment_very_dissatisfied;
                semanticLabel = 'Very Dissatisfied';
                break;
              case 2:
                iconData = Icons.sentiment_dissatisfied;
                semanticLabel = 'Dissatisfied';
                break;
              case 3:
                iconData = Icons.sentiment_neutral;
                semanticLabel = 'Neutral';
                break;
              case 4:
                iconData = Icons.sentiment_satisfied;
                semanticLabel = 'Satisfied';
                break;
              case 5:
                iconData = Icons.sentiment_very_satisfied;
                semanticLabel = 'Very Satisfied';
                break;
              default:
                iconData = Icons.sentiment_neutral;
                semanticLabel = 'Neutral';
            }
            return Semantics(
              label: semanticLabel,
              child: Icon(
                iconData,
                size: size,
                color: Colors.orange,
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text('Delivery Rating'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: paddingVertical,
                  horizontal: paddingHorizontal,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      'Rate your delivery experience:',
                      style: TextStyle(fontSize: headingFontSize),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        for (int i = 1; i <= 5; i++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                rating = i;
                              });
                            },
                            child: Icon(
                              Icons.star,
                              color: i <= rating ? Colors.yellow : Colors.grey,
                              size: starSize,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      'How was your overall experience?',
                      style: TextStyle(fontSize: headingFontSize),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    SizedBox(
                      height: feedbackBoxHeight,
                      child: TextField(
                        controller: feedbackController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Please share your feedback',
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    ElevatedButton(
                      onPressed: () {
    if (feedbackController.text.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text('Please fill in all fields.'),
    ));} else (

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThankYouFeedBackPage()),
                        ));
                        // TODO: Submit rating and feedback
                        print('Rating: $rating');
                        print('Feedback: ${feedbackController.text}');
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: buttonFontSize),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Text(
                      'Your rating:',
                      style: TextStyle(fontSize: headingFontSize),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildEmoticon(emoticonSize),
                        SizedBox(width: screenWidth * 0.03),
                        Text(
                          '$rating / 5',
                          style: TextStyle(fontSize: ratingFontSize),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}


class ThankYouFeedBackPage extends StatelessWidget {
  const ThankYouFeedBackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Thank You for Your Feedback'),
    ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 100.0,
              ),
              SizedBox(height: 16.0),
              Text(
                'Thank you for your feedback!',
                style: TextStyle(fontSize: 24.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16.0),
              Text(
                'We appreciate your input and will use it to improve our service.',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
