import { useState } from 'react';
import apiInstance from '@/shared/api';
import axios from 'axios';
import { useDispatch } from 'react-redux';
import { setUser as setAuthUser, logout as logoutAction } from '@/app/store';

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
            dispatch(logoutAction());
            setUser(null);
            setLoading(false);
        } catch (err: unknown) {
            console.error('로그아웃 오류:', err);
            setError('로그아웃 중 오류가 발생했습니다.');
            setLoading(false);
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

    return {
        user,
        loading,
        error,
        login,
        logout,
        fetchSession,
    };
}
