import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HetPatelApp());
}

class HetPatelApp extends StatelessWidget {
  const HetPatelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Het Patel",
      home: LaptopView(),
    );
  }
}

class LaptopView extends StatefulWidget {
  const LaptopView({super.key});

  @override
  State<LaptopView> createState() => _LaptopViewState();
}

class _LaptopViewState extends State<LaptopView> {
  final List<_Project> _projects = [
    _Project(
      index: 0,
      title: "Project Mirage",
      subtitle:
          "Photo and Video culling tool using ML vision models in PyTorch",
      link: "https://github.com/hetkpatel/Project-Mirage",
      live: true,
      tags: [
        ("Python", ""),
        ("CNNs", "Convolutional Neural Network"),
        ("PyTorch", ""),
        ("Vector Database", ""),
      ],
    ),
    _Project(
      index: 1,
      title: "AI Test Bench",
      subtitle: "Collection of various AI projects across various domains",
      link: "https://github.com/hetkpatel/AI-Test-Bench",
      live: true,
      tags: [
        ("MLPs", "Multilayer Perceptron"),
        ("RNNs", "Recurrent Neural Network"),
        ("CNNs", "Convolutional Neural Network"),
        ("LLMs", "Large Language Models"),
        ("Transformers", ""),
      ],
    ),
    _Project(
      index: 2,
      title: "Winglet",
      subtitle: "Community for future pilots to build hours",
      link: "",
      live: false,
      tags: [
        ("Start-up", ""),
        ("Flutter", ""),
        ("Firebase", ""),
      ],
    ),
    _Project(
      index: 3,
      title: "Campus Oven",
      subtitle: "Food delivery service for campus students",
      link: "",
      live: false,
      tags: [
        ("Shopify", ""),
        ("Start-up", ""),
        ("Flutter", ""),
      ],
    ),
    _Project(
      index: 4,
      title: "SMARTS Club App",
      subtitle: "Tutoring center SaaS (Student progress and attendance)",
      link: "",
      live: false,
      tags: [
        ("Flutter", ""),
        ("Firebase", ""),
        ("GCP", "Google Cloud Platform"),
      ],
    ),
  ];
  final List<bool> _showUnderline = [false, false, false, false, false];

  Widget _buildEducation({
    required String school,
    required String timePeriod,
    required String degree,
    required double width,
  }) =>
      width >= 575
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      school,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      timePeriod,
                      style: GoogleFonts.robotoMono(
                        color: const Color(0xFF6B7280),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  degree,
                  style: GoogleFonts.robotoMono(
                    color: const Color(0xFF6B7280),
                    fontSize: 14,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  school,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  timePeriod,
                  style: GoogleFonts.robotoMono(
                    color: const Color(0xFF6B7280),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  degree,
                  style: GoogleFonts.robotoMono(
                    color: const Color(0xFF6B7280),
                    fontSize: 14,
                  ),
                ),
              ],
            );

  Widget _buildWorkExperience({
    required String company,
    required String position,
    required String timePeriod,
    required String summary,
    required List<String> keySkills,
    required double width,
  }) {
    keySkills.insert(0, "Key skills");
    return width >= 575
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    company,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    timePeriod,
                    style: GoogleFonts.robotoMono(
                      fontSize: 14,
                      color: const Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
              Text(
                position,
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                summary,
                style: GoogleFonts.robotoMono(
                  fontSize: 12,
                  color: const Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: keySkills
                    .map((e) => e == "Key skills"
                        ? Text(
                            "Key skills:",
                            style: GoogleFonts.robotoMono(
                              fontSize: 12,
                              color: const Color(0xFF6B7280),
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Chip(
                            label: Text(
                              e,
                              style: GoogleFonts.robotoMono(
                                fontSize: 12,
                              ),
                            ),
                          ))
                    .toList(),
              ),
              const SizedBox(height: 8),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                timePeriod,
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                  color: const Color(0xFF6B7280),
                ),
              ),
              Text(
                position,
                style: GoogleFonts.robotoMono(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                summary,
                style: GoogleFonts.robotoMono(
                  fontSize: 12,
                  color: const Color(0xFF6B7280),
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 4,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: keySkills
                    .map((e) => e == "Key skills"
                        ? Text(
                            "Key skills:",
                            style: GoogleFonts.robotoMono(
                              fontSize: 12,
                              color: const Color(0xFF6B7280),
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        : Chip(
                            label: Text(
                              e,
                              style: GoogleFonts.robotoMono(
                                fontSize: 12,
                              ),
                            ),
                          ))
                    .toList(),
              ),
              const SizedBox(height: 8),
            ],
          );
  }

  void _launchUrl(url) async {
    url = Uri.parse(url);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  (int, double) _calculateGridLayout(double width) {
    if (width < 1233) {
      return (2, 1.5);
    } else {
      return (3, 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: size.width >= 426
            ? const EdgeInsets.all(64.0)
            : const EdgeInsets.symmetric(vertical: 64.0, horizontal: 16.0),
        child: Center(
          child: SizedBox(
            width: size.width >= 860 ? size.width * 0.5 : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // INTRO
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: size.width >= 860
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Het Patel',
                                    style: GoogleFonts.inter(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'I like working with data, AI, and Business Intelligence | Bridging Technology and Business | Entrepreneurial Spirit',
                                    style: GoogleFonts.robotoMono(
                                      fontSize: 14,
                                      color: const Color(0xFF6b7280),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.public_rounded,
                                        size: 14,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        "Dallas, TX, USA".toUpperCase(),
                                        style: GoogleFonts.spaceMono(
                                          fontSize: 12,
                                          color: const Color(0xFF6b7280),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Wrap(
                                    spacing: 8,
                                    children: [
                                      IconButton.outlined(
                                        icon: const Icon(Icons.email_rounded),
                                        onPressed: () {
                                          FlutterClipboard.copy(
                                              "hetkpatel9@gmail.com");
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(
                                              'Copied hetkpatel9@gmail.com',
                                              style: GoogleFonts.robotoMono(),
                                            ),
                                          ));
                                        },
                                      ),
                                      IconButton.outlined(
                                        icon: const FaIcon(
                                            FontAwesomeIcons.github),
                                        onPressed: () => _launchUrl(
                                            "https://github.com/hetkpatel"),
                                      ),
                                      IconButton.outlined(
                                        icon: const FaIcon(
                                            FontAwesomeIcons.linkedin),
                                        onPressed: () => _launchUrl(
                                            "https://linkedin.com/in/hetkp"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(left: size.width * 0.065),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Align(
                                  alignment: Alignment.center,
                                  heightFactor: 0.5,
                                  widthFactor: 0.5,
                                  child: Image.asset(
                                    "assets/hetPatel.jpg",
                                    width: 350,
                                    height: 350,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Align(
                                alignment: Alignment.center,
                                heightFactor: 0.5,
                                widthFactor: 0.5,
                                child: Image.asset(
                                  "assets/hetPatel.jpg",
                                  width: 350,
                                  height: 350,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            Text(
                              'Het Patel',
                              style: GoogleFonts.inter(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'I like working with data, AI, and Business Intelligence | Bridging Technology and Business | Entrepreneurial Spirit',
                              style: GoogleFonts.robotoMono(
                                fontSize: 14,
                                color: const Color(0xFF6b7280),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.public_rounded,
                                  size: 14,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  "Dallas, TX, USA".toUpperCase(),
                                  style: GoogleFonts.spaceMono(
                                    fontSize: 12,
                                    color: const Color(0xFF6b7280),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              children: [
                                IconButton.outlined(
                                  icon: const Icon(Icons.email_rounded),
                                  onPressed: () {
                                    FlutterClipboard.copy(
                                        "hetkpatel9@gmail.com");
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                        'Copied hetkpatel9@gmail.com',
                                        style: GoogleFonts.robotoMono(),
                                      ),
                                    ));
                                  },
                                ),
                                IconButton.outlined(
                                  icon: const FaIcon(FontAwesomeIcons.github),
                                  onPressed: () => _launchUrl(
                                      "https://github.com/hetkpatel"),
                                ),
                                IconButton.outlined(
                                  icon: const FaIcon(FontAwesomeIcons.linkedin),
                                  onPressed: () => _launchUrl(
                                      "https://linkedin.com/in/hetkp"),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
                // ABOUT
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "👋 Hello, I'm Het Patel, a passionate tech enthusiast and problem solver currently navigating the realms of Information Technology. Armed with a BS in Information Technology and Systems from The University of Texas at Dallas and currently pursuing an MS in Information Technology Management, I thrive at the intersection of technology and business applications.\n\nMy expertise lies in seamlessly combining technology with business needs, and my skills encompass data processing, artificial intelligence, business intelligence, and a curious spirit that fuels my drive. I find inspiration in tackling challenging projects that leverage intriguing technologies to solve critical problems.",
                        style: GoogleFonts.robotoMono(
                          fontSize: 14,
                          color: const Color(0xFF6b7280),
                        ),
                      ),
                    ],
                  ),
                ),
                // EDUCATION
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Education',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildEducation(
                        school: "The University of Texas at Dallas",
                        timePeriod: "Jan 2024 - May 2025",
                        degree:
                            "Master of Science in Information Technology Management",
                        width: size.width,
                      ),
                      SizedBox(height: size.width >= 575 ? 6 : 12),
                      _buildEducation(
                        school: "The University of Texas at Dallas",
                        timePeriod: "Aug 2018 - May 2021",
                        degree:
                            "Bachelor's of Science in Information Technology and Systems",
                        width: size.width,
                      ),
                    ],
                  ),
                ),
                // WORK EXPERIENCE
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Work Experience',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildWorkExperience(
                        company: "NorthStar Accessories",
                        position: "Founder and Chief Executive Officer (CEO)",
                        timePeriod: "Aug 2020 - Present",
                        summary:
                            "Pioneered and successfully launched an e-commerce venture specializing in electronic accessories. Spearheaded expansion efforts into international markets, including Canada, Mexico, the UK, Japan, and India. Developed expertise in Amazon marketing, executed strategic business decisions, and gained hands-on experience in business acumen.",
                        keySkills: [
                          'Amazon Seller Central',
                          'Fullfilment by Amazon',
                          'Docker',
                          'Amazon Web Services',
                          'Google Cloud Platform',
                          'Python',
                          'Business Intelligence',
                        ],
                        width: size.width,
                      ),
                      const SizedBox(height: 12),
                      _buildWorkExperience(
                        company: "T-Mobile",
                        position:
                            "Implementation Engineer → Partner Solutions Engineer",
                        timePeriod: "May 2021 - Jul 2022",
                        summary:
                            "Implemented innovative end-to-end network solutions using T-Mobile's 5G network and global MPLS backbone, optimizing bandwidth for exceptional business outcomes. Proactively utilized advanced network monitoring to ensure security and mitigate bandwidth throttling risks, strategically upselling higher capacities to maximize customer satisfaction and revenue.",
                        keySkills: [
                          'Network Ops',
                          'PowerBI',
                          'MPLS',
                          'Amazon Web Services',
                          'PowerBI',
                          'Python Scripting',
                          'Google Cloud Platform',
                          'Data Automation',
                          'ETL pipeline',
                        ],
                        width: size.width,
                      ),
                      const SizedBox(height: 12),
                      _buildWorkExperience(
                        company: "SMARTS Club, LLC",
                        position: "Tutor → Tech Consultant",
                        timePeriod: "Oct 2017 - Jun 2019",
                        summary:
                            "Led a team to develop an end-to-end SaaS solution for local tutoring center, utilizing Google Cloud Platform. Led project from requirements definition to implementation, creating a centralized NoSQL database and Google Sheets integration for attendance tracking. Designed user-facing website, tablet app for attendance, and backend portal for reporting and billing. Delivered a comprehensive solution that significantly improved operational efficiency and learning experience for students.",
                        keySkills: [
                          'Firebase',
                          'Flutter',
                          'NoSQL',
                          'SaaS',
                          'Google Cloud Platform',
                          'Enterprise System',
                        ],
                        width: size.width,
                      ),
                    ],
                  ),
                ),
                // PROJECTS
                Padding(
                  padding: const EdgeInsets.only(bottom: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Projects',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 12),
                          AvatarGlow(
                            glowColor: const Color(0xFF22C55E),
                            glowShape: BoxShape.circle,
                            curve: Curves.fastOutSlowIn,
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                color: Color(0xFF22C55E),
                              ),
                              width: 8,
                              height: 8,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '-currently working on',
                            style: GoogleFonts.robotoMono(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      size.width >= 1024
                          ? GridView.count(
                              crossAxisCount:
                                  _calculateGridLayout(size.width).$1,
                              shrinkWrap: true,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio:
                                  _calculateGridLayout(size.width).$2,
                              children: _projects
                                  .map(
                                    (e) => Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MouseRegion(
                                            cursor: e.link.isNotEmpty
                                                ? SystemMouseCursors.click
                                                : MouseCursor.defer,
                                            onEnter: (_) {
                                              if (e.link.isNotEmpty) {
                                                setState(() =>
                                                    _showUnderline[e.index] =
                                                        true);
                                              }
                                            },
                                            onExit: (_) {
                                              if (e.link.isNotEmpty) {
                                                setState(() =>
                                                    _showUnderline[e.index] =
                                                        false);
                                              }
                                            },
                                            child: GestureDetector(
                                              onTapUp: (_) {
                                                if (e.link.isNotEmpty) {
                                                  _launchUrl(e.link);
                                                }
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    e.title,
                                                    style: GoogleFonts.inter(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      decoration:
                                                          _showUnderline[
                                                                  e.index]
                                                              ? TextDecoration
                                                                  .underline
                                                              : TextDecoration
                                                                  .none,
                                                    ),
                                                  ),
                                                  if (e.live)
                                                    const SizedBox(width: 8),
                                                  if (e.live)
                                                    AvatarGlow(
                                                      glowColor: const Color(
                                                          0xFF22C55E),
                                                      glowShape:
                                                          BoxShape.circle,
                                                      curve:
                                                          Curves.fastOutSlowIn,
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(20),
                                                          ),
                                                          color:
                                                              Color(0xFF22C55E),
                                                        ),
                                                        width: 8,
                                                        height: 8,
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            e.subtitle,
                                            style: GoogleFonts.robotoMono(
                                              fontSize: 12,
                                              color: const Color(0xFF6B7280),
                                            ),
                                          ),
                                          Expanded(
                                            child: Wrap(
                                              spacing: 8,
                                              runSpacing: 4,
                                              crossAxisAlignment:
                                                  WrapCrossAlignment.center,
                                              runAlignment: WrapAlignment.end,
                                              children: e.tags
                                                  .map(
                                                    (e) => Tooltip(
                                                      message: e.$2,
                                                      child: Chip(
                                                        label: Text(
                                                          e.$1,
                                                          style: GoogleFonts
                                                              .robotoMono(
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        padding:
                                                            const EdgeInsets
                                                                .all(0),
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
                          : ListView(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: _projects
                                  .map(
                                    (e) => Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      padding: const EdgeInsets.all(12.0),
                                      margin:
                                          const EdgeInsets.only(bottom: 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTapUp: (_) {
                                              if (e.link.isNotEmpty) {
                                                _launchUrl(e.link);
                                              }
                                            },
                                            child: Row(
                                              children: [
                                                Text(
                                                  e.title,
                                                  style: GoogleFonts.inter(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w600,
                                                    decoration: e
                                                            .link.isNotEmpty
                                                        ? TextDecoration
                                                            .underline
                                                        : TextDecoration.none,
                                                  ),
                                                ),
                                                if (e.live)
                                                  const SizedBox(width: 8),
                                                if (e.live)
                                                  AvatarGlow(
                                                    glowColor:
                                                        const Color(0xFF22C55E),
                                                    glowShape: BoxShape.circle,
                                                    curve: Curves.fastOutSlowIn,
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(20),
                                                        ),
                                                        color:
                                                            Color(0xFF22C55E),
                                                      ),
                                                      width: 8,
                                                      height: 8,
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            e.subtitle,
                                            style: GoogleFonts.robotoMono(
                                              fontSize: 12,
                                              color: const Color(0xFF6B7280),
                                            ),
                                          ),
                                          const SizedBox(height: 16),
                                          Wrap(
                                            spacing: 8,
                                            runSpacing: 4,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            runAlignment: WrapAlignment.end,
                                            children: e.tags
                                                .map(
                                                  (e) => Tooltip(
                                                    message: e.$2,
                                                    child: Chip(
                                                      label: Text(
                                                        e.$1,
                                                        style: GoogleFonts
                                                            .robotoMono(
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                    ],
                  ),
                ),
                // FOOTER
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Center(
                      child: Text(
                    'Last Updated: 01.22.2024',
                    style: GoogleFonts.robotoMono(fontSize: 12),
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Project {
  int index;
  String title, subtitle, link;
  bool live;
  List<(String, String)> tags;

  _Project({
    required this.index,
    required this.title,
    required this.subtitle,
    required this.link,
    required this.live,
    required this.tags,
  });
}
