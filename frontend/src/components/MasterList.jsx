import { useEffect, useState } from 'react';
import { Link } from 'react-router-dom';

function MasterList() {
  const [masters, setMasters] = useState([]);
  const [page, setPage] = useState(1);
  const mastersPerPage = 10;

  useEffect(() => {
    const fetchMasters = async () => {
      const results = [];
      const startId = (page - 1) * mastersPerPage + 1;
      const endId = page * mastersPerPage;

      const fetches = [];
      for (let id = startId; id <= endId; id++) {
        fetches.push(
          fetch(`http://localhost:3000/api/masters/${id}`)
            .then(res => (res.ok ? res.json() : null))
            .then(master => ({ id, master }))
            .catch(() => ({ id, master: null }))
        );
      }

      const resolved = await Promise.all(fetches);
      setMasters(resolved);
    };

    fetchMasters();
  }, [page]);

  const handleNext = () => setPage(prev => prev + 1);
  const handlePrev = () => setPage(prev => Math.max(prev - 1, 1));

  return (
    <div>
      <h1>Masters (Page {page})</h1>
      <ul>
        {masters.map(({ id, master }) => (
          <li key={id}>
            {master ? (
              <Link to={`/masters/${id}`}>{master.title} ({master.year || 'n.d.'})</Link>
            ) : (
              <span style={{ color: 'gray' }}>Master {id} not found</span>
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

export default MasterList;
