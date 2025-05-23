import { useEffect } from 'react';
import { useDispatch } from 'react-redux';
import { setUser, logout } from '@/app/store';
import apiInstance from '@/shared/api';

interface UserSession {
  userId: string;
  userNm: string;
  authrtCd: string;
  loginDt: string;
  lastAccessDt?: string;
}

/**
 * 앱 시작 시 세션 상태를 확인하는 훅
 * 세션이 유효하면 Redux 스토어에 사용자 정보를 설정
 */
export function useAuthCheck() {
  const dispatch = useDispatch();

  useEffect(() => {
    const checkAuthStatus = async () => {
      try {
        // 세션 유효성 확인 API 호출
        const response = await apiInstance.get<UserSession>('/session/info');
        if (response.data) {
          dispatch(setUser(response.data));
        } else {
          clearSession(); // 응답이 있지만 데이터가 없는 경우 로그아웃 처리
        }
      } catch {
        // 401 에러면 오류창 대신 경고(warn)만 띄움
        clearSession();
      }
    };

    const clearSession = () => {
      // 로그아웃 액션 디스패치
      dispatch(logout());
      
      // 로컬 스토리지에서 인증 관련 데이터 제거
      // localStorage.removeItem('token'); // 필요시 토큰 제거
    };

    checkAuthStatus();
  }, [dispatch]);

  return null;
} 