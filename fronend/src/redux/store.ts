import { configureStore, combineReducers } from '@reduxjs/toolkit';
import { persistStore, persistReducer } from 'redux-persist';
import storage from 'redux-persist/lib/storage';

// 슬라이스 리듀서 가져오기
import sessionReducer from './slices/sessionSlice';

// 루트 리듀서 구성
const rootReducer = combineReducers({
  session: sessionReducer,
  // 다른 리듀서들 추가 가능
});

// 리덕스 persist 설정
const persistConfig = {
  key: 'root',
  storage,
  whitelist: ['session'], // 세션만 저장소에 유지
};

// 리듀서를 persist 설정으로 감싸기
const persistedReducer = persistReducer(persistConfig, rootReducer);

// 스토어 설정
export const store = configureStore({
  reducer: persistedReducer,
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: {
        ignoredActions: ['persist/PERSIST', 'persist/REHYDRATE', 'persist/REGISTER'], // persist 액션 무시
      },
    }),
});

// persistor 생성
export const persistor = persistStore(store);

// RootState 및 AppDispatch 타입 익스포트
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch; 