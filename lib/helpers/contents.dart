

class Content{
  String image;
  String description;

  Content({required this.image, required this.description,});
}

List<Content> contents = [
  Content(
    image: 'assets/images/1.png',
    description: 'Stay updated with your favorite sport reports and notifications',
  ),
  Content(
    image:'assets/images/2.png',
    description: 'Discover and connect all over the world with your favorite sports fanbase',
  ),
];