
class SpaceStation{
  
  final int id;
  final String url;
  final String name;
  final int idStatus;
  final String status;
  final int idType;
  final String type;
  final String founded;
  final String deorbited;
  final String description;
  final String orbit;
  final String imageUrl;

  final String nextResults;
  final String previousResults;

  const SpaceStation( 
    {
      required this.id,
      required this.url,
      required this.name,
      required this.idStatus,
      required this.status,
      required this.idType,
      required this.type,
      required this.founded,
      required this.deorbited,
      required this.description,
      required this.orbit,
      required this.imageUrl,
      required this.nextResults,
      required this.previousResults
    }
  );
  
}
