class UserPreferences {
  static String selectedName = '';
  static String selectedAgeGroup = 'Age 7-8';

  static int animalCount = 0;
  static int lettersCount = 0;
  static int storiesCount = 0;
  static int numbersCount = 0;

  static void incrementAnimal() => animalCount++;
  static void incrementLetters() => lettersCount++;
  static void incrementStories() => storiesCount++;
  static void incrementNumbers() => numbersCount++;

  static int getAnimalCount() => animalCount;
  static int getLettersCount() => lettersCount;
  static int getStoriesCount() => storiesCount;
  static int getNumbersCount() => numbersCount;
}
