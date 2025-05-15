import React, { ButtonHTMLAttributes, useState, useRef, useEffect, CSSProperties } from 'react';
import ReactDOM from 'react-dom';

type IconType = 'plus' | 'edit' | 'delete' | 'search' | 'detail' | 'arrow-right' | 'menu' | 'user' | 'mypage' | 'favorite' | 'home' | 'logout' | 'setting' | 'example' | 'start' | 'dashboard' | 'default' | 'check' | 'close';
type ButtonVariant = 'primary' | 'secondary' | 'outline' | 'danger' | 'success' | 'white';
type ButtonSize = 'xs' | 'sm' | 'md' | 'lg';
type TooltipPosition = 'top' | 'bottom' | 'left' | 'right';

interface IconButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  icon: IconType;
  variant?: ButtonVariant;
  size?: ButtonSize;
  rounded?: 'full' | 'md';
  label?: string; // 접근성을 위한 aria-label
  tooltip?: string; // 툴팁 텍스트
  tooltipPosition?: TooltipPosition; // 툴팁 위치
}

interface TooltipStyleProps {
  top?: number;
  bottom?: number;
  left?: number;
  right?: number;
  transform?: string;
}

const IconButton: React.FC<IconButtonProps> = ({
  icon,
  variant = 'primary',
  size = 'md',
  rounded = 'md',
  className = '',
  label,
  tooltip,
  tooltipPosition = 'top',
  ...props
}) => {
  const [isHovered, setIsHovered] = useState(false);
  const [showTooltip, setShowTooltip] = useState(false);
  const [tooltipStyle, setTooltipStyle] = useState<TooltipStyleProps>({});
  const buttonRef = useRef<HTMLButtonElement>(null);
  
  // 버튼 변형에 따른 스타일
  const variantClasses = {
    primary: 'bg-primary-500 hover:bg-primary-600 text-white',
    secondary: 'bg-gray-100 hover:bg-gray-200 text-gray-800',
    outline: 'bg-white border border-gray-300 hover:bg-gray-50 text-gray-700',
    danger: 'bg-red-500 hover:bg-red-600 text-white',
    success: 'bg-green-500 hover:bg-green-600 text-white',
    white: 'bg-white border border-gray-200 text-gray-600 hover:border-gray-300 hover:text-gray-800'
  };

  // 버튼 크기에 따른 스타일
  const sizeClasses = {
    xs: 'p-1 text-xs',
    sm: 'p-1.5 text-sm',
    md: 'p-2 text-base',
    lg: 'p-2.5 text-lg'
  };
  
  // 아이콘 크기 설정
  const iconSizeClasses = {
    xs: 'w-3.5 h-3.5',
    sm: 'w-4 h-4',
    md: 'w-5 h-5',
    lg: 'w-6 h-6'
  };
  
  // 둥근 모서리 설정
  const roundedClasses = {
    full: 'rounded-full',
    md: 'rounded-md'
  };
  
  // 그림자 효과
  const shadowClass = isHovered ? 'shadow-md' : 'shadow-sm';

  // SVG 아이콘 경로 가져오기
  const getIconSrc = () => {
    return `/icons/${icon}.svg`;
  };

  // 툴팁 위치 계산
  useEffect(() => {
    if (showTooltip && buttonRef.current) {
      const buttonRect = buttonRef.current.getBoundingClientRect();
      let style: TooltipStyleProps = {};
      
      switch (tooltipPosition) {
        case 'top':
          style = {
            bottom: window.innerHeight - buttonRect.top + 10,
            left: buttonRect.left + buttonRect.width / 2,
            transform: 'translateX(-50%)'
          };
          break;
        case 'bottom':
          style = {
            top: buttonRect.bottom + 10,
            left: buttonRect.left + buttonRect.width / 2,
            transform: 'translateX(-50%)'
          };
          break;
        case 'left':
          style = {
            top: buttonRect.top + buttonRect.height / 2,
            right: window.innerWidth - buttonRect.left + 10,
            transform: 'translateY(-50%)'
          };
          break;
        case 'right':
          style = {
            top: buttonRect.top + buttonRect.height / 2,
            left: buttonRect.right + 10,
            transform: 'translateY(-50%)'
          };
          break;
      }
      
      setTooltipStyle(style);
    }
  }, [showTooltip, tooltipPosition]);

  const classes = [
    'inline-flex items-center justify-center',
    variantClasses[variant],
    sizeClasses[size],
    roundedClasses[rounded],
    shadowClass,
    'transition-all duration-200',
    className
  ].join(' ');

  const handleMouseEnter = () => {
    setIsHovered(true);
    setShowTooltip(true);
  };

  const handleMouseLeave = () => {
    setIsHovered(false);
    setShowTooltip(false);
  };

  // 툴팁 화살표 스타일
  const getTooltipArrowStyle = () => {
    let arrowClass = '';
    
    switch (tooltipPosition) {
      case 'top':
        arrowClass = 'after:content-[""] after:absolute after:left-1/2 after:top-full after:transform after:-translate-x-1/2 after:border-8 after:border-transparent after:border-t-primary-500';
        break;
      case 'bottom':
        arrowClass = 'after:content-[""] after:absolute after:left-1/2 after:bottom-full after:transform after:-translate-x-1/2 after:border-8 after:border-transparent after:border-b-primary-500';
        break;
      case 'left':
        arrowClass = 'after:content-[""] after:absolute after:top-1/2 after:left-full after:transform after:-translate-y-1/2 after:border-8 after:border-transparent after:border-l-primary-500';
        break;
      case 'right':
        arrowClass = 'after:content-[""] after:absolute after:top-1/2 after:right-full after:transform after:-translate-y-1/2 after:border-8 after:border-transparent after:border-r-primary-500';
        break;
    }
    
    return arrowClass;
  };

  return (
    <button 
      ref={buttonRef}
      className={classes} 
      aria-label={label || tooltip || `${icon} button`}
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
      {...props}
    >
      <img 
        src={getIconSrc()} 
        alt="" 
        className={iconSizeClasses[size]}
        aria-hidden="true" 
      />
      
      {tooltip && showTooltip && ReactDOM.createPortal(
        <div 
          className={`
            fixed z-50 px-3 py-2 
            text-xs font-medium 
            text-white bg-primary-500
            rounded-lg shadow-lg 
            whitespace-nowrap pointer-events-none
            max-w-xs
            break-words
            border border-primary-600
            animate-fadeIn
            ${getTooltipArrowStyle()}
          `}
          role="tooltip"
          style={tooltipStyle as CSSProperties}
        >
          {tooltip}
        </div>,
        document.body
      )}
    </button>
  );
};

export default IconButton; 