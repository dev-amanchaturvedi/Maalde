/// Task 3: List Reordering Based on Pivot Value

void main() {
  List<int> input = [3, 2, 4, 6, 1, 7, 8, 5, 9];
  int pivot = 6;

  List<int> result = reorderList(input, pivot);

  print("Input: $input");
  print("Pivot: $pivot");
  print("\nReordered List: $result");
}

List<int> reorderList(List<int> input, int pivot) {
  int pivotIndex = -1;
  for (int i = 0; i < input.length; i++) {
    if (input[i] == pivot) {
      pivotIndex = i;
      break;
    }
  }

  if (pivotIndex == -1) {
    return input;
  }

  List<int> beforePivot = [];
  List<int> afterPivot = [];

  for (int i = 0; i < pivotIndex; i++) {
    beforePivot.add(input[i]);
  }

  for (int i = pivotIndex + 1; i < input.length; i++) {
    afterPivot.add(input[i]);
  }

  List<int> reorderedList = [];

  int startIndex = afterPivot.length >= 3 ? afterPivot.length - 3 : 0;
  for (int i = startIndex; i < afterPivot.length; i++) {
    reorderedList.add(afterPivot[i]);
  }

  for (int i = 0; i < beforePivot.length; i++) {
    reorderedList.add(beforePivot[i]);
  }

  reorderedList.add(pivot);

  for (int i = 0; i < startIndex; i++) {
    reorderedList.add(afterPivot[i]);
  }

  return reorderedList;
}
