enum Env {
  dev(
    'https://lite.clublab.bitango.co.il/',
  ),
  prod(
    'https://lite.clublab.bitango.co.il/',
  );

  const Env(
    this.baseUrl,
  );

  final String baseUrl;
}
