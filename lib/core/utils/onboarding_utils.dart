// ignore_for_file: lines_longer_than_80_chars
///
class Slide {
  ///
  Slide({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.actionCallback,
  });

  ///
  final String title;

  ///
  final String description;

  ///
  final String imageUrl;

  ///
  // ignore: inference_failure_on_function_return_type
  final Function()? actionCallback;
}

// ignore: public_member_api_docs
final slideList = [
  Slide(
    title: ' Get your Results!',
    description:
        'Many desktop publishing packages and web page editors now use Lorem Ipsum.',
    actionCallback: () {},
    imageUrl: 'assets/images/get_result.jpg',
  ),
  Slide(
    title: 'Results',
    description:
        'Many desktop publishing packages and web page editors now use Lorem Ipsum.',
    actionCallback: () {},
    imageUrl: 'assets/images/result_in_letter.png',
  ),
];
