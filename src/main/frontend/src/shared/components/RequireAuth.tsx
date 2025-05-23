import React from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { selectCurrentUser } from '@/app/store';

interface RequireAuthProps {
  children: React.ReactNode;
}

export const RequireAuth: React.FC<RequireAuthProps> = ({ children }) => {
  const user = useSelector(selectCurrentUser);
  const location = useLocation();

  console.log('RequireAuth - 현재 상태:', user);
  if (!user) {
    console.log('RequireAuth - 사용자가 로그인하지 않았습니다.');
    // 사용자가 로그인하지 않았으면 현재 경로의 로그인 페이지로 리다이렉트
    const basePath = location.pathname.split('/')[1] || '';
    const loginPath = basePath ? `/${basePath}/login` : '/login';

    return <Navigate to={loginPath} state={{ from: location }} replace />;
  }

  return <>{children}</>;
}; 