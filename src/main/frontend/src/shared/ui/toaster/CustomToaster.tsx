import { Toaster } from 'react-hot-toast';

export const CustomToaster = () => {
    return (
        <Toaster
            position="top-center"
            gutter={16}
            containerClassName="toast-container"
            toastOptions={{
                duration: 3000,
                // 공통 스타일
                style: {
                    background: '#f8f9fa',
                    color: '#333',
                    padding: '12px 16px',
                    borderRadius: '12px',
                    boxShadow: '0 4px 12px rgba(0, 0, 0, 0.1)',
                    fontSize: '15px',
                    fontFamily: '-apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif',
                    fontWeight: '500',
                    letterSpacing: '-0.01em',
                    display: 'flex',
                    alignItems: 'center',
                    justifyContent: 'space-between',
                    width: '100%',
                    maxWidth: '400px',
                    lineHeight: '1.4',
                },
                // 성공 토스트
                success: {
                    style: {
                        backgroundColor: '#ecf9ee',
                        borderLeft: '4px solid #4ade80',
                    },
                    iconTheme: {
                        primary: '#4ade80',
                        secondary: 'white',
                    },
                },
                // 에러 토스트
                error: {
                    style: {
                        backgroundColor: '#fdf1f1',
                        borderLeft: '4px solid #ef4444',
                    },
                    iconTheme: {
                        primary: '#ef4444',
                        secondary: 'white',
                    },
                },
            }}
        />
    );
}

export default CustomToaster;