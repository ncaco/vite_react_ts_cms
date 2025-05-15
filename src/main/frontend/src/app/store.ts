import { configureStore } from '@reduxjs/toolkit';

// Redux 스토어 설정
export const store = configureStore({
  reducer: {
  },
  middleware: (getDefaultMiddleware) => 
    getDefaultMiddleware({
      serializableCheck: false, // 직렬화 검사 비활성화 (필요한 경우)
    }),
  devTools: process.env.NODE_ENV !== 'production',
});

// 타입 정의
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch; 