import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Home from './components/Home';
import ArtistList from './components/ArtistList';
import MasterList from './components/MasterList';
import ArtistDetail from './components/ArtistDetail';
import MasterDetail from './components/MasterDetail';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/artists" element={<ArtistList />} />
        <Route path="/artists/:id" element={<ArtistDetail />} />
        <Route path="/masters" element={<MasterList />} />
        <Route path="/masters/:id" element={<MasterDetail />} />
      </Routes>
    </Router>
  );
}

export default App;
