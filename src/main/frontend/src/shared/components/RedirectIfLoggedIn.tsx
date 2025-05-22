import React, { useEffect } from 'react';
import { Navigate, useLocation } from 'react-router-dom';
import { useSelector } from 'react-redux';
import { selectCurrentUser } from '@/app/store';

interface RedirectIfLoggedInProps {
  children: React.ReactNode;
}

export const RedirectIfLoggedIn: React.FC<RedirectIfLoggedInProps> = ({ children }) => {
  const user = useSelector(selectCurrentUser);
  const location = useLocation();
  
  // 디버깅을 위한 로깅 추가
  useEffect(() => {
    console.log('RedirectIfLoggedIn - 현재 상태:');
    console.log('- user:', user);
    console.log('- location:', location);
    console.log('- location.state:', location.state);
    console.log('- pathname:', location.pathname);
  }, [user, location]);
  
  if (user) {
    // 사용자가 이미 로그인 했으면 현재 경로의 인덱스 페이지로 리다이렉트
    const basePath = location.pathname.split('/')[1] || '';
    const mainPath = basePath ? `/${basePath}` : '/';
    
    // 이전 페이지가 있으면 그 페이지로, 없으면 메인 페이지로
    const from = location.state?.from?.pathname || mainPath;
    
    console.log('RedirectIfLoggedIn - 리다이렉트 정보:');
    console.log('- basePath:', basePath);
    console.log('- mainPath:', mainPath);
    console.log('- from:', from);
    console.log('- 최종 리다이렉트 경로:', from);
    
    return <Navigate to={from} replace />;
  }

  return <>{children}</>;
}; 