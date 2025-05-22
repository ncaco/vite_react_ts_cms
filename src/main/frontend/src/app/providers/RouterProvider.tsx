import React, { useEffect } from 'react';
import { BrowserRouter, Routes, Route, Navigate, useLocation } from 'react-router-dom';
import { CustomToaster } from '@shared/ui/toaster';
import { useSelector } from 'react-redux';
import { selectCurrentUser } from '../store';

import { HomeLayout, ALayout, BLayout } from '@widgets/layouts';
import * as Home from '@pages/home';
import * as A from '@pages/a';
import * as B from '@pages/b';
import { RequireAuth } from '@shared/components/RequireAuth';
import { RedirectIfLoggedIn } from '@shared/components/RedirectIfLoggedIn';

// 라우트 로깅 컴포넌트
const RouteLogger = () => {
  const location = useLocation();
  const user = useSelector(selectCurrentUser);

  useEffect(() => {
    console.log('RouterProvider - 라우트 변경:');
    console.log('- pathname:', location.pathname);
    console.log('- user:', user);
    console.log('- state:', location.state);
  }, [location, user]);

  return null;
};

const routeConfigs = [
  {
    path: '/',
    layout: <HomeLayout />,
    main: <Home.Main />,
    login: <Home.Login />,
    notFound: <Home.NotFoundPage />,
  },
  {
    path: '/a',
    layout: <ALayout />,
    main: <A.Main />,
    login: <A.Login />,
    notFound: <A.NotFoundPage />,
  },
  {
    path: '/b',
    layout: <BLayout />,
    main: <B.Main />,
    login: <B.Login />,
    notFound: <B.NotFoundPage />,
  },
];

export const RouterProvider: React.FC = () => {
  return (
    <BrowserRouter>
      {/* 전역 토스터 배치 */}
      <CustomToaster />
      
      <Routes>
        {routeConfigs.map(({ path, layout, main, login, notFound }) => (
          <Route key={path} path={path} element={layout}>
            {/* 라우트 로거 추가 */}
            <Route path="" element={<RouteLogger />} />
            
            <Route
              index
              element={
                <RequireAuth>
                  {main}
                </RequireAuth>
              }
            />
            <Route
              path="login"
              element={
                <RedirectIfLoggedIn>
                  {login}
                </RedirectIfLoggedIn>
              }
            />
            <Route path="*" element={notFound} />
          </Route>
        ))}

        {/* 404 리다이렉트 */}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </BrowserRouter>
  );
}; 