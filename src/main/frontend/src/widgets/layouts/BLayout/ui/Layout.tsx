import React from 'react';
import { Outlet } from 'react-router-dom';

export const Layout: React.FC = () => {
  console.log('-----B Layout Rendered-----');

  return (
    <>
      <Outlet />
    </>
  );
}; 