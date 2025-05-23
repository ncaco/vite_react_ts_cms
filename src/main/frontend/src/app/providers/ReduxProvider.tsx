import React, { ReactNode } from 'react';
import { Provider } from 'react-redux';
import { store } from '../store';
import { useAuthCheck } from '@/hook/auth';

interface ReduxProviderProps {
  children: ReactNode;
}

export const ReduxProvider: React.FC<ReduxProviderProps> = ({ children }) => {
  // 앱 시작 시 인증 상태 확인
  useAuthCheck();

  return <Provider store={store}>{children}</Provider>;
}; 