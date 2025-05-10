import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/accordion.dart';
import '../widgets/featureTile.dart';
import '../widgets/notesCard.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFF11161A),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Introduction',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/flag.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Bank of Uganda',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.white,
                            )),
                        Text('Series of Ugandan Currency',
                            style: GoogleFonts.openSans(
                              color: const Color(0xFFB4B9BD),
                            )),
                        GestureDetector(
                          onTap: () {
                            //TODO: Navigate to Wikipedia page
                          },
                          child: TextButton.icon(
                            onPressed: () {},
                            label: Text('Wikipedia Info'),
                            icon: Icon(CupertinoIcons.arrow_right),
                            iconAlignment: IconAlignment.end,
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.cyan.shade600,
                                iconColor: Colors.cyan,
                                textStyle: GoogleFonts.openSans(
                                    color: Colors.cyan.shade600)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 3.0),
                Divider(
                  color: Colors.transparent,
                ),
                SizedBox(height: 10),
                TabBar(
                  tabs: [
                    Tab(text: 'Overview'),
                    Tab(text: 'Notes'),
                    Tab(text: 'More'),
                  ],
                  indicatorColor: const Color(0xFF02B3E4),
                  labelColor: const Color(0xFF02B3E4),
                  unselectedLabelColor: const Color(0xFFB4B9BD),
                  labelStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  dividerColor: Colors.transparent,
                ),
                SizedBox(
                  height: 500,
                  child: TabBarView(
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              accordion(
                                title: 'About the Ugandan Bank Notes',
                                subtitle: "About Ugandan Shillings",
                                content:
                                    "On 3 May 2010, Bank of Uganda unveiled a new series of redesigned and smaller banknotes which went into circulation back in 2010. The new notes are in the existing denominations of 1,000, 5,000, 10,000, and 50,000 shillings, as well as a new denomination: 2,000 shillings (US O.95)  Besides a harmonized banknote design that depict Uganda’s rich historical, natural and cultural heritage, the new notes bear improved security features and are smaller in size than the existing series which will remain legal tender. The common security features for the 1,000-, 2,000-, and 5,000-shilling notes are a watermark, a color-change image, and a raised effect on the surface to help the visually-impaired people differentiate denominations. The notes also feature a windowed thread that changes from red to green when the note is titled. The notes also bear a hidden irridescent pattern.The bank hired professional artists and designers led by Gen. Elly Tumwine which explains the Ugandan look as depicted by the main images which constitute pots and ornaments common in Ugandan homes. The notes were printed by De La Rue, the world’s largest commercial security printer.Bank of Uganda chief Emmanuel Tumusiime Mutebile said the new notes did not constitute a currency reform, nor were they dictated by politics. The redesign, he said, was driven by the need to comply with international practices and to beat counterfeiters. “Uganda is the first country in Africa to introduce ultra –modern security feature called SPARK, an optical security feature from KBA-GIORI first used on Kazakhstan’s 5,000-tengé commemorative of 2008.",
                              ),
                              accordion(
                                title:
                                    'Uganda Heritage Symbols on 50,000 Notes',
                                subtitle:
                                    "The 50,000 UGX Shilling Bank Note: An Award-Winning Symbol of Uganda's Richness",
                                content:
                                    "The 50,000 Ugandan Shilling bank note is a masterpiece of design, rich in cultural symbolism and equipped with advanced security features. Its recognition as the International Bank Note Society’s ‘Banknote of 2010’ underscores its aesthetic and functional excellence. This highest denomination note in the series introduced in May 2010 stands out for its intricate design elements and vibrant depictions of Uganda's natural and cultural heritage. The 50,000 Ugandan Shilling bank note is a celebrated symbol of Uganda's heritage and economic strength. Its intricate design, featuring landmarks like the Stride and Independence Monuments, and the depiction of the Bwindi rainforest and silverback gorillas, makes it a visual treat. Coupled with its robust security features, the note not only facilitates high-value transactions but also proudly showcases Uganda's natural beauty and cultural richness. Its recognition by the International Bank Note Society as one of the world's most beautiful banknotes attests to its exemplary design and significance. This note, printed by British security printers De La Rue in collaboration with the Bank of Uganda, stands as a testament to successful international cooperation and innovative design.",
                                features: 11,
                              ),
                              accordion(
                                title:
                                    'Uganda Heritage Symbols on 20,000 Notes',
                                subtitle:
                                    "The 20,000 UGX Shilling Bank Note: A Symbol of Uganda's Heritage and Economy",
                                content:
                                    "The 20,000 Ugandan Shilling bank note is a rich tapestry of the nation's cultural heritage, economic pride, and security advancements. This high-denomination note features a blend of visible and hidden elements that symbolize Uganda's identity and safeguard against counterfeiting. The 20,000 Ugandan Shilling bank note is more than just currency; it is a representation of Uganda's rich cultural heritage, economic strengths, and advanced security features. By incorporating symbols of national pride and economic vitality alongside cutting-edge security elements, the note not only facilitates commerce but also tells the story of a nation committed to preserving its identity and integrity.",
                                features: 9,
                              ),
                              accordion(
                                title:
                                    'Uganda Heritage Symbols on 10,000 Notes',
                                subtitle:
                                    "The 10,000 UGX Shilling Bank Note: Celebrating Uganda's Heritage and Progress",
                                content:
                                    "The 10,000 Ugandan Shilling bank note is a vivid representation of Uganda's rich cultural heritage and its strides in modern infrastructure. This denomination, like others in the series, blends artistic beauty with robust security features to ensure authenticity and prevent counterfeiting.The 10,000 Ugandan Shilling bank note encapsulates Uganda’s cultural richness and its progress in infrastructure development. With musical instruments symbolizing the nation's heritage and the Kiira Hydroelectric Power Station representing modern advancements, the note serves both as a medium of exchange and a cultural artifact. Enhanced with advanced security features, the 10,000 UGX note not only facilitates everyday transactions but also ensures confidence in its authenticity and integrity. This blend of tradition and modernity reflects Uganda's journey towards a prosperous future.",
                                features: 9,
                              ),
                              accordion(
                                title: "Uganda Heritage Symbols on 5,000 Notes",
                                subtitle:
                                    "The 5000 UGX Shilling Bank Note: Embodying Uganda's Cultural Diversity",
                                content:
                                    "The 5000 Ugandan Shilling banknote is a captivating reflection of Uganda's cultural diversity and natural beauty. Combining vibrant imagery with advanced security features, this banknote stands as a symbol of national pride and resilience. The 5000 Ugandan Shilling banknote encapsulates Uganda's cultural diversity and economic vitality. Through its vibrant imagery and advanced security features, it serves as both a tribute to the nation's heritage and a symbol of its progress. From the rhythmic beats of traditional drums to the lush landscapes of coffee plantations, every aspect of this banknote reflects Uganda's rich tapestry of culture and history. Enhanced with robust security features, the 5000 UGX note ensures confidence and trust in its value, facilitating transactions and fostering economic growth across the nation.",
                                features: 11,
                              ),
                              accordion(
                                title: "Uganda Heritage Symbols on 2,000 Notes",
                                subtitle:
                                    "The 2000 UGX Shilling Bank Note: Celebrating Uganda's Natural Splendor and Cultural Heritage",
                                content:
                                    "The 2000 Ugandan Shilling banknote is a picturesque representation of Uganda's natural beauty, cultural heritage, and significant landmarks. With its vibrant imagery and advanced security features, this banknote serves as a tribute to the nation's diverse landscapes and rich history. The 2000 Ugandan Shilling banknote is a celebration of Uganda's natural splendor, cultural heritage, and significant landmarks. From the rhythmic beats of traditional drums to the majestic beauty of the Nile River, every aspect of this banknote reflects the country's rich tapestry of landscapes and traditions. Enhanced with advanced security features, the 2000 UGX note ensures confidence and trust in its value, facilitating transactions and promoting economic prosperity across the nation.",
                                features: 13,
                              ),
                              accordion(
                                title: "Uganda Heritage Symbols on 1,000 Notes",
                                subtitle:
                                    "The 1000 UGX Shilling Bank Note: Honoring Uganda's Agriculture and Economic Vitality",
                                content:
                                    "The 1000 Ugandan Shilling banknote is a tribute to Uganda's thriving agricultural sector and economic vitality. Through its evocative imagery and sophisticated security features, this banknote embodies the nation's commitment to sustainable development and prosperity. The 1000 Ugandan Shilling banknote is a celebration of Uganda's agricultural heritage and economic vitality. From the diligent work of farmers in banana plantations to the efficient logistics of grain transportation, every aspect of this banknote reflects the country's agricultural prowess and commitment to sustainable development. Enhanced with advanced security features, the 1000 UGX note ensures confidence and trust in its value, facilitating transactions and fostering economic prosperity across the nation.",
                                features: 6,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                          child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ExpansionTile(
                              title: Text(
                                'Security Features on the 50,000 Notes',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'Visible Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.music_note,
                                  title: 'Musical Instruments',
                                  subtitle:
                                      'Prominent display of Uganda’s rich musical heritage.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Coat of Arms',
                                  subtitle:
                                      'Symbols of spears and waves of Lake Victoria.',
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Hidden Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.eye,
                                  title: 'Watermark',
                                  subtitle:
                                      'Clear portrait of a crested crane and denomination when held up to light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.doc_on_clipboard,
                                  title: 'Security Thread',
                                  subtitle:
                                      'Embedded thread with "BOU" and denomination visible under light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.sparkles,
                                  title: 'Holographic Stripe',
                                  subtitle:
                                      'Changes appearance when tilted, featuring images and denomination.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.textformat,
                                  title: 'Microprinting',
                                  subtitle:
                                      'Tiny, detailed text visible under magnification.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.lightbulb_fill,
                                  title: 'UV Features',
                                  subtitle:
                                      'Special fibers and patterns visible under UV light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.text_alignleft,
                                  title: 'Raised Print',
                                  subtitle:
                                      'Denominations and key elements printed with raised ink.',
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text(
                                'Security Features on the 20,000 Notes',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'Visible Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.music_note,
                                  title:
                                      'Portrait of a man wearing a karakul hat',
                                  subtitle: 'Representing the people of Uganda',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Coat of Arms',
                                  subtitle:
                                      'Symbols of spears and waves of Lake Victoria.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'National Independence Monument',
                                  subtitle:
                                      'Symbol of the country’s journey to independence',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Parliament Building',
                                  subtitle:
                                      "Symbolizing Uganda's legislative authority",
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Rwenzori Mountains',
                                  subtitle:
                                      "Highlights the country's rich landscapes.",
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Hidden Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.eye,
                                  title: 'Watermark',
                                  subtitle:
                                      'Clear portrait of a crested crane and denomination when held up to light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.doc_on_clipboard,
                                  title: 'Security Thread',
                                  subtitle:
                                      'Embedded thread with "BOU" and denomination visible under light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.sparkles,
                                  title: 'Holographic Stripe',
                                  subtitle:
                                      'Changes appearance when tilted, featuring images and denomination.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.lightbulb_fill,
                                  title: 'UV Features',
                                  subtitle:
                                      'Special fibers and patterns visible under UV light.',
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text(
                                'Security Features on the 10,000 Notes',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'Visible Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.music_note,
                                  title: 'Musical Instruments',
                                  subtitle:
                                      'Prominent display of Uganda’s rich musical heritage.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Coat of Arms',
                                  subtitle:
                                      'Symbols of spears and waves of Lake Victoria.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Kiira Hydroelectric Power Station',
                                  subtitle:
                                      "Highlighting Uganda's advancements in infrastructure and commitment to harnessing natural resources for sustainable energy.",
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Hidden Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.eye,
                                  title: 'Watermark',
                                  subtitle:
                                      'Clear portrait of a crested crane and denomination when held up to light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.doc_on_clipboard,
                                  title: 'Security Thread',
                                  subtitle:
                                      'Embedded thread with "BOU" and denomination visible under light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.sparkles,
                                  title: 'Holographic Stripe',
                                  subtitle:
                                      'Changes appearance when tilted, featuring images and denomination.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.textformat,
                                  title: 'Microprinting',
                                  subtitle:
                                      'Tiny, detailed text visible under magnification.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.lightbulb_fill,
                                  title: 'UV Features',
                                  subtitle:
                                      'Special fibers and patterns visible under UV light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.text_alignleft,
                                  title: 'Raised Print',
                                  subtitle:
                                      'Denominations and key elements printed with raised ink.',
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text(
                                'Security Features on the 5,000 Notes',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'Visible Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.music_note,
                                  title:
                                      'Striking image of a man with a drum takes center stage',
                                  subtitle:
                                      "Capturing the essence of Uganda's rich musical heritage. This portrayal celebrates the country's vibrant rhythms and traditions, showcasing its cultural vibrancy to the world.",
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Coat of Arms',
                                  subtitle:
                                      'Symbols of spears and waves of Lake Victoria.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Crested crane',
                                  subtitle:
                                      "Symbols of the nation's history and aspirations",
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Traditional spears',
                                  subtitle:
                                      "Symbols of the nation's history and aspirations",
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Map of Uganda',
                                  subtitle:
                                      'Serves as a backdrop, highlighting the geographical diversity and beauty of the nation..',
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Hidden Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.eye,
                                  title: 'Watermark',
                                  subtitle:
                                      'Clear portrait of a crested crane and denomination when held up to light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.doc_on_clipboard,
                                  title: 'Security Thread',
                                  subtitle:
                                      'Embedded thread with "BOU" and denomination visible under light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.sparkles,
                                  title: 'Holographic Stripe',
                                  subtitle:
                                      'Changes appearance when tilted, featuring images and denomination.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.textformat,
                                  title: 'Microprinting',
                                  subtitle:
                                      'Tiny, detailed text visible under magnification.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.lightbulb_fill,
                                  title: 'UV Features',
                                  subtitle:
                                      'Special fibers and patterns visible under UV light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.text_alignleft,
                                  title: 'Raised Print',
                                  subtitle:
                                      'Denominations and key elements printed with raised ink.',
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text(
                                'Security Features on the 2,000 Notes',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'Visible Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.music_note,
                                  title: "A traditional Ugandan drum",
                                  subtitle:
                                      "Takes center stage, symbolizing the country's rich cultural heritage and rhythmic traditions",
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Coat of Arms',
                                  subtitle:
                                      'Symbols of spears and waves of Lake Victoria.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Crested crane and spears',
                                  subtitle:
                                      "Symbols of the nation's history and aspirations.",
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title:
                                      "Uganda's iconic landmarks and cultural symbols",
                                  subtitle:
                                      "Proudly displays symbols of national identity, i.",
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'The map of Uganda',
                                  subtitle:
                                      "Serves as a backdrop, showcasing the nation's diverse landscapes and geographical features, including the equator.",
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Hidden Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.eye,
                                  title: 'Watermark',
                                  subtitle:
                                      'Clear portrait of a crested crane and denomination when held up to light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.doc_on_clipboard,
                                  title: 'Security Thread',
                                  subtitle:
                                      'Embedded thread with "BOU" and denomination visible under light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.textformat,
                                  title: 'Microprinting',
                                  subtitle:
                                      'Tiny, detailed text visible under magnification.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.lightbulb_fill,
                                  title: 'UV Features',
                                  subtitle:
                                      'Special fibers and patterns visible under UV light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.text_alignleft,
                                  title: 'Raised Print',
                                  subtitle:
                                      'Denominations and key elements printed with raised ink.',
                                ),
                              ],
                            ),
                            ExpansionTile(
                              title: Text(
                                'Security Features on the 1,000 Notes',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              children: [
                                SizedBox(height: 20),
                                Text(
                                  'Visible Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.music_note,
                                  title: 'Banana plantation',
                                  subtitle:
                                      "Symbolizing the importance of agriculture in the nation's economy and livelihoods. This depiction pays homage to the hard work and resilience of Uganda's farmers, who play a vital role in feeding the nation and driving economic growth.",
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.shield,
                                  title: 'Trucks in front of grain silos',
                                  subtitle:
                                      "Represent Uganda's agricultural infrastructure and logistics network. These symbols underscore the country's commitment to modernization and efficiency in the agricultural sector, ensuring the timely delivery and distribution of crops to markets and communities across the nation.",
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Hidden Features:',
                                  style: GoogleFonts.openSans(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                buildFeatureTile(
                                  icon: CupertinoIcons.eye,
                                  title: 'Watermark',
                                  subtitle:
                                      'Clear portrait of a crested crane and denomination when held up to light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.doc_on_clipboard,
                                  title: 'Security Thread',
                                  subtitle:
                                      'Embedded thread with "BOU" and denomination visible under light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.textformat,
                                  title: 'Microprinting',
                                  subtitle:
                                      'Tiny, detailed text visible under magnification.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.lightbulb_fill,
                                  title: 'UV Features',
                                  subtitle:
                                      'Special fibers and patterns visible under UV light.',
                                ),
                                buildFeatureTile(
                                  icon: CupertinoIcons.text_alignleft,
                                  title: 'Raised Print',
                                  subtitle:
                                      'Denominations and key elements printed with raised ink.',
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: buildNotesContent(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
