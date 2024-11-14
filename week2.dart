
void main() {
  // List of item prices in the cart
  List<double> prices = [15.99, 7.49, 22.30, 5.99, 18.75];

  // Calculate the total price of the cart
  double totalPrice = calculateTotal(prices, tax: 0.08); // 8% tax
  print('Total Price (with tax): \$${totalPrice.toStringAsFixed(2)}');

  // Use an anonymous function to filter out items with a price below $10
  var filteredPrices = prices.where((price) => price >= 10).toList();
  print('Filtered Prices (above \$10): \$${filteredPrices.join(", \$")}');

  // Higher-order function: Apply discount of 10% to all items
  var discountFunction = (double price) => price * 0.9; // 10% discount
  var discountedPrices = applyDiscount(prices, discountFunction);
  print('Discounted Prices: \$${discountedPrices.join(", \$")}');

  // Recursive function to calculate the special discount based on the factorial
  int numberOfItems = prices.length;
  double factorialDiscount = calculateFactorialDiscount(numberOfItems);
  print('Special Factorial Discount: $factorialDiscount%');

  // Apply the factorial discount to the total price
  double finalPrice = totalPrice - (totalPrice * (factorialDiscount / 100));
  print('Final Price after Special Discount: \$${finalPrice.toStringAsFixed(2)}');
}

// Standard function to calculate the total price of the cart
double calculateTotal(List<double> prices, {double tax = 0}) {
  double sum = prices.fold(0, (total, price) => total + price);
  return sum + (sum * tax); // Add tax if specified
}

// Higher-order function to apply a discount to each price in the list
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function to calculate factorial discount
double calculateFactorialDiscount(int n) {
  if (n == 1) {
    return 1; // Base case: 1! = 1
  } else {
    return n * calculateFactorialDiscount(n - 1); // Recursive case
  }
}
