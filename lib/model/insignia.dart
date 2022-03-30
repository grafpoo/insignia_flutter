class Insignia {
  String branch; // Army, Navy, ...
  String eoLevel; // grade (1-11, typically)
  String rank; // name of tank
  String type; // type of insignia (C[ollar], S[houlderboard])
  String imageResource;

  Insignia._();

  Insignia(this.branch, this.eoLevel, this.rank, this.type, this.imageResource);

  Insignia.namedParameters({this.branch, this.eoLevel, this.rank, this.type, this.imageResource});

  Insignia copyWith({
    String branch, String eo, String level, String rank, String type, String imageResource
  }) => Insignia.namedParameters(
      branch: branch ?? this.branch,
      eoLevel: eoLevel ?? this.eoLevel,
      rank: rank ?? this.rank,
      type: type ?? this.type,
      imageResource: imageResource ?? this.imageResource,
  );

  bool imageEquals(Insignia other) => imageResource == other.imageResource;
}

