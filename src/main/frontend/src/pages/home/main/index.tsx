import React from 'react';
import { useSelector } from 'react-redux';
import { selectCurrentUser } from '@/app/store';
import { useDispatch } from 'react-redux';
import { logout } from '@/app/store';

const Main: React.FC = () => {
    const user = useSelector(selectCurrentUser);
    const dispatch = useDispatch();

    console.log(user);

    return (
        <div>
            <h1>홈 페이지</h1>
            <p>현재 로그인한 사용자: {user?.userNm}</p>
            <button onClick={() => dispatch(logout())}>로그아웃</button>
        </div>
    );
};

export { Main };