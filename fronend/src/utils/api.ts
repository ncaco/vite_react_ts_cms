import axios from 'axios';
import { store } from '../redux/store';
import { resetSession } from '../redux/slices/sessionSlice';

// axios 인스턴스 생성
const api = axios.create({
  baseURL: 'http://localhost:8080', // 백엔드 서버 URL
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json',
  },
});

// 요청 인터셉터
api.interceptors.request.use(
  (config) => {
    const state = store.getState();
    const token = state.session.user?.token;
    
    // 토큰이 있으면 요청 헤더에 추가
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// 응답 인터셉터
api.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    // 401 Unauthorized 에러 처리
    if (error.response && error.response.status === 401) {
      // 세션 만료 - 로그아웃 처리
      store.dispatch(resetSession());
    }
    
    return Promise.reject(error);
  }
);

export default api; 