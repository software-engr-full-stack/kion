import React from 'react';

import './App.css';

function App() {
  const [customers, setCustomers] = React.useState([]);

  React.useEffect(() => {
    fetch('/api/v1/customers/all-with-children').then((json) => json.json()).then((resp) => {
      setCustomers(resp);
    });
  }, []);

  if (customers.length < 1) {
    return null;
  }

  console.log(customers);

  return (
    <div className="app">
      Hello, Kion
    </div>
  );
}

export default App;
