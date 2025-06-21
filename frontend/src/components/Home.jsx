import { Link } from 'react-router-dom';

function Home() {
  return (
    <div style={{ padding: '2rem' }}>
      <h1>Welcome to the Music Database</h1>
      <p>Choose a category to browse:</p>
      <ul>
        <li>
          <Link to="/artists">Browse Artists</Link>
        </li>
        <li>
          <Link to="/masters">Browse Masters</Link>
        </li>
      </ul>
    </div>
  );
}

export default Home;
