import { useDispatch, useSelector } from 'react-redux';
import type { TypedUseSelectorHook } from 'react-redux';
import type { RootState, AppDispatch } from './store';

// 타입이 지정된 커스텀 훅 생성
export const useAppDispatch = () => useDispatch<AppDispatch>();
export const useAppSelector: TypedUseSelectorHook<RootState> = useSelector;

// 세션 훅 생성
export const useSession = () => {
  const { user, isAuthenticated, loading, error } = useAppSelector((state) => state.session);
  const dispatch = useAppDispatch();

  return {
    user,
    isAuthenticated,
    loading,
    error,
    dispatch,
  };
}; 