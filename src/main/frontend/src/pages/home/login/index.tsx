import React, { useState } from 'react';

const Login: React.FC = () => {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [rememberMe, setRememberMe] = useState(false);

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        // 로그인 처리 로직 구현
        console.log({ email, password, rememberMe });
    };

    return (
        <div className="flex min-h-screen bg-primary-50">
            <div className="hidden lg:block lg:w-1/2 relative">
                <div className="absolute inset-0 bg-gradient-to-b from-primary-400 to-primary-800 overflow-hidden">
                    <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-primary-500/0 via-primary-500/40 to-primary-900/70"></div>
                    <div className="absolute inset-0 overflow-hidden">
                        <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 w-[120%] aspect-square">
                            <div className="absolute inset-0 rounded-full border-[20px] border-primary-300/20"></div>
                        </div>
                    </div>
                    
                    <div className="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2">
                        <div className="w-48 h-48 rounded-full border-8 border-primary-300 shadow-2xl bg-transparent flex items-center justify-center">
                            <div className="w-40 h-40 rounded-full border-4 border-primary-300 bg-primary-600 bg-opacity-50 flex items-center justify-center">
                                <div className="w-32 h-32 rounded-full bg-white"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div className="w-full lg:w-1/2 flex flex-col justify-center p-8">
                <div className="max-w-md mx-auto w-full">
                    <h1 className="text-3xl font-bold text-primary-900 mb-2">Home에 오신 것을 환영합니다</h1>
                    <p className="text-primary-500 mb-8">로그인 정보를 입력해주세요.</p>
                    
                    <form onSubmit={handleSubmit}>
                        <div className="mb-4">
                            <label htmlFor="email" className="block text-sm font-medium text-primary-700 mb-1">이메일</label>
                            <input
                                id="email"
                                type="email"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                                className="w-full px-3 py-2 border border-primary-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-300"
                                placeholder="이메일 주소 입력"
                                required
                                onInvalid={e => (e.currentTarget.setCustomValidity('이메일을 입력해주세요.'))}
                                onInput={e => (e.currentTarget.setCustomValidity(''))}
                            />
                        </div>
                        
                        <div className="mb-4">
                            <label htmlFor="password" className="block text-sm font-medium text-primary-700 mb-1">비밀번호</label>
                            <input
                                id="password"
                                type="password"
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                                className="w-full px-3 py-2 border border-primary-300 rounded-md focus:outline-none focus:ring-2 focus:ring-primary-500 focus:border-primary-300"
                                placeholder="••••••••"
                                required
                                onInvalid={e => (e.currentTarget.setCustomValidity('비밀번호를 입력해주세요.'))}
                                onInput={e => (e.currentTarget.setCustomValidity(''))}
                            />
                        </div>
                        
                        <div className="flex items-center justify-between mb-6">
                            <div className="flex items-center">
                                <input
                                    id="remember-me"
                                    type="checkbox"
                                    checked={rememberMe}
                                    onChange={(e) => setRememberMe(e.target.checked)}
                                    className="h-4 w-4 text-primary-600 focus:ring-primary-500 border-primary-300 rounded"
                                />
                                <label htmlFor="remember-me" className="ml-2 block text-sm text-primary-700">
                                    아이디 저장
                                </label>
                            </div>
                            <div className="text-sm">
                                <a href="#" className="font-medium text-primary-600 hover:text-primary-500">
                                    비밀번호 찾기
                                </a>
                            </div>
                        </div>
                        
                        <div className="space-y-3">
                            <button
                                type="submit"
                                className="w-full flex justify-center py-2 px-4 border border-primary-300 rounded-md shadow-sm text-sm font-medium text-white bg-primary-600 hover:bg-primary-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500"
                            >
                                로그인
                            </button>
                            
                            <button
                                type="button"
                                className="w-full flex justify-center items-center py-2 px-4 border border-primary-300 rounded-md shadow-sm text-sm font-medium text-primary-700 bg-white hover:bg-primary-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-primary-500"
                            >
                                <svg className="w-5 h-5 mr-2" viewBox="0 0 24 24">
                                    <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4" />
                                    <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853" />
                                    <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05" />
                                    <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335" />
                                </svg>
                                구글 계정으로 로그인
                            </button>
                        </div>
                    </form>
                    
                    <p className="mt-8 text-center text-sm text-primary-600">
                        계정이 없으신가요?{' '}
                        <a href="#" className="font-medium text-primary-600 hover:text-primary-500">
                            회원가입
                        </a>
                    </p>
                </div>
                <div className="mt-8 text-center text-xs text-primary-400">
                    © Untitled UI 2023
                </div>
            </div>
        </div>
    );
};

export { Login };