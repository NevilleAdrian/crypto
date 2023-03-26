import 'package:de_marketplace/core/providers/auth_provider/auth_provider.dart';
import 'package:de_marketplace/shared/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlineCustomButton extends StatelessWidget {
  const OutlineCustomButton({
    Key? key,
    required this.size,
    required this.defaultFontColor,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final Color defaultFontColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(0.9),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          gradient: LinearGradient(
            colors: <Color>[Color(0XFFBBE71F), Color(0XFF00C5FF)],
          ),
        ),
        child: Container(
          height: size.height * 0.075,
          width: size.width * 0.3,
          decoration: BoxDecoration(
            color: backGroundColor,

            // border: Border.all(color: Color(0XFFBBE71F)),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Align(
              child: Auth.authProvider(context, listen: true).loading
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        backgroundColor: Colors.grey,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(defaultFontColor),
                      ),
                    )
                  : GradientText(
                      'View Profile',
                      style: GoogleFonts.poppins(
                        color: Color(0XFFBBE71F),
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                      gradient: const LinearGradient(
                        colors: <Color>[Color(0XFFBBE71F), Color(0XFF00C5FF)],
                      ),
                    )),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.size,
    required this.defaultFontColor,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final Color defaultFontColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: size.height * 0.075,
        width: size.width * 0.3,
        decoration: const BoxDecoration(
          color: Color(0xff4FBBEB),
          gradient: LinearGradient(
            colors: <Color>[Color(0XFFBBE71F), Color(0XFF00C5FF)],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Align(
          child: Auth.authProvider(context, listen: true).loading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(defaultFontColor),
                  ),
                )
              : Text(
                  "Connect Wallet",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: const Color(0XFF122645),
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}

class GreyButton extends StatelessWidget {
  const GreyButton({
    Key? key,
    this.size,
    required this.defaultFontColor,
    required this.onPressed,
    this.text,
  }) : super(key: key);

  final Size? size;
  final String? text;
  final Color defaultFontColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // height: size!.height * 0.075,
        // width: size!.width * 0.3,
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xff1D2939),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Align(
          child: Auth.authProvider(context, listen: true).loading
              ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation<Color>(defaultFontColor),
                  ),
                )
              : Text(
                  text!,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: size!.width * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
