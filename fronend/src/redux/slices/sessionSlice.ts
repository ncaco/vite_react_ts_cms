import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import type { PayloadAction } from '@reduxjs/toolkit';
import axios from 'axios';
import api from '../../utils/api';

// 세션 사용자 타입 정의
export interface User {
  id: number;
  username: string;
  email: string;
  roles: string[];
  token: string;
}

// 세션 상태 타입 정의
export interface SessionState {
  user: User | null;
  isAuthenticated: boolean;
  loading: boolean;
  error: string | null;
}

// 초기 상태
const initialState: SessionState = {
  user: null,
  isAuthenticated: false,
  loading: false,
  error: null,
};

// 로그인 Thunk 액션 생성
export const loginUser = createAsyncThunk(
  'session/login',
  async (credentials: { username: string; password: string }, { rejectWithValue }) => {
    try {
      // 실제 API 엔드포인트 호출
      const response = await api.post('/api/auth/login', credentials);
      return response.data;
    } catch (error: unknown) {
      if (axios.isAxiosError(error)) {
        return rejectWithValue(error.response?.data?.message || '로그인 실패');
      }
      return rejectWithValue('로그인 실패');
    }
  }
);

// 로그아웃 Thunk 액션 생성
export const logoutUser = createAsyncThunk('session/logout', async (_, { rejectWithValue }) => {
  try {
    // 실제 API 엔드포인트 호출
    await api.post('/api/auth/logout');
    return;
  } catch (error: unknown) {
    if (axios.isAxiosError(error)) {
      return rejectWithValue(error.response?.data?.message || '로그아웃 실패');
    }
    return rejectWithValue('로그아웃 실패');
  }
});

// 현재 세션 사용자 정보 가져오기
export const fetchCurrentUser = createAsyncThunk(
  'session/fetchCurrentUser',
  async (_, { rejectWithValue }) => {
    try {
      const response = await api.get('/api/auth/me');
      return response.data;
    } catch (error: unknown) {
      if (axios.isAxiosError(error)) {
        return rejectWithValue(error.response?.data?.message || '사용자 정보 가져오기 실패');
      }
      return rejectWithValue('사용자 정보 가져오기 실패');
    }
  }
);

// 세션 슬라이스 생성
const sessionSlice = createSlice({
  name: 'session',
  initialState,
  reducers: {
    // 세션 초기화 리듀서
    resetSession: (state) => {
      state.user = null;
      state.isAuthenticated = false;
      state.error = null;
    },
    // 로컬 스토리지에서 세션 복원 리듀서
    restoreSession: (state, action: PayloadAction<User>) => {
      state.user = action.payload;
      state.isAuthenticated = true;
    },
  },
  extraReducers: (builder) => {
    // 로그인 상태 처리
    builder
      .addCase(loginUser.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(loginUser.fulfilled, (state, action) => {
        state.loading = false;
        state.user = action.payload;
        state.isAuthenticated = true;
      })
      .addCase(loginUser.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload as string;
      });

    // 로그아웃 상태 처리
    builder
      .addCase(logoutUser.pending, (state) => {
        state.loading = true;
      })
      .addCase(logoutUser.fulfilled, (state) => {
        state.loading = false;
        state.user = null;
        state.isAuthenticated = false;
      })
      .addCase(logoutUser.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload as string;
      });

    // 현재 사용자 정보 가져오기 상태 처리
    builder
      .addCase(fetchCurrentUser.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(fetchCurrentUser.fulfilled, (state, action) => {
        state.loading = false;
        state.user = action.payload;
        state.isAuthenticated = true;
      })
      .addCase(fetchCurrentUser.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload as string;
      });
  },
});

export const { resetSession, restoreSession } = sessionSlice.actions;
export default sessionSlice.reducer; 