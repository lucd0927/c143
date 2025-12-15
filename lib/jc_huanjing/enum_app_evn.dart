
enum SSConfiggEnv {
  dev(name: "dev"),
  prod(name: "prod");

  const SSConfiggEnv({required this.name});

  final String name;
}
