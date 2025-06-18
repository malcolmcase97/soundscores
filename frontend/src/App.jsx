import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import ArtistList from './components/ArtistList';
import ArtistDetail from './components/ArtistDetail';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<ArtistList />} />
        <Route path="/artists/:id" element={<ArtistDetail />} />
      </Routes>
    </Router>
  );
}

export default App;
