import React from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { CustomToaster } from '@shared/ui/toaster';

import { HomeLayout, ALayout, BLayout } from '@widgets/layouts';
import * as Home from '@pages/home';
import * as A from '@pages/a';
import * as B from '@pages/b';

export const RouterProvider: React.FC = () => {
  return (
    <BrowserRouter>
      {/* 전역 토스터 배치 */}
      <CustomToaster />
      
      <Routes>
        {/* 홈 레이아웃 라우트 */}
        <Route path="/" element={<HomeLayout />}>
          <Route index element={<Home.MainPage />} />
          <Route path="*" element={<Home.NotFoundPage />} />
        </Route>

        {/* A 레이아웃 라우트 */}
        <Route path="/a" element={<ALayout />}>
          <Route index element={<A.MainPage />} />
          <Route path="*" element={<A.NotFoundPage />} />
        </Route>


        {/* B 레이아웃 라우트 */}
        <Route path="/b" element={<BLayout />}>
          <Route index element={<B.MainPage />} />
          <Route path="*" element={<B.NotFoundPage />} />
        </Route>

        {/* 404 리다이렉트 */}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </BrowserRouter>
  );
}; 