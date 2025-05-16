import React from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { CustomToaster } from '@shared/ui/toaster';

import { HomeLayout, ALayout, BLayout } from '@widgets/layouts';
import * as Home from '@pages/home';
import * as A from '@pages/a';
import * as B from '@pages/b';

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
            <Route index element={main} />
            <Route path="login" element={login} />
            <Route path="*" element={notFound} />
          </Route>
        ))}

        {/* 404 리다이렉트 */}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </BrowserRouter>
  );
}; 