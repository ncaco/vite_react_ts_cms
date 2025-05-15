import React from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { CustomToaster } from '@shared/ui/toaster';
import { Index } from '@pages/index';

export const RouterProvider: React.FC = () => {
  return (
    <BrowserRouter>
      {/* 전역 토스터 배치 */}
      <CustomToaster />
      
      <Routes>
        {/* 홈 레이아웃 라우트 */}
        <Route path="/" element={<Index />} />

        {/* 404 리다이렉트 */}
        <Route path="*" element={<Navigate to="/" replace />} />
      </Routes>
    </BrowserRouter>
  );
}; 