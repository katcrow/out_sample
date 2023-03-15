import 'package:flutter/material.dart';

Widget mainHeading({
  required String text,
  required BuildContext context,
}) {
  return Text(
    text,
    style: Theme.of(context).textTheme.titleLarge!.copyWith(
          fontWeight: FontWeight.w600,
        ),
  );
}

Widget subHeadingTextLarge({
  required String text,
  required BuildContext context,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.7,
    child: Text(
      text,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w500,
            // fontSize: 18,
          ),
    ),
  );
}

Widget subHeadingTextMedium({
  required String text,
  required BuildContext context,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.7,
    child: Text(
      text,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            // fontSize: 16,
          ),
    ),
  );
}

Widget subHeadingTextSmall({
  required String text,
  required BuildContext context,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * 0.7,
    child: Text(
      text,
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            fontWeight: FontWeight.w400,
            // fontSize: 14,
          ),
    ),
  );
}
