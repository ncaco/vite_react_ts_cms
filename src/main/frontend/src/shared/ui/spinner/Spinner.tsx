import React from 'react';

interface SpinnerProps {
  size?: 'sm' | 'md' | 'lg';
  color?: 'primary' | 'secondary' | 'white' | 'gray';
  className?: string;
  label?: string;
  fullPage?: boolean; // 전체 페이지 로딩 여부
}

/**
 * 로딩 상태를 표시하는 스피너 컴포넌트
 */
const Spinner: React.FC<SpinnerProps> = ({ 
  size = 'md', 
  color = 'primary',
  className = '',
  label,
  fullPage = false
}) => {
  // 크기별 클래스
  const sizeClasses = {
    sm: 'w-4 h-4 border-2',
    md: 'w-8 h-8 border-3',
    lg: 'w-12 h-12 border-4'
  };
  
  // 색상별 클래스
  const colorClasses = {
    primary: 'border-primary-500 border-t-transparent',
    secondary: 'border-gray-500 border-t-transparent',
    white: 'border-white border-t-transparent',
    gray: 'border-gray-300 border-t-gray-100'
  };
  
  return (
    <div className={`
      flex flex-col items-center justify-center
      ${fullPage ? 'py-10 w-full' : ''}
      ${className}
    `}>
      <div
        className={`
          rounded-full animate-spin
          ${sizeClasses[size]}
          ${colorClasses[color]}
        `}
        role="status"
        aria-label={label || "로딩 중"}
      />
      {label && (
        <span className="mt-2 text-sm text-gray-500">{label}</span>
      )}
    </div>
  );
};

export default Spinner; 