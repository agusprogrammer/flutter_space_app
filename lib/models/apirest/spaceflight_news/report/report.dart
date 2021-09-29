
class Report {

  final int id;
  final String title;
  final String url;
  final String imageUrl;
  final String newsSite;
  final String summary;
  final String publishedAt;

  const Report(
    {
      required this.id,
      required this.title,
      required this.url,
      required this.imageUrl,
      required this.newsSite,
      required this.summary,
      required this.publishedAt
    }
  );

  factory Report.fromJson(Map<String,dynamic> item){

    return Report(
      id: item['id'] as int,
      title: item['title'] as String,
      url: item['url'] as String,
      imageUrl: item['imageUrl'] as String,
      newsSite: item['newsSite'] as String,
      summary: item['summary'] as String,
      publishedAt: item['publishedAt'] as String
    ); 

  }

}