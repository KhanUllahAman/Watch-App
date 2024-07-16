// ignore_for_file: unnecessary_string_escapes

import 'package:insomnia_app/Constants/app_styles.dart';
import 'package:insomnia_app/Models/remedies_model.dart';

class RemediesRepository {
  // Herbal  Remedies
  static List<RemediesModel> herbalRemedies = [
    RemediesModel(
      imageUrl: AppStyles.chamomile,
      remedyName: "Chamomile",
      remedyDescription:
          "As known as \"بابونہ\" in Urdu, is a popular herb known for its calming properties and potential to improve sleep quality. Chamomile contains compounds that may interact with receptors in the brain, promoting relaxation and reducing anxiety. It is commonly consumed as tea but can also be found in capsule or extract form. Drinking chamomile tea before bedtime is a common practice to help induce sleep and alleviate insomnia symptoms. However, individual responses to chamomile may vary, so it's essential to consult with a healthcare professional before using it as a sleep aid, especially if you have any underlying health conditions or are taking medications.\nچمومائل ایک قسم کا پودا ہے جس کے پتوں اور پھولوں کو عام طور پر چائے کے طور پر استعمال کیا جاتا ہے۔ یہ پودا عام طور پر دماغ کو پر سکون کرنے اور تناو کو کم کرنے کے لئے استعمال کیا جاتا ہے۔ چمومائل کی چائے کو عام طور پر \"بابونہ کی چائے\" کہا جاتا ہے۔",
    ),
    RemediesModel(
        imageUrl: AppStyles.lavenderoil,
        remedyName: "Lavender Oil",
        remedyDescription:
            "As known as \"خوشبو دار تیل\" in Urdu, is derived from the flowers of the lavender plant and is renowned for its soothing aroma and potential health benefits, including its ability to promote relaxation and improve sleep quality. Lavender oil contains compounds such as linalool and linalyl acetate, which have been shown to have calming effects on the nervous system. This can help reduce anxiety and stress, making it easier to fall asleep and enhancing overall sleep satisfaction. Lavender oil can be used in various ways to promote sleep, including diffusing it in the air, adding a few drops to a warm bath, or applying it topically to pulse points. However, it's important to dilute lavender oil with a carrier oil before applying it to the skin, as it can cause irritation in its concentrated form. As with any essential oil, it's advisable to perform a patch test before using lavender oil extensively and consult with a healthcare professional if you have any concerns or underlying health conditions.\nلیونڈر کا تیل، جو \"خوشبو دار تیل\"کے نام سے بھی مشہور ہے، لاونڈر کی پودے کے پھولوں سے حاصل کیا جاتا ہے اور اس کی خوشبو اور صحت کے فوائد کے لئے مشہور ہے، جو کہ دل کو سکون فراہم کرنے اور نیند کی معیار کو بہتر بنانے کی صلاحیت رکھتا ہے۔ لیونڈر کا تیل میں لینالول اور لینلائل ایسیٹیٹ جیسے مرکبات شامل ہوتے ہیں، جن کا ثابت شدہ ہے کہ یہ عصبی نظام پر پر سکونیت فراہم کرتے ہیں۔ یہ تنائی اور دباؤ کو کم کرنے میں مدد فراہم کرسکتا ہے، جو نیند کو آنے میں آسانی پیدا کرتا ہے اور کلونی نیند کی رضائت کو بڑھاتا ہے۔ لیونڈر کا تیل نیند کو فروغ دینے کے مختلف طریقوں میں استعمال کیا جا سکتا ہے، جیسے کہ ہوا میں دم کرنا، گرم گرم نہانے میں چند قطرے ڈالنا، یا جلد پر نرم دباؤ کی جگہوں پر لگانا۔ لیکن، اسے جلد پر لگانے سے پہلے ضروری ہے کہ اسے کیریئر تیل کے ساتھ ملا کر تھوڑا پانی کر لیا جائے، کیونکہ اس کا مرکب فارم میں جلد کو تکلیف دے سکتا ہے۔ کسی بھی ضروری تیل کی طرح، لیونڈر کے تیل کا وسیع استعمال سے پہلے ایک پیچ ٹیسٹ کرنا اور اگر آپ کو کوئی پریشانی یا بنیادی صحت کی کوئی مسئلہ ہو تو معاون ماہر صحت سے مشورہ کرنا ضروری ہے"),
    RemediesModel(
        imageUrl: AppStyles.passionFlower,
        remedyName: "Passion Flower",
        remedyDescription:
            ": As known as \"پیشاوری فولادار\" in Urdu, is a plant renowned for its potential calming and sleep-promoting properties. It contains flavonoids, alkaloids, and other compounds that may have anxiolytic (anxiety-reducing) effects on the nervous system. Passion flower has been traditionally used as a natural remedy for anxiety, insomnia, and restlessness. It is available in various forms, including teas, tinctures, capsules, and extracts. Consuming passion flower tea or taking passion flower supplements may help induce relaxation, reduce stress, and improve sleep quality. However, it's essential to consult with a healthcare professional before using passion flower, especially if you are pregnant, breastfeeding, or taking medications, as it may interact with certain drugs or have contraindications for certain medical conditions. Additionally, individual responses to passionflower may vary, so it's essential to start with a low dose and monitor your body's reaction.\nپیشاوری فولادار: یہ ایک پودا ہے جسے اردو میں \"پیشاوری فولادار\" کہا جاتا ہے، اور اس کا مشہوری سے معروف ہے کہ یہ دماغی نظام پر سکون بخش اور نیند کو بڑھانے والے خصوصیات رکھتا ہے۔ اس میں فلاونوئیڈز، ایلکلوئیڈز، اور دوسرے مرکبات پائے جاتے ہیں جو عصبی نظام پر دباؤ کم کرنے کے اثرات رکھتے ہیں۔ پیشاوری فولادار کو دباؤ، نیند کی مسائل، اور بے چینی کے لیے قدیم دور سے استعمال کیا جاتا آیا ہے۔ یہ مختلف فارمز میں دستیاب ہوتا ہے، جیسے کہ چائے، ٹنکچر، کیپسول، اور انسٹریکٹس۔ پیشاوری فولادار کی چائے پینا یا پیشاوری فولادار کے سپلیمنٹس استعمال کرنا سکون پیدا کرنے، دباؤ کو کم کرنے، اور نیند کی معیار کو بہتر بنانے میں مدد فراہم کر سکتا ہے۔ لیکن، اسے استعمال کرنے سے پہلے ایک صحت کی دیکھ بھال کے فرد سے مشورہ لینا ضروری ہے، خاص طور پر اگر آپ حاملہ ہیں، دودھ پلاتی ہیں، یا دوائیاں لے رہے ہیں، کیونکہ یہ کچھ دوائیوں کے ساتھ اثرات ڈال سکتا ہے یا کچھ طبی حالات کے لیے مناسب نہیں ہوسکتا۔ اس کے علاوہ، پیشاوری فولادار کے استعمال کی انفرادی پراتریتیں مختلف ہوسکتی ہیں، لہذا اپنے جسم کی پرتریتیوں کا احتیاطی طور پر مداخلت کرنا ضروری ہے۔"),
    RemediesModel(
        imageUrl: AppStyles.melatonin,
        remedyName: "Melatonin",
        remedyDescription:
            "As known as \"میلٹونن\" in Urdu, is a hormone naturally produced in the brain that regulates the sleep-wake cycle. For those experiencing insomnia, melatonin supplements can be beneficial in promoting better sleep. Taken before bedtime, melatonin helps regulate sleep patterns and improve sleep quality. However, it's essential to follow dosage instructions carefully and consult with a healthcare professional, especially if you have underlying health conditions or are taking medications. Incorporating melatonin supplements into a bedtime routine, along with practicing good sleep hygiene habits, can contribute to better sleep outcomes for individuals with insomnia.\nمیلٹونن، جو \"میلٹونن\" کے نام سے بھی معروف ہے، ایک ہارمون ہے جو دماغ میں خود بنتا ہے اور نیند اور بیداری کا چکر ریگولیٹ کرتا ہے۔ جو لوگ نیند کی مشکلات سے دوچار ہیں، ان کے لئے میلٹونن کے مکمل مفاد ہو سکتے ہیں۔ رات کو سونے سے پہلے لیا جانے والا میلٹونن نیند کے نظام کو ریگولیٹ کرتا ہے اور نیند کی معیار کو بہتر بناتا ہے۔ البتہ، محتاطی سے ڈوز کی ہدایت کو پورا کرنا اور خاص طور پر اگر آپ کے پاس بنیادی صحتی مسائل ہیں یا دوائیاں استعمال کر رہے ہیں تو معاون ماہر صحت سے مشورہ کرنا ضروری ہے۔ میلٹونن کے مکمل کو ایک سونے کی عادت میں شامل کرنا، اور اچھی نیند کی حفاظتی انتظامات کا عمل میلٹونن کے مضبوط نتائج کے لئے اہم ہے"),
  ];

  // Herbal  Remedies
  static List<RemediesModel> quranicRemedies = [
    RemediesModel(
      imageUrl: AppStyles.dua_1,
      remedyName:
          "اللَّهُمَّ غَارَتِ النُّجُومُ وَهَدَأَتِ الْعُيُونُ وَأَنْتَ حَيٌّ قَيُّومٌ * لَا تَأْخُذُكَ سِنَةٌ وَلَا نَوْمٌ يَا حَيُّ يَا قَيُّومُ أَهْدِئْ لَيْلِي وَأَنِمْ عَيْنِي",
      remedyDescription:
          "\"O Allah the stars have gone far away, and the eyes are rested. You are Alive and Infinite; you do not slumber nor does sleep overtake You. Oh, Alive and the Everlasting One, grant me rest tonight and let my eyes sleep (close)\” \nاے اللہ! جب نجوم چھپ گئیں اور آنکھیں آرام پا گئیں اور تو ہمیشہ زندہ اور قائم رہنے والا ہے۔ تیری نیند یا سونا نہیں لیتا۔ اے زندہ اور قائم رہنے والے! میری رات کو آرام دے اور میری آنکھیں بند کر دے۔یہ دعا سکون اور نیند کی تلاش میں بہت خوبصورت ہے۔ یہ اللہ کی لامتناہیت کو تسلیم کرتی ہے اور اُمید اس کی رحمت کو حاصل کرتی ہے کہ اُس سے آرام اور سکون حاصل ہو۔ یہ نیند سے پہلے آرام کی تلاش میں ایک پیشگوئی ہے اور ایک سکون کا اظہار ہے۔",
    ),
    RemediesModel(
      imageUrl: AppStyles.dua_2,
      remedyName:
          "اللَّهُمَّ رَبَّ السَّمَوَاتِ السَّبْعِ وَمَا أَظَلَّتْ، وَرَبَّ الأَرَضِينَ وَمَا أَقَلَّتْ، وَرَبَّ الشَّيَاطِينِ وَمَا أَضَلَّتْ، كُنْ لِي جَارًا مِنْ شَرِّ خَلْقِكَ كُلِّهِمْ جَمِيعًا أَنْ يَفْرُطَ عَلَيَّ أَحَدٌ مِنْهُمْ أَوْ أَنْ يَبْغِيَ، عَزَّ جَارُكَ، وَجَلَّ ثَنَاؤُكَ، وَلَا إِلَهَ غَيْرُكَ، وَلَا إِلَهَ إِلَّا أَنْتَ",
      remedyDescription:
          "\"O Messenger of Allah, I cannot sleep at night because of insomnia. The Prophet (blessings and peace of Allah be upon him) said: When you go to your bed, say: O Allah, Lord of the seven heavens and what they shade, Lord of the seven earths and what they contain, Lord of the devils and what they misguide, be a protection for me from the evil of all Your creation, lest any of them wrong me or transgress against me. The one who is under Your protection is honoured; may You be glorified and praised, there is no god beside You, there is no god but You.\”\n\nاے اللہ! آسمانوں کے رب اور جو کچھ انہوں نے چھپا رکھا ہے، اور زمینوں کے رب اور جو کچھ انہوں نے کم کر دیا ہے، اور شیاطینوں کے رب اور جو کچھ انہوں نے بھٹکا دیا ہے، تو میرا دشمن کھلے سب کے برابر ہوجا، تاکہ ان میں سے کوئی مجھ پر اطمینانیت اور برائی کرے، تیری عزت، تیری جلال، اور تیری عبادت کے سوا کوئی معبود نہیں، اور کوئی معبود تیرے سوا نہیں۔",
    ),
    RemediesModel(
      imageUrl: AppStyles.dua_3,
      remedyName:
          "بِسْمِكَ رَبِّي وَضَعْتُ جَنْبِي، وَبِكَ أَرْفَعُهُ، فَإِنْ أَمْسَكْتَ نَفْسِي فَارْحَمْهَا، وَإِنْ أَرْسَلْتَهَا فَاحْفَظْهَا بِمَا تَحْفَظُ بِهِ عِبَادَكَ الصَّالِحِينَ.",
      remedyDescription:
          "\"In Your name, my Lord, I lie down, and, in Your name, I rise. So if You should take my soul, then have mercy upon it, and if You should return my soul, then protect it in the manner You do so with Your righteous servants.\"\nمیرے رب! تیرے نام میں میں لیٹتا ہوں اور تیرے نام میں میں اُٹھتا ہوں۔ اگر تو میری روح لے لیتا ہے تو اس پر رحم فرما، اور اگر تو میری روح واپس کر دیتا ہے تو اسے اپنے نیک بندوں کی طرح حفاظت فرما۔",
    ),
    RemediesModel(
      imageUrl: AppStyles.dua_4,
      remedyName:
          "اللَّهُمَّ إِنَّكَ خَلَقْتَ نَفْسِي وَأَنْتَ تَوَفَّاهَا، لَكَ مَمَاتُهَا وَمَحْيَاهَا، إِنْ أَحْيَيْتَهَا فَاحْفَظْهَا، وَإِنْ أَمَتَّهَا فَاغْفِرْ لَهَا. اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَافِيَةَ",
      remedyDescription:
          "This dua is a supplication seeking Allah's protection and forgiveness for the soul, as well as a request for good health. It is often recited by Muslims seeking well-being and protection.\nاے اللہ! تو نے میری جان کو پیدا کیا ہے اور تو ہی اس کو وفات دے گا، اس کا مرنا اور جینا تیری زیر انتظام ہے۔ اگر تو اس کو زندہ رکھے تو اس کی حفاظت فرما، اور اگر تو اسے فنا کر دے تو اس کی مغفرت فرما۔ اے اللہ! میں تجھ سے عافیت مانگتا ہوں۔",
    ),
  ];

  // Lifestyle change Remedies
  static List<RemediesModel> lifestyleChanges = [
    RemediesModel(
      imageUrl: AppStyles.setASchedule,
      remedyName: "Set a Schedule",
      remedyDescription:
          "Establishing a consistent sleep schedule helps regulate your body's internal clock, making it easier to fall asleep and wake up naturally.Choose a specific bedtime and wake-up time and stick to it, even on weekends, to maintain a steady sleep routine.Consistency is key for optimizing sleep quality and promoting overall well-being.\n اپنے نیند کا ایک مستقل شیڈول بنانا آپ کے جسم کے اندری نظام کو قابو میں رکھنے میں مدد فراہم کرتا ہے، جس سے سونا اور خودبخود جاگنا آسان ہو جاتا ہے۔کسی خاص سونے کا وقت اور اٹھنے کا وقت چنیں اور اس پر پابند رہیں، ہفتے کے دنوں میں بھی، تاکہ ایک مستقل نیند کا نظام قائم رہے۔استقامت نیند کی کوالٹی کو بہتر بنانے اور کلیہ کلیہ کی صحت بڑھانے کے لئے کلیدی ہے۔",
    ),
    RemediesModel(
        imageUrl: AppStyles.naturalLight,
        remedyName: "Spend Time in Natural Light",
        remedyDescription:
            "Exposure to natural light during the day helps regulate your body's circadian rhythm, or internal clock, promoting better sleep at night. Aim to spend time outdoors each day, especially in the morning, to absorb natural light. If outdoor time is limited, consider using a light therapy box, particularly in the morning, to simulate natural sunlight exposure and maintain healthy sleep-wake patterns.\nدن بھر میں طبی روشنی کا سامنا کرنا آپ کے جسم کی سرکیڈین رتم، یا اندرونی گھڑی، کو قابو میں رکھنے میں مدد فراہم کرتا ہے، جس سے رات کو بہتر نیند آتی ہے۔ روزانہ طبی روشنی کے لیے وقت مختص کریں، خاص طور پر صبح کو، تاکہ طبی روشنی کو جذب کیا جا سکے۔ اگر باہر جانے کا وقت محدود ہو تو، خصوصاً صبح کو، طبی روشنی کی نقلیت پیدا کرنے اور صحت مند نیند کے پیٹرن کو برقرار رکھنے کیلئے روشنی کی تھراپی باکس کا استعمال کرنے کا سوچیں۔"),
    RemediesModel(
        imageUrl: AppStyles.exercise,
        remedyName: "Exercise",
        remedyDescription:
            "Regular physical activity offers numerous benefits for sleep, including improved sleep quality and duration. Engage in moderate aerobic exercise, such as walking, cycling, or swimming, for at least 30 minutes most days of the week. Avoid vigorous exercise too close to bedtime, as it may stimulate your body and make it harder to fall asleep.\nورزش: باقاعدہ جسمانی مشقت نیند کیلئے مختلف فوائد فراہم کرتی ہے، جیسے کہ نیند کی معیار اور مدت میں بہتری۔ ہفتے کے اکثر دنوں میں کم از کم 30 منٹ کے لیے مناسب ایروبک ورزش، جیسے کہ چلنا، سائیکلنگ، یا تیرکی، میں شامل ہوں۔ رات کو قریب وقت میں شدید ورزش سے بچیں، کیونکہ یہ آپ کے جسم کو تحریک دینے کا سبب بن سکتی ہے اور سونے میں مشکلات پیدا ہوسکتی ہیں۔"),
    RemediesModel(
        imageUrl: AppStyles.stimulants,
        remedyName: "Avoid Stimulants",
        remedyDescription:
            "Caffeine and nicotine are stimulants that can interfere with sleep, so it's best to limit or avoid them, especially in the afternoon and evening. While alcohol may initially make you feel drowsy, it can disrupt sleep patterns and lead to poorer sleep quality later in the night. Opt for caffeine-free beverages and avoid nicotine-containing products in the hours leading up to bedtime.\nمحرکات سے بچیں: کیفین اور نکوٹین محرکات ہیں جو نیند میں مداخلت کرسکتے ہیں، اس لئے بہتر ہے کہ آپ ان کی محدودیت یا اجتناب کریں، خاص طور پر دوپہر اور شام میں۔ جبکہ الکوحل شروع میں آپ کو نیند آنے کا احساس دلاتا ہے، لیکن یہ نیند کے پیٹرن کو بگاڑ سکتا ہے اور رات کو بہتر نیند کی معیار میں کمی کا سبب بن سکتا ہے۔ رات کے وقت کافین سے پرہیز کریں اور نکوٹین والی مصنوعات سے دور رہیں۔"),
    RemediesModel(
        imageUrl: AppStyles.relaxation,
        remedyName: "Relaxation",
        remedyDescription:
            "Incorporate relaxation techniques into your evening routine to unwind and prepare your body and mind for sleep. Practice activities such as deep breathing, progressive muscle relaxation, or mindfulness meditation to reduce stress and promote relaxation. Create a calming bedtime routine that signals to your body that it's time to wind down, such as reading a book, taking a warm bath, or listening to soothing music.\nاپنی شام کی روٹین میں آرام کے تکنیکوں کو شامل کریں تاکہ آپ اپنے جسم اور دماغ کو نیند کیلئے تیار کر سکیں۔ دبوچی ہوئی سانس لینا، تدریجی مسلسل عضلات کو چھوڑنا، یا غورو فکر کی میڈیٹیشن جیسی سرگرمیاں کریں تاکہ دباؤ کو کم کریں اور آرام پیدا کریں۔ ایک آرام دہ بیڈ ٹائم روٹین بنائیں جو آپ کے جسم کو بتائے کہ اب وقت آیا ہے کہ اسے چھوڑ دیا جائے، جیسے کہ کتاب پڑھنا، گرم گرم غسل لینا، یا سکون بخش موسیقی سننا۔"),
    RemediesModel(
        imageUrl: AppStyles.bedroomTemperature,
        remedyName: "Regulate Bedroom Temperature",
        remedyDescription:
            "Maintaining a comfortable bedroom temperature is essential for promoting restful sleep.for a cooler bedroom environment, typically between 60-67 degrees Fahrenheit, to support your body's natural temperature regulation during sleep. Avoid extreme temperature fluctuations, as both overly warm and cold environments can disrupt sleep quality and make it harder to fall and stay asleep.\nکمرہ کی درجہ حرارت کا نظم: آرام دہ نیند کیلئے مرضی کی درجہ حرارت کا کمرہ محافظتی اہم ہے۔ عام طور پر 60-67 فارن ہائیٹ کے درمیان ایک آرام دہ کمرہ کا ماحول بنائیں، تاکہ نیند کے دوران آپ کے جسم کے طبیعی درجہ حرارت کی ریاست کی حمایت کی جا سکے۔ انتہائی گرمی یا سردی کے ماحول سے بچیں، کیونکہ دونوں انتہائی گرم یا سرد ماحول نیند کی معیار میں خلل پیدا کرسکتے ہیں اور نیند کو لینے اور رہنے میں مشکل پیدا کرسکتے ہیں۔"),
  ];
}
