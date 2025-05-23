import React from 'react';
import { RouterProvider, ReduxProvider } from './providers';

const App: React.FC = () => {
  return (
    <ReduxProvider>
      <RouterProvider />
    </ReduxProvider>
  );
};

export default App; 