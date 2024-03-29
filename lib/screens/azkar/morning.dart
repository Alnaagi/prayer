import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/widgets.dart';
import 'package:prayer/common/azkar_widget.dart';

class MorningPage extends StatefulWidget {
  const MorningPage({super.key});

  @override
  State<MorningPage> createState() => _MorningPageState();
}

class _MorningPageState extends State<MorningPage> {
  List listArr = [
    {
      "basmala": "",
      "Alzikr":
          "أَسْـتَغْفِرُ الله، أَسْـتَغْفِرُ الله، أَسْـتَغْفِرُ الله.\fاللّهُـمَّ أَنْـتَ السَّلامُ ، وَمِـنْكَ السَّلام ، تَبارَكْتَ يا ذا الجَـلالِ وَالإِكْـرام . ",
      "benefit": "",
    },
    {
      "basmala": "",
      "Alzikr":
          "لا إلهَ إلاّ اللّهُ وحدَهُ لا شريكَ لهُ، لهُ المُـلْكُ ولهُ الحَمْد، وهوَ على كلّ شَيءٍ قَدير، اللّهُـمَّ لا مانِعَ لِما أَعْطَـيْت، وَلا مُعْطِـيَ لِما مَنَـعْت، وَلا يَنْفَـعُ ذا الجَـدِّ مِنْـكَ الجَـد.",
      "benefit": "",
    },
    {
      "basmala": "",
      "Alzikr":
          "لا إلهَ إلاّ اللّه, وحدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمد، وهوَ على كلّ شيءٍ قدير، لا حَـوْلَ وَلا قـوَّةَ إِلاّ بِاللهِ، لا إلهَ إلاّ اللّـه، وَلا نَعْـبُـدُ إِلاّ إيّـاه, لَهُ النِّعْـمَةُ وَلَهُ الفَضْل وَلَهُ الثَّـناءُ الحَـسَن، لا إلهَ إلاّ اللّهُ مخْلِصـينَ لَـهُ الدِّينَ وَلَوْ كَـرِهَ الكـافِرون.",
      "benefit": "",
    },
    {
      "basmala": "",
      "Alzikr": "سُـبْحانَ اللهِ، والحَمْـدُ لله ، واللهُ أكْـبَر. ",
      "benefit": "",
    },
    {
      "basmala": "",
      "Alzikr":
          "لا إلهَ إلاّ اللّهُ وَحْـدَهُ لا شريكَ لهُ، لهُ الملكُ ولهُ الحَمْد، وهُوَ على كُلّ شَيءٍ قَـدير.",
      "benefit": "",
    },
    {
      "basmala": "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم",
      "Alzikr":
          "قُلْ هُوَ ٱللَّهُ أَحَدٌ، ٱللَّهُ ٱلصَّمَدُ، لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُن لَّهُۥ كُفُوًا أَحَدٌۢ.",
      "benefit": "ثلاث مرات",
    },
    {
      "basmala": "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم",
      "Alzikr":
          "قُلْ أَعُوذُ بِرَبِّ ٱلْفَلَقِ، مِن شَرِّ مَا خَلَقَ، وَمِن شَرِّ غَاسِقٍ إِذَا وَقَبَ، وَمِن شَرِّ ٱلنَّفَّٰثَٰتِ فِى ٱلْعُقَدِ، وَمِن شَرِّ حَاسِدٍ إِذَا حَسَدَ.",
      "benefit": "ثلاث مرات",
    },
    {
      "basmala": "بِسْمِ اللهِ الرَّحْمنِ الرَّحِيم",
      "Alzikr":
          "قُلْ أَعُوذُ بِرَبِّ ٱلنَّاسِ، مَلِكِ ٱلنَّاسِ، إِلَٰهِ ٱلنَّاسِ، مِن شَرِّ ٱلْوَسْوَاسِ ٱلْخَنَّاسِ، ٱلَّذِى يُوَسْوِسُ فِى صُدُورِ ٱلنَّاسِ، مِنَ ٱلْجِنَّةِ وَٱلنَّاسِ.",
      "benefit": "ثلاث مرات",
    },
    {
      "basmala": "أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ",
      "Alzikr":
          "اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ.",
      "benefit": "",
    },
    {
      "basmala": "",
      "Alzikr":
          "لا إلهَ إلاّ اللّهُ وحْـدَهُ لا شريكَ لهُ، لهُ المُلكُ ولهُ الحَمْد، يُحيـي وَيُمـيتُ وهُوَ على كُلّ شيءٍ قدير.",
      "benefit": "عَشْر مَرّات بَعْدَ المَغْرِب وَالصّـبْح.",
    },
    {
      "basmala": "",
      "Alzikr":
          "اللّهُـمَّ إِنِّـي أَسْأَلُـكَ عِلْمـاً نافِعـاً وَرِزْقـاً طَيِّـباً ، وَعَمَـلاً مُتَقَـبَّلاً. ",
      "benefit": "بَعْد السّلامِ من صَلاةِ الفَجْر.",
    },
    {
      "basmala": "",
      "Alzikr": "اللَّهُمَّ أَجِرْنِي مِنْ النَّار.",
      "benefit": "بعد صلاة الصبح والمغرب.",
    },
    {
      "basmala": "",
      "Alzikr":
          "اللَّهُمَّ أَعِنِّي عَلَى ذِكْرِكَ وَشُكْرِكَ وَحُسْنِ عِبَادَتِكَ. ",
      "benefit": "",
    },
  ];

  double _value = 0.0;
  double value = 1;
  ImageProvider logo = const AssetImage("assets/images/sand.png");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: logo, fit: BoxFit.fill),
        ),
        child: ListView.builder(
          itemCount: listArr.length,
          itemBuilder: (context, index) {
            var obj = listArr[index] as Map? ?? {};
            return AzkarWidget(obj: obj);
          },
        ),
      ),
    );
  }
}



// body: Column(
      //   children: [
      //     Align(
      //       alignment: Alignment.center,
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      //         child: Text(
      //           "أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ",
      //           style: TextStyle(
      //               color: Colors.black54,
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //           textDirection: TextDirection.rtl,
      //         ),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.centerRight,
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      //         child: Text(
      //           "اللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ. [آية الكرسى - البقرة 255].",
      //           style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //           textDirection: TextDirection.rtl,
      //         ),
      //       ),
      //     ),
      //     Align(
      //       alignment: Alignment.centerRight,
      //       child: Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      //         child: Text(
      //           "",
      //           style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 20,
      //               fontWeight: FontWeight.bold),
      //           textDirection: TextDirection.rtl,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),



// Center(
//         child: InkWell(
//           splashColor: Colors.yellow,
//           onTap: () {
//             setState(() {
//               _value += value;
//             });
//           },
//           child: AnimatedFlipCounter(
//             value: _value,

//             // Use "infix" to show a value between negative sign and number
//             // infix: ' \$',
//             // fractionDigits: 2,
//             // wholeDigits: 8,
//             // hideLeadingZeroes: true,
//             // Some languages like French use comma as decimal separator
//             // decimalSeparator: ',',
//             // thousandSeparator: '.',
//             padding: const EdgeInsets.all(8),
//             textStyle: TextStyle(
//               fontSize: 48,
//               fontWeight: FontWeight.bold,
//               // letterSpacing: -8.0,
//               color: Colors.green,
//               shadows: const [
//                 BoxShadow(
//                   color: Colors.black54,
//                   offset: Offset(2, 3),
//                   blurRadius: 4,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),