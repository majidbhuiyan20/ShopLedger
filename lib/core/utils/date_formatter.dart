class DateFormatter {
  static String toBanglaDate(DateTime date) {
    // Weekdays in Bangla
    final List<String> weekdays = [
      'সোমবার', 'মঙ্গলবার', 'বুধবার', 'বৃহস্পতিবার', 'শুক্রবার', 'শনিবার', 'রবিবার'
    ];

    // Months in Bangla
    final List<String> months = [
      'জানুয়ারি', 'ফেব্রুয়ারি', 'মার্চ', 'এপ্রিল', 'মে', 'জুন',
      'জুলাই', 'আগস্ট', 'সেপ্টেম্বর', 'অক্টোবর', 'নভেম্বর', 'ডিসেম্বর'
    ];

    // Convert numbers to Bangla
    String toBanglaNumber(String input) {
      const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      const bangla = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];
      for (int i = 0; i < english.length; i++) {
        input = input.replaceAll(english[i], bangla[i]);
      }
      return input;
    }

    String dayName = weekdays[date.weekday - 1];
    String day = toBanglaNumber(date.day.toString());
    String monthName = months[date.month - 1];
    String year = toBanglaNumber(date.year.toString());

    return "$dayName, $day $monthName $year";
  }
}
