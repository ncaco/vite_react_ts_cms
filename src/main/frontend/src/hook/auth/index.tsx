import { useState } from 'react';
import apiInstance from '@/shared/api';
import axios from 'axios';
import { useDispatch, useSelector } from 'react-redux';
import { setUser as setAuthUser, logout as logoutAction, selectCurrentUser } from '@/app/store';
import { useNavigate, useLocation } from 'react-router-dom';

interface LoginParams {
    userId: string;
    password: string;
}

interface UserSession {
    userId: string;
    userNm: string;
    authrtCd: string;
    loginDt: string;
    lastAccessDt?: string;
}

export function useAuth() {
    const [user, setUser] = useState<UserSession | null>(null);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState<string | null>(null);
    const dispatch = useDispatch();
    const storeUser = useSelector(selectCurrentUser);
    const navigate = useNavigate();
    const location = useLocation();

    // 로그인 함수
    const login = async ({ userId, password }: LoginParams) => {
        setLoading(true);
        setError(null);
        try {
            const response = await apiInstance.post<UserSession>('/session/login', {
                userId,
                password,
            });

            dispatch(setAuthUser(response.data));
            setUser(response.data);
            setLoading(false);
            return response.data;
        } catch (err: unknown) {
            // AxiosError 타입 체크
            if (axios.isAxiosError(err)) {
                setError(
                    err.response?.data || '로그인 중 오류가 발생했습니다.'
                );
            } else {
                setError('로그인 중 오류가 발생했습니다.');
            }
            setLoading(false);
            return null;
        }
    };

    // 로그아웃 함수 (세션 만료 처리)
    const logout = async () => {
        setLoading(true);
        setError(null);
        try {
            // 서버에 로그아웃 API가 있다면 호출 (예: /session/logout)
            await apiInstance.post('/session/logout');
            
            // Redux 스토어에서 사용자 정보 제거
            dispatch(logoutAction());
            setUser(null);
            
            // 로컬 스토리지에서 필요한 인증 관련 데이터 제거 (토큰 등)
            // localStorage.removeItem('token'); // 사용 중인 경우
            
            // 로그아웃 후 현재 경로에 해당하는 로그인 페이지로 이동
            const basePath = location.pathname.split('/')[1] || '';
            const loginPath = basePath ? `/${basePath}/login` : '/login';
            
            setLoading(false);
            navigate(loginPath, { replace: true });
        } catch (err: unknown) {
            console.error('로그아웃 오류:', err);
            setError('로그아웃 중 오류가 발생했습니다.');
            setLoading(false);
            
            // 오류가 발생해도 클라이언트 측에서는 로그아웃 처리
            dispatch(logoutAction());
            setUser(null);
            
            // 로그인 페이지로 이동
            const basePath = location.pathname.split('/')[1] || '';
            const loginPath = basePath ? `/${basePath}/login` : '/login';
            navigate(loginPath, { replace: true });
        }
    };

    // 세션 정보 조회 (선택적)
    const fetchSession = async () => {
        setLoading(true);
        setError(null);
        try {
            const response = await apiInstance.get<UserSession>('/session/info');
            dispatch(setAuthUser(response.data));
            setUser(response.data);
            setLoading(false);
            return response.data;
        } catch (err: unknown) {
            console.error('세션 조회 오류:', err);
            setUser(null);
            setLoading(false);
            return null;
        }
    };

    // 인증 상태 확인
    const isAuthenticated = !!storeUser;

    return {
        user: storeUser || user,
        loading,
        error,
        login,
        logout,
        fetchSession,
        isAuthenticated,
    };
}

export { useAuthCheck } from './useAuthCheck';
