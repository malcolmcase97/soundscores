import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

const ArtistDetail = () => {
  const { id } = useParams(); // <-- get artist ID from the URL
  const [artist, setArtist] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch(`http://localhost:3000/api/artists/${id}`)
      .then(res => {
        if (!res.ok) throw new Error('Artist not found');
        return res.json();
      })
      .then(setArtist)
      .catch((err) => {
        console.error('Fetch error:', err);
        setError(err.message);
      });
  }, [id]);

  if (error) return <div>Error loading artist: {error}</div>;
  if (!artist) return <div>Loading...</div>;

  return (
    <div>
      <h1>{artist.name}</h1>
      <p><strong>Real Name:</strong> {artist.real_name}</p>
      <p><strong>Profile:</strong> {artist.profile}</p>

      <h3>Aliases</h3>
      <ul>
        {artist.artist_aliases.map(alias => (
          <li key={alias.id}>{alias.alias_name}</li>
        ))}
      </ul>

      <h3>Name Variations</h3>
      <ul>
        {artist.artist_name_variations.map(varn => (
          <li key={varn.id}>{varn.variation}</li>
        ))}
      </ul>

      <h3>Groups</h3>
      <ul>
        {artist.artist_groups.map(group => (
          <li key={group.id}>{group.group_name}</li>
        ))}
      </ul>

      <h3>Links</h3>
      <ul>
        {artist.artist_urls.map(link => (
          <li key={link.id}>
            <a href={link.url} target="_blank" rel="noreferrer">{link.url}</a>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ArtistDetail;
