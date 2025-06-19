import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

function ArtistList() {
  const [artists, setArtists] = useState([]);
  const [page, setPage] = useState(1);
  const artistsPerPage = 10;

  useEffect(() => {
    const fetchArtists = async () => {
      const results = [];
      const startId = (page - 1) * artistsPerPage + 1;
      const endId = page * artistsPerPage;

      const fetches = [];
      for (let id = startId; id <= endId; id++) {
        fetches.push(
          fetch(`http://localhost:3000/api/artists/${id}`)
            .then(res => (res.ok ? res.json() : null))
            .then(artist => ({ id, artist }))
            .catch(() => ({ id, artist: null }))
        );
      }

      const resolved = await Promise.all(fetches);
      setArtists(resolved);
    };

    fetchArtists();
  }, [page]);

  const handleNext = () => setPage(prev => prev + 1);
  const handlePrev = () => setPage(prev => Math.max(prev - 1, 1));

  return (
    <div>
      <h1>Artists (Page {page})</h1>
      <ul>
        {artists.map(({ id, artist }) => (
          <li key={id}>
            {artist ? (
              <Link to={`/artists/${id}`}>{artist.name}</Link>
            ) : (
              <span style={{ color: 'gray' }}>Artist {id} not found</span>
            )}
          </li>
        ))}
      </ul>

      <div style={{ marginTop: '1rem' }}>
        <button
          onClick={handlePrev}
          disabled={page === 1}
          style={{
            marginRight: '0.5rem',
            opacity: page === 1 ? 0.5 : 1,
            cursor: page === 1 ? 'not-allowed' : 'pointer'
          }}
        >
          Previous
        </button>
        <button onClick={handleNext}>Next</button>
      </div>
    </div>
  );
}

export default ArtistList;
