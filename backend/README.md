Placeholder for backend information (TODO: Write specs, how-to for backend)

### Music Data Source

The Soundscores backend utilizes the [Discogs API](https://www.discogs.com/developers) to fetch music metadata including artists, albums, and track listings. This allows us to dynamically seed our database and ensure accurate, up-to-date music information with minimal setup during early development.

As the project scales, we intend to transition to using the official [Discogs data dumps](https://discogs-data-dumps.s3.us-west-2.amazonaws.com/index.html?prefix=data/2025/) to build and serve our own internal API. This approach will give us full control over our data, avoid API rate limits, and allow for advanced querying and indexing tailored to our platform's needs.
