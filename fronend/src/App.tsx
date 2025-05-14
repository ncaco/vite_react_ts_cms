import { useState } from 'react';
import { useSession } from './redux/hooks';
import { loginUser, logoutUser, fetchCurrentUser } from './redux/slices/sessionSlice';

function App() {
  const { user, isAuthenticated, loading, error, dispatch } = useSession();
  const [username, setUsername] = useState('');
  const [password, setPassword] = useState('');

  const handleLogin = (e: React.FormEvent) => {
    e.preventDefault();
    if (username && password) {
      dispatch(loginUser({ username, password }));
    }
  };

  const handleLogout = () => {
    dispatch(logoutUser());
  };

  const checkSession = () => {
    dispatch(fetchCurrentUser());
  };

  return (
    <div className="w-full max-w-md mx-auto p-6 bg-white dark:bg-gray-800 rounded-xl shadow-card">
      <h1 className="text-2xl md:text-3xl font-bold text-center text-primary-700 dark:text-primary-300 mb-6">리덕스로 세션 관리하기</h1>
      
      {loading && (
        <div className="flex justify-center my-4">
          <div className="animate-pulse text-center text-gray-600 dark:text-gray-400">로딩 중...</div>
        </div>
      )}
      
      {error && (
        <div className="bg-red-50 dark:bg-red-900/30 border-l-4 border-red-500 p-4 mb-4 rounded">
          <p className="text-red-700 dark:text-red-300">{error}</p>
        </div>
      )}
      
      {isAuthenticated ? (
        <div className="bg-gray-50 dark:bg-gray-700/50 p-5 rounded-lg">
          <h2 className="text-xl font-semibold text-gray-800 dark:text-gray-200 mb-4 pb-2 border-b border-gray-200 dark:border-gray-700">로그인 상태</h2>
          
          <div className="space-y-3 mb-6">
            <p className="text-gray-700 dark:text-gray-300 flex items-center">
              <span className="font-medium text-gray-900 dark:text-white mr-2">사용자 이름:</span> 
              <span>{user?.username}</span>
            </p>
            <p className="text-gray-700 dark:text-gray-300 flex items-center">
              <span className="font-medium text-gray-900 dark:text-white mr-2">이메일:</span> 
              <span>{user?.email}</span>
            </p>
            <p className="text-gray-700 dark:text-gray-300 flex items-center">
              <span className="font-medium text-gray-900 dark:text-white mr-2">역할:</span> 
              <span>{user?.roles?.join(', ')}</span>
            </p>
          </div>
          
          <div className="flex space-x-3">
            <button 
              onClick={handleLogout} 
              className="btn btn-danger flex-1">
              로그아웃
            </button>
            <button 
              onClick={checkSession} 
              className="btn btn-primary flex-1">
              세션 확인
            </button>
          </div>
        </div>
      ) : (
        <div className="bg-gray-50 dark:bg-gray-700/50 p-5 rounded-lg">
          <h2 className="text-xl font-semibold text-gray-800 dark:text-gray-200 mb-4 pb-2 border-b border-gray-200 dark:border-gray-700">로그인</h2>
          
          <form onSubmit={handleLogin} className="space-y-4">
            <div>
              <label htmlFor="username" className="form-label">사용자 이름:</label>
              <input
                id="username"
                type="text"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                required
                className="form-input"
                placeholder="사용자 이름 입력"
              />
            </div>
            
            <div>
              <label htmlFor="password" className="form-label">비밀번호:</label>
              <input
                id="password"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
                className="form-input"
                placeholder="비밀번호 입력"
              />
            </div>
            
            <button 
              type="submit" 
              className="btn btn-primary w-full mt-6">
              로그인
            </button>
          </form>
        </div>
      )}
    </div>
  );
}

export default App;
