import { configureStore, createSlice, PayloadAction, createAsyncThunk } from '@reduxjs/toolkit';

// 유저 세션 타입 정의
interface UserSession {
  userId: string;
  userNm: string;
  authrtCd: string;
  loginDt: string;
  lastAccessDt?: string;
}

// 초기 상태
interface AuthState {
  user: UserSession | null;
  loading: boolean;
  error: string | null;
}

const initialState: AuthState = {
  user: null,
  loading: false,
  error: null,
};

// 비동기 로그아웃 thunk: 로그아웃 후 지정 경로로 이동
export const logoutAndRedirect = createAsyncThunk<
  void,
  string, // redirectPath
  { rejectValue: string }
>('auth/logoutAndRedirect', async (redirectPath, { dispatch, rejectWithValue }) => {
  try {
    // 서버 로그아웃 API 호출 (필요시)
    // await apiInstance.post('/session/logout');
    dispatch(logout());
    // 지정된 경로로 이동
    window.location.href = redirectPath;
  } catch (err: unknown) {
    console.error('로그아웃 오류:', err);
    return rejectWithValue('로그아웃 중 오류가 발생했습니다.');
  }
});

// auth 슬라이스 생성
const authSlice = createSlice({
  name: 'auth',
  initialState,
  reducers: {
    setUser(state, action: PayloadAction<UserSession | null>) {
      state.user = action.payload;
    },
    setLoading(state, action: PayloadAction<boolean>) {
      state.loading = action.payload;
    },
    setError(state, action: PayloadAction<string | null>) {
      state.error = action.payload;
    },
    logout(state) {
      state.user = null;
      state.loading = false;
      state.error = null;
    },
  },
  extraReducers: (builder) => {
    builder
      .addCase(logoutAndRedirect.pending, (state) => {
        state.loading = true;
        state.error = null;
      })
      .addCase(logoutAndRedirect.fulfilled, (state) => {
        state.loading = false;
        state.user = null;
        state.error = null;
      })
      .addCase(logoutAndRedirect.rejected, (state, action) => {
        state.loading = false;
        state.error = action.payload || '로그아웃 실패';
      });
  },
});

export const { setUser, setLoading, setError, logout } = authSlice.actions;

// Redux 스토어 설정
export const store = configureStore({
  reducer: {
    auth: authSlice.reducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: false, // 직렬화 검사 비활성화 (필요한 경우)
    }),
  devTools: process.env.NODE_ENV !== 'production',
});

// 타입 정의
export type RootState = ReturnType<typeof store.getState>;
export type AppDispatch = typeof store.dispatch;

// 유저 정보 셀렉터
export const selectCurrentUser = (state: RootState) => state.auth.user;