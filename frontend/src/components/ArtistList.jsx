// frontend/src/components/ArtistList.jsx
import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

function ArtistList() {
  const [artists, setArtists] = useState([]);

  useEffect(() => {
    const fetchArtists = async () => {
      const results = [];

      for (let id = 1; id <= 10; id++) {
        try {
          const res = await fetch(`http://localhost:3000/api/artists/${id}`);
          if (res.ok) {
            const artist = await res.json();
            results.push({ id, name: artist.name });
          }
        } catch (err) {
          console.error(`Failed to fetch artist ${id}:`, err);
        }
      }

      setArtists(results);
    };

    fetchArtists();
  }, []);

  return (
    <div>
      <h1>Artists</h1>
      <ul>
        {artists.map((artist) => (
          <li key={artist.id}>
            <Link to={`/artists/${artist.id}`}>{artist.name}</Link>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default ArtistList;
