import React, { ButtonHTMLAttributes } from 'react';

type ButtonVariant = 'primary' | 'secondary' | 'outline' | 'text';
type ButtonSize = 'small' | 'medium' | 'large';

interface ButtonProps extends ButtonHTMLAttributes<HTMLButtonElement> {
  variant?: ButtonVariant;
  size?: ButtonSize;
  fullWidth?: boolean;
  children: React.ReactNode;
}

const Button: React.FC<ButtonProps> = ({
  variant = 'primary',
  size = 'medium',
  fullWidth = false,
  children,
  className = '',
  ...props
}) => {
  // 버튼 변형에 따른 스타일
  const variantClasses = {
    primary: 'bg-primary text-white hover:bg-primary/90',
    secondary: 'bg-secondary text-white hover:bg-secondary/90',
    outline: 'bg-transparent text-primary border border-primary hover:bg-primary/10',
    text: 'bg-transparent text-primary hover:underline px-0',
  };

  // 버튼 크기에 따른 스타일
  const sizeClasses = {
    small: 'py-1.5 px-3 text-xs',
    medium: 'py-2 px-4 text-sm',
    large: 'py-3 px-6 text-base',
  };

  const classes = [
    'inline-flex items-center justify-center rounded font-medium transition-colors',
    variantClasses[variant],
    sizeClasses[size],
    fullWidth ? 'w-full' : '',
    variant !== 'text' ? 'border-0' : '',
    props.disabled ? 'opacity-60 cursor-not-allowed' : 'cursor-pointer',
    className,
  ].join(' ');

  return (
    <button className={classes} {...props}>
      {children}
    </button>
  );
};

export default Button; 