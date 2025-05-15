import axios from 'axios';

const baseURL = 'http://localhost:8080/api'; // 백엔드 서버 URL

export const apiInstance = axios.create({
  baseURL,
  headers: {
    'Content-Type': 'application/json',
  },
  withCredentials: true, // 중요: 세션 쿠키를 요청에 포함
});

// 요청 인터셉터 추가
apiInstance.interceptors.request.use(
  (config) => {
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// 응답 인터셉터 추가
apiInstance.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    return Promise.reject(error);
  }
);

export default apiInstance; 