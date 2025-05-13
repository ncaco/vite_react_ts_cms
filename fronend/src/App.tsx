import { useState } from 'react';
import './App.css';
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
    <div className="app-container">
      <h1>리덕스로 세션 관리하기</h1>
      
      {loading && <p>로딩 중...</p>}
      {error && <p className="error-message">{error}</p>}
      
      {isAuthenticated ? (
        <div className="user-info">
          <h2>로그인 상태</h2>
          <p>사용자 이름: {user?.username}</p>
          <p>이메일: {user?.email}</p>
          <p>역할: {user?.roles?.join(', ')}</p>
          <div className="button-group">
            <button onClick={handleLogout} className="logout-button">로그아웃</button>
            <button onClick={checkSession} className="check-button">세션 확인</button>
          </div>
        </div>
      ) : (
        <div className="login-form">
          <h2>로그인</h2>
          <form onSubmit={handleLogin}>
            <div className="form-group">
              <label htmlFor="username">사용자 이름:</label>
              <input
                id="username"
                type="text"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                required
              />
            </div>
            <div className="form-group">
              <label htmlFor="password">비밀번호:</label>
              <input
                id="password"
                type="password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
              />
            </div>
            <button type="submit" className="login-button">로그인</button>
          </form>
        </div>
      )}
    </div>
  );
}

export default App;
