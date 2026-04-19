import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationGiftButton extends StatefulWidget {
  const DonationGiftButton({super.key});

  @override
  State<DonationGiftButton> createState() => _DonationGiftButtonState();
}

class _DonationGiftButtonState extends State<DonationGiftButton>
    with SingleTickerProviderStateMixin {

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  void donate(String url) async {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Support Our Mission"),
            content: const Text(
              "Your support keeps the lights on. Donations are optional.",
            ),
            actions: [
              TextButton(
                onPressed: () =>
                    donate("https://checkout.stripe.com/pay/YOUR_LINK"),
                child: const Text("Stripe / Apple Pay"),
              ),
              TextButton(
                onPressed: () =>
                    donate("https://www.paypal.com/donate"),
                child: const Text("PayPal"),
              ),
              TextButton(
                onPressed: () =>
                    donate("https://cash.app/YOURCASHTAG"),
                child: const Text("Cash App"),
              ),
            ],
          ),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, child) => Transform.translate(
              offset: Offset(0, -4 * _controller.value),
              child: child,
            ),
            child: const Text("🎀", style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 6),
          const Text("Help Us Help Others 🎁"),
        ]),
      ),
      const SizedBox(height: 6),
      const Text(
        "Your support keeps the lights on.",
        style: TextStyle(fontSize: 12),
      ),
    ]);
  }
}
``
