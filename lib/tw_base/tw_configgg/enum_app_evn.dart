
enum TwConfiggEnv {
  dev(name: "dev"),
  prod(name: "prod");

  const TwConfiggEnv({required this.name});

  final String name;
}
