class Product {
  String productId;
  String productName;
  String productDescription;
  double price;
  double numberOfUsersRated;
  double rating;
  // TODO: Convert imageUrl to a list of Image URL.
  String imageUrl;
  bool isFavourite;
  String category;
  String productDetailedDescription;

  Product(
      {this.productId,
      this.productName,
      this.productDescription,
      this.imageUrl,
      this.price,
      this.isFavourite = false,
      this.rating,
      this.numberOfUsersRated,
      this.category,
      this.productDetailedDescription});
}
