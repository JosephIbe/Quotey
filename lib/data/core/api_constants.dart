class APIConstants {

  // private constructor to stop init from other classes
  APIConstants._();
  
  static const String API_BASE_URL = 'https://api.quotable.io';

  static const String UNSPLASH_API_ACCESS_KEY = 'UUPn9PHA4ezxV0yMDoSAHvvapXNQqAF3VhGzMKvXUzg';
  static const String UNSPLASH_API_SECRET_KEY = 'squf6W0XVr1_kbc2eIDJQKXBenmZYmae1D1EgxgNoeU';

  static const String GET_RANDOM_BACKGROUND_IMAGE_FROM_UNSPLASH_API =
      'https://api.unsplash.com/photos/random?client_id=$UNSPLASH_API_ACCESS_KEY';

  static const String PLACEHOLDER_IMAGE = 'https://images.unsplash.com/photo-1635132591146-696196370bdf?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';

}