import React from 'react';
import { RouterProvider, ReduxProvider } from './providers';
import { useAuthCheck } from '../hook/auth';

const App: React.FC = () => {
  // 앱 시작 시 인증 상태 확인
  useAuthCheck();
  
  return (
    <ReduxProvider>
      <RouterProvider />
    </ReduxProvider>
  );
};

export default App; 