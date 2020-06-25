class CarouselModel {
  String image;

  CarouselModel(this.image);
}

List<CarouselModel> carousels =
carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {"image": "https://i.ytimg.com/vi/3BVQ9Scdglg/maxresdefault.jpg"},
  {"image": "https://www.redcross.org/content/dam/redcross/about-us/news/2020/positivity2tw.jpg.transform/1288/q70/feature/image.jpeg"},
  {"image": "https://www.un.org/sustainabledevelopment/wp-content/uploads/2020/03/SG-quote.jpeg"},
  {"image": "https://i.ytimg.com/vi/EMBFnHbl1as/maxresdefault.jpg"},
];