import React, { useEffect, useState } from 'react';
import { useParams } from 'react-router-dom';

const MasterDetail = () => {
  const { id } = useParams();
  const [master, setMaster] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    fetch(`http://localhost:3000/api/masters/${id}`)
      .then(res => {
        if (!res.ok) throw new Error('Master not found');
        return res.json();
      })
      .then(setMaster)
      .catch((err) => {
        console.error('Fetch error:', err);
        setError(err.message);
      });
  }, [id]);

  if (error) return <div>Error loading master: {error}</div>;
  if (!master) return <div>Loading...</div>;

  return (
    <div>
      <h1>{master.title}</h1>
      <p><strong>Year:</strong> {master.year}</p>
      <p><strong>Main Release:</strong> {master.main_release}</p>
      <p><strong>Data Quality:</strong> {master.data_quality}</p>

      <h3>Artists</h3>
      <ul>
        {master.master_artists.map(artist => (
          <li key={artist.id}>
            {artist.anv || artist.artists?.name}
            {artist.join_phrase && ` ${artist.join_phrase}`}
          </li>
        ))}
      </ul>

      <h3>Genres</h3>
      <ul>
        {master.master_genres.map(genre => (
          <li key={genre.id}>{genre.genre}</li>
        ))}
      </ul>

      <h3>Styles</h3>
      <ul>
        {master.master_styles.map(style => (
          <li key={style.id}>{style.style}</li>
        ))}
      </ul>

      <h3>Videos</h3>
      <ul>
        {master.master_videos.map(video => (
          <li key={video.id}>
            <strong>{video.title}</strong>
            <p>{video.description}</p>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default MasterDetail;
