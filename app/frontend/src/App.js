import React, { useEffect, useState } from 'react';

const API = process.env.REACT_APP_API_URL || '';

function App() {
  const [items, setItems] = useState([]);
  const [name, setName] = useState('');

  useEffect(() => {
    fetch(`${API}/api/items`)
      .then(r => r.json())
      .then(setItems)
      .catch(console.error);
  }, []);

  const addItem = async (e) => {
    e.preventDefault();
    const res = await fetch(`${API}/api/items`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ name })
    });
    const item = await res.json();
    setItems([...items, item]);
    setName('');
  };

  return (
    <div style={{ maxWidth: 600, margin: '40px auto', fontFamily: 'sans-serif' }}>
      <h1>MERN App</h1>
      <form onSubmit={addItem} style={{ marginBottom: 20 }}>
        <input
          value={name}
          onChange={e => setName(e.target.value)}
          placeholder="Enter item name"
          style={{ padding: 8, marginRight: 8, width: 300 }}
        />
        <button type="submit" style={{ padding: 8 }}>Add</button>
      </form>
      <ul>
        {items.map(item => (
          <li key={item._id}>{item.name}</li>
        ))}
      </ul>
    </div>
  );
}

export default App;
