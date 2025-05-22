import React, { useEffect } from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { selectCurrentUser } from '@/app/store';

interface RequireAuthProps {
  children: React.ReactNode;
}

export const RequireAuth: React.FC<RequireAuthProps> = ({ children }) => {
  const user = useSelector(selectCurrentUser);
  const location = useLocation();

  // 디버깅을 위한 로깅 추가
  useEffect(() => {
    console.log('RequireAuth - 현재 상태:');
    console.log('- user:', user);
    console.log('- location:', location);
    console.log('- pathname:', location.pathname);
  }, [user, location]);

  if (!user) {
    // 사용자가 로그인하지 않았으면 현재 경로의 로그인 페이지로 리다이렉트
    const basePath = location.pathname.split('/')[1] || '';
    const loginPath = basePath ? `/${basePath}/login` : '/login';
    
    console.log('RequireAuth - 리다이렉트 정보:');
    console.log('- basePath:', basePath);
    console.log('- loginPath:', loginPath);
    console.log('- 최종 리다이렉트 경로:', loginPath);
    
    return <Navigate to={loginPath} state={{ from: location }} replace />;
  }

  return <>{children}</>;
}; 