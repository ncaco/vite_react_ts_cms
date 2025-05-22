import React from 'react';
import { useSelector } from 'react-redux';
import { selectCurrentUser } from '@/app/store';
import { useAuth } from '@/hook/auth';

const Main: React.FC = () => {
    const user = useSelector(selectCurrentUser);
    const { logout, loading } = useAuth();

    const handleLogout = async () => {
        await logout();
        // 로그아웃 함수 내에서 리다이렉트를 처리하므로 추가 작업 불필요
    };

    return (
        <div className="p-8 max-w-4xl mx-auto">
            <h1 className="text-2xl font-bold mb-4">홈 페이지</h1>
            <div className="bg-white p-6 rounded-lg shadow-md mb-6">
                <h2 className="text-xl font-semibold mb-2">사용자 정보</h2>
                {user ? (
                    <div className="space-y-2">
                        <p><span className="font-medium">사용자 ID:</span> {user.userId}</p>
                        <p><span className="font-medium">이름:</span> {user.userNm}</p>
                        <p><span className="font-medium">권한:</span> {user.authrtCd}</p>
                        <p><span className="font-medium">로그인 시간:</span> {user.loginDt}</p>
                        {user.lastAccessDt && (
                            <p><span className="font-medium">마지막 접속:</span> {user.lastAccessDt}</p>
                        )}
                    </div>
                ) : (
                    <p>사용자 정보를 불러오는 중...</p>
                )}
            </div>
            
            <button 
                onClick={handleLogout}
                disabled={loading}
                className="px-4 py-2 bg-red-600 text-white rounded hover:bg-red-700 disabled:bg-red-300 disabled:cursor-not-allowed"
            >
                {loading ? '로그아웃 중...' : '로그아웃'}
            </button>
        </div>
    );
};

export { Main };