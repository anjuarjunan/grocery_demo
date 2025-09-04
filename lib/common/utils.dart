const Map<String, String> categoryEmojis = {
  'Dairy': '🧀',
  'Vegetables': '🥦',
  'Fruits': '🍌',
  'Bakery': '🍞',
  'Meat': '🍗',
  'Pantry': '🧂',
};

String getEmoji(String category) {
  return categoryEmojis[category] ?? '🛒';
}
