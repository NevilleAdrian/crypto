class CollectionMutations {
  // TODO: UPDATE THE MUTATION STRING FOR LATEST COLLECTION HERE
  static const String latest = """
  mutation LatestCollections(
  \$emailAddress: String!
  \$fullName: String!
  \$password: String!
  \$phoneNumber: String!
) {
  register(
   registerInput: {
      emailAddress: \$emailAddress
      fullName: \$fullName
      password: \$password
      phoneNumber: \$phoneNumber
  } 
  ) {
      id
      message
  }
}
  """;

  // TODO: UPDATE THE MUTATION STRING FOR TRENDING COLLECTION HERE
  static const String trending = """
  mutation LatestCollections(
  \$emailAddress: String!
  \$fullName: String!
  \$password: String!
  \$phoneNumber: String!
) {
  register(
   registerInput: {
      emailAddress: \$emailAddress
      fullName: \$fullName
      password: \$password
      phoneNumber: \$phoneNumber
  } 
  ) {
      id
      message
  }
}
  """;

  // TODO: UPDATE THE MUTATION STRING FOR TOP VERIFIED COLLECTION HERE
  static const String topVerified = """
  mutation LatestCollections(
  \$emailAddress: String!
  \$fullName: String!
  \$password: String!
  \$phoneNumber: String!
) {
  register(
   registerInput: {
      emailAddress: \$emailAddress
      fullName: \$fullName
      password: \$password
      phoneNumber: \$phoneNumber
  } 
  ) {
      id
      message
  }
}
  """;
}
