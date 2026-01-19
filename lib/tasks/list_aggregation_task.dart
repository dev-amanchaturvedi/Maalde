/// Task 2: List Aggregation Logic

void main() {
  List<String> input = [
    "P", "P", "P", "P", "WE", "WE", "N", "N", "N", "N", "N", "S", "S", "P", "P", "Z"
  ];

  Map<String, int> result = aggregateListCounts(input);

  print("Input: $input");
  print("\nCharacter counts:");
  result.forEach((key, value) {
    print("$key -> $value");
  });
}

Map<String, int> aggregateListCounts(List<String> inputList) {
  Map<String, int> charCount = {};

  for (int i = 0; i < inputList.length; i++) {
    String currentValue = inputList[i];
    
    if (charCount.containsKey(currentValue)) {
      charCount[currentValue] = charCount[currentValue]! + 1;
    } else {
      charCount[currentValue] = 1;
    }
  }

  Map<String, int> filteredCharCount = {};
  charCount.forEach((key, value) {
    if (value > 1) {
      filteredCharCount[key] = value;
    }
  });

  return filteredCharCount;
}

