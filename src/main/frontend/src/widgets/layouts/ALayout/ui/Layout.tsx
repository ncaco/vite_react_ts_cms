import React from 'react';
import { Outlet } from 'react-router-dom';

export const Layout: React.FC = () => {
  console.log('-----ALayout Rendered-----');

  return (
    <>
      <Outlet />
    </>
  );
}; 