import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Widget> buildNotesContent() {
  return [
    buildCard(
      title: 'Role of Bank of Uganda',
      content: Text(
          style: GoogleFonts.openSans(
              color: const Color(0xFFB4B9BD), fontSize: 16),
          "The Bank of Uganda conducts all its activities with the aim of fulfilling its Mission. These activities are carried out under the mandate of the Bank of Uganda Act, 2000 and other legislature."),
    ),
    buildCard(
      title: 'Core Activities',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Bank of Uganda carries out its activities with the overarching goal of fulfilling its Mission, as mandated by the Bank of Uganda Act, 2000, and other relevant legislation.',
            style: GoogleFonts.openSans(
                color: const Color(0xFFB4B9BD), fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'The primary functions of the Bank include:',
            style: GoogleFonts.openSans(
                color: const Color(0xFF79AB79), fontSize: 16),
          ),
          SizedBox(height: 10),
          ..._coreActivities.map((activity) => Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  activity,
                  style: GoogleFonts.openSans(
                      color: Color(0xFFB4B9BD), fontSize: 14),
                ),
              )),
        ],
      ),
    ),
    buildCard(
      title: 'Note Destruction and Production',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'Note Destruction:',
            style: GoogleFonts.openSans(
              color: const Color(0xFF79AB79),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Imagine the Bank of Uganda as a vigilant guardian of the currency\'s integrity. When banknotes become worn out, damaged, or unfit for circulation, the Bank responsibly withdraws them from circulation. These notes are securely destroyed through processes that ensure they cannot be reused or counterfeited. This ensures that only genuine and high-quality banknotes remain in circulation, maintaining public trust in the currency\'s value and integrity.',
            style: GoogleFonts.openSans(color: Color(0xFFB4B9BD), fontSize: 14),
          ),
          SizedBox(height: 10),
          Text(
            'Note Production:',
            style: GoogleFonts.openSans(
              color: Color(0xFF79AB79),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Picture the Bank of Uganda as a master craftsman meticulously creating new banknotes. When new currency is needed to meet the demands of the economy, the Bank oversees the production process with utmost care and precision. State-of-the-art printing facilities and security features are employed to ensure that the newly minted banknotes are of the highest quality and resistant to counterfeiting.',
            style: GoogleFonts.openSans(color: Color(0xFFB4B9BD), fontSize: 14),
          ),
        ],
      ),
    ),
    buildCard(
      title: 'FAQs about Banknotes',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _faqs.map((faq) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  faq['question']!,
                  style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  faq['answer']!,
                  style: GoogleFonts.openSans(
                    color: const Color(0xFFB4B9BD),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    ),
  ];
}

// The build Card Widget
Card buildCard({required String title, required Widget content}) {
  return Card(
    color: Color(0xFF11161A),
    margin: const EdgeInsets.symmetric(vertical: 8.0),
    child: ExpansionTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: content,
        ),
      ],
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      tilePadding: EdgeInsets.symmetric(horizontal: 16.0),
      backgroundColor: Color(0xFF11161A),
      collapsedBackgroundColor: Color(0xFF11161A),
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.transparent),
      ),
    ),
  );
}

// The Core Activities Data
final List<String> _coreActivities = [
  'Issuing Uganda\'s national currency, the Uganda Shilling (UGX), ensuring its availability and stability in the economy.',
  'Regulating the money supply through the implementation of Monetary Policy measures to achieve price stability and support sustainable economic growth.',
  'Serving as the Government of Uganda\'s banker, handling financial transactions and providing banking services.',
  'Acting as the banker to Commercial Banks, facilitating interbank transactions and providing liquidity support.',
  'Supervising and regulating Financial Institutions to maintain the stability and integrity of the financial system.',
  'Managing the country\'s external/foreign reserves to safeguard against external shocks and promote economic stability.',
];

// FAQs (Frequently Asked Questions)
final List<Map<String, String>> _faqs = [
  {
    'question': 'What happens to old or damaged banknotes?',
    'answer':
        'The Bank of Uganda withdraws old or damaged banknotes from circulation and securely destroys them to maintain the integrity of the currency.'
  },
  {
    'question': 'How are new banknotes produced?',
    'answer':
        'New banknotes are meticulously produced using state-of-the-art printing facilities and security features to ensure their quality and resistance to counterfeiting.'
  },
  {
    'question': 'What security features are included in Ugandan banknotes?',
    'answer':
        'Ugandan banknotes incorporate various security features, such as watermarks, holograms, and color-shifting inks, to prevent counterfeiting and ensure authenticity.'
  },
];
